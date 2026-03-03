Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F55EC144C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 13:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBE810E80D;
	Tue,  3 Mar 2026 13:42:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A34910E813
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772545318; x=1804081318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jDt0rdqXTV2cCyCnuu11YL+c5wibJcozQyVSlAW3/Rc=;
 b=a1xSgIFPLklXKF+tVv7F8O9dhPdwf/2+bL1vUt+7O/1MetZJfPepYMoJ
 ZusOIEGrhSCsRe73aWsvAax913VD+8C75RtItIFlaOOHpozrTYEjbJFRA
 /t8GeAeJyzeFVjQBNLFYMiiwnCe2XvnSjrpmLrBWdjB0L+g/QtSbHX2di
 D50f78N8THs8SHBLnuB6P3nrNxMSlZoDVgYm4F4LYVQRiYN7K1Xbg7Yin
 nucWjrpTVS07kaJTg8RYAanT1vqud5j7K5wwHF+vL9yil40R0atVxmLHx
 7S7lmbWUnfnKjer2Zez2er94Uqb6vd8Y5aRjjScahOrGemkL+H7ATvOSD g==;
X-CSE-ConnectionGUID: oslEvaBBRpmLulResouFGQ==
X-CSE-MsgGUID: A9pcf0YYTOaqJPJq+uP0DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73492570"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73492570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:41:57 -0800
X-CSE-ConnectionGUID: 8WpjBc79TXaAXgCjAYDxRw==
X-CSE-MsgGUID: rJcIM4z1T4mrVflRgbRdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217975231"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:41:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:41:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 05:41:56 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:41:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvxeQ6jzHDeT4LRSJnVPa1eS5mmIgxxwrATErV4DxDJIcneZgjoi5IoLTXv4kPB1CSmVt3rTFUHmZ1RIFfTHQRPJ9rUu+BCsvcT7raJPTfi0zxklqnfVrKVacQhAIX5unPlkFbIaB86loKNTYxYPH1/is2tEbvNItJI3zuobOHgdxbOFhE9Sjed0Pm5tQnyCeNgRJquPIioH3DCNImenXcl3iTf1pOoa6c77idoB5/Ug3hc4zVt2wcASZLvtIFsoP5dAIBLjKyPn1ZVVEWEL08Rfn9CUQunYFTl8rdSfeBR20PodQxJ/1PX1gbKTZ7QFAn+XZJ4qmb/uFNULtJLtHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ixn7DEY64fD8YnRo69zTfE1PMekuQwCHqd0ZkDc59Y=;
 b=sasDYPJSIlaQD+IlpIsbcGq1wnQBBawHGVQZ/CWVCrR3IKzDr/E90J9kAxrjDsFDeb78Rr4ieClRkQ9WfMirPNZOHu5dJt9DlxLnvJvRO1YO1cf6zOigGvisdKh4XhYAxWpYTet525m2bji1dDz99Ro7wlhzlktPUpEVT4xjoKSFnVIQR2V2rVwRRljeO5hThOQpyIElvsTAkb9/Pjsaz3CrpeAhOlMQc/eJqAMJzPZZpCWuk/80o41G3kRBoIw3HvhXfwzxKfqIOEpPUsc3j8BZtoU/gzGSs1rwSTr/b+9Gs4iUqCTSAU4XJUwVvb3LUKUzu1nmlJELNsmWtC1ZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7138.namprd11.prod.outlook.com (2603:10b6:806:2a1::5)
 by PH3PPF97652A3E1.namprd11.prod.outlook.com (2603:10b6:518:1::d3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 3 Mar
 2026 13:41:49 +0000
Received: from SN7PR11MB7138.namprd11.prod.outlook.com
 ([fe80::7ccb:84e7:50c3:c201]) by SN7PR11MB7138.namprd11.prod.outlook.com
 ([fe80::7ccb:84e7:50c3:c201%3]) with mapi id 15.20.9654.014; Tue, 3 Mar 2026
 13:41:49 +0000
Message-ID: <dbe6a615-e2e6-455f-9a7e-f7d5eb8f9c09@intel.com>
Date: Tue, 3 Mar 2026 19:11:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
To: Matt Roper <matthew.d.roper@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Hellstrom, Thomas"
 <thomas.hellstrom@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
 <cee11fc6bf06997d88c0b100c0ec2ecbde512cb7.camel@intel.com>
 <20260227003012.GZ4694@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <20260227003012.GZ4694@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::14) To SN7PR11MB7138.namprd11.prod.outlook.com
 (2603:10b6:806:2a1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7138:EE_|PH3PPF97652A3E1:EE_
X-MS-Office365-Filtering-Correlation-Id: e2929224-2ab1-4d3c-27e9-08de792a9e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: Rv8+B15cQ6Pnqb8h0FpXcnQFkF/vjWLRW4Evs9ansW38fxssf1y5fR33D9KKS+3PDchzWyIkAlhLDjWZvm/S0v0IRUMeG6vR9Gb57CaMafhUq0jFFy2NuctqLU22xkP3WckEKAkVRdroiwTFFWW+Praz93BTSfcMI0pxK1OixQu8medr+MGigtOgCaLdj+w1Qr00z5ZE8e1XlzSHpNSbTUTKWjCdcZnDS1Km7KzeFQVG3EBcW1o88pktpQQAPqSvYZJZB/AKjI3O7Ux86/D6wyiFGKd9ACVS535Gx6xx9gp3VSxluaCg8oTJGp/lzjTJ+1BJ8hnjnah3bpHkwL3LM9iLXulopxK9QGxz69/a73MzxPz/UT4ujUDn0353lM2jxdLHEkye2XveQOdgj2OFJxG0YzO4df1D51tklX6nZBTWudQlsZaFnhOtijCTThmGN65Z3hPwhlXbZWJm5c439PMLGSMrSF/C6SgLK8p6ttX8qxZEgtlqAm/GvZ1t2i1p93SmSyzB74QqMHpT81+tJWHhdYDaTIj97krWbXE15a3aW5M3auLeZeyzzAbvnayLmRgbo7EVMLG50Am4dR63O43q/zgfi6do9RQYny9PcUptOlGfkUcrIduv20KkCKtu/KsFY9LtJ0r65g7bS+/3CcgmUlHciF3o3IPjfj+HD/NRV8odtMvshwmuBvlmalmdti0ufo5+jXoKblRF6fAEh7W2+jqbbttWH0ajLKxSr2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXpoZml1b0MyUU1tVWt5Ymx5bXU1T2xMZ0w5YWhjRk5KTmpjUEhJTzg2NXhn?=
 =?utf-8?B?Nk05alpFVW1JL2N3cXhlU2xDTWdUcHRGVWkwaTRXU2RBRzg2TWhFSWk4Yzh5?=
 =?utf-8?B?UHJKSXVZbEpuUFlhUXJhNnBIeVZuemhWQk5TcVlxSlVvVkp1WjIzV2o5Y09y?=
 =?utf-8?B?WnpCSmgzTDYxdk5lNHpoS3U5U1B3WStKTTR2NFJMbGN0VWx1YnZUSGVEVmhI?=
 =?utf-8?B?Q0hKS1hya1lpTGF3dmpKRndqK1UyNkluS2I2WjBLd1ZvR1dFeTZzWTVnMGhu?=
 =?utf-8?B?Zkt2YmNqL3RQOU9XTmhQMnllSnNqYVh0Wm16N3pZQ0pJWnNBS2h2TXJSYVVM?=
 =?utf-8?B?M2VmUllMVGFZdnZVczRNbVNXbFJ0ZkszNXRuQVhQMCtDNkprUFY1bEMva2lF?=
 =?utf-8?B?dWt0c204ZVBYRjgzRG9TVVcyVXlLKytCWUlIOWZvUm9WL25veEFtSnhYM01C?=
 =?utf-8?B?RnVCcnNwUWNDV2dMMzltK1Z0ZVhJL2IxVHR1dnpVZTNmZ1k0Q3h2RW9lU01I?=
 =?utf-8?B?VXlaNnE3ckZ2dUVvZFJBRDZJaEgvbzlRTkhWUWtYekNJYXFjQWpaR0JMRkFw?=
 =?utf-8?B?cWNkSDN2aVo1bityd3ZWMDRwN3RyRkRkNmYvSFpxSXlGNmI0SmdLN2ozK29R?=
 =?utf-8?B?QWhEWFFablpEOExMbW5tSGN5UW12YzNzTm10bXVvR2E1MGRDMFdHR080Wk9u?=
 =?utf-8?B?ZWlKR0NoRCtEMzdkUm0wdFdZbERGazAwNTNEek9DdnE2b3pYWG1iYi9sd1Ro?=
 =?utf-8?B?YlI3TmhmdHJBTTJESWYzSy9YL3lSODU0SUVNRVlMQnRrSE9lYVVvWjdpUVZj?=
 =?utf-8?B?bkRwYWlhTEZPK2lSM1Z1OG51bHFhdUZiVW1sL2U2TUVPWGlHK2xMSDFsMVRs?=
 =?utf-8?B?aUZpUWJhNVUvMFdzUElqUS9RcnA5YnVNZFYxQm9vN2ljdFJtc1diL28xbndu?=
 =?utf-8?B?S2luUXVkTHc0WndWbk40Z0ZzbWlseW05Wm1yUThmM0t1dHdzb3JwbUx3WkRt?=
 =?utf-8?B?RE01cmpVSFA1QWg2QjFPd3ZuNGFuak8ybkJkdW8zQTFRcjJFYkJrV280TUc3?=
 =?utf-8?B?aTRmUXFtS1kvSWF0RUFEN0pVUUpFNWJwellRNTRweHNOdHNOU09URDlMdG5s?=
 =?utf-8?B?UkxFTDRVOVQyZW9MbGkyQmFBT3ltYXNpeHNLUTk5Zm94UStPNWsrc0hhYmNX?=
 =?utf-8?B?VXVuVmZ2Zk1IM28rSFhpZU1KSjVwMWdUMWlSbjZyMjllK0d5Vy9haW5tU0Fu?=
 =?utf-8?B?dnZpYlZkOCtRL2NsekgzUlNoaTJCU1daSitFbk5Mb01ySFBRN0haKzkxZWk3?=
 =?utf-8?B?YTZoYk9lUEliWEh6VG9NU2pTQTZwdEl4eE5zdlVackhOODhDUGM4b1BsWGpl?=
 =?utf-8?B?dzJsWFl3MkVudGFsNG1vQm5JZGxRSXdxVllzK1BqODZxVjczQmVoaGx6K2JO?=
 =?utf-8?B?c1E5VnNVNUdCc0N5MGxURUxPWFk0c3NTM2tCeHRaZEpHV1UwcHJaRmRWaEZH?=
 =?utf-8?B?WTR0WWVLUzR1MHU2Y2IwZVRjMnFXbFBDWmpUa1IxNzBOL3ZsNnBtRVAxQXRN?=
 =?utf-8?B?MUlZaXVreUt1dTZibHVhbFpCTG04QjFzUW9qU01LcFJlTFo5anJyemxoeGN2?=
 =?utf-8?B?RTdPS2NUNTFVRXNLV2dqTk9nb0R2TnU4eHpseGVPRnh4NVMxZGUwcDZZaU1J?=
 =?utf-8?B?Vkk3ZVJRUy9rRkVvUG82TGV6MXA0bEtVWk9PZjRNSlBHSDZZN05pRFNnaVVZ?=
 =?utf-8?B?V2sxNkJuQ0tteDl2bVZYRWJlS0d6dVk3TjJPRENpMDRjQWVJOVM0cm5EOHdK?=
 =?utf-8?B?a2NVYmlVUW9VU1NtMWhsVERPTDRVaXA0eldCV1VYZFhtdkdUUXhUOWZ5Q29I?=
 =?utf-8?B?OHR2c3l1ZUg2OFcvd0ZmOWZVaTBNT2hUSVRPTG1lbW42WmhUNjRpQWVndGFp?=
 =?utf-8?B?dHFSdFNQaCtFU0o5eTlqUWxrb3p2VzNjZnkxN3RmT2RSMHgyTVZFajd0b1g1?=
 =?utf-8?B?azVlVzZCNFlNZko3bnoxdy84S0Z1VFlGVEJSMWZ6bSszZUNmQ3k1akJqMDJE?=
 =?utf-8?B?RlQrekV6NTJZVHB3emUwMkNYRE04N3NkQ0hSdnVHdkIvOXl0Qmd6blRvQWsy?=
 =?utf-8?B?SFlRZnVmRVNHVnhLdGpqOUFLa2dydzVXVHgxTWdhQlREWWNBd2s3TSt6eTZ4?=
 =?utf-8?B?Nmo4dm12dkY2RFprMFV5S3NJRU14RWgzckdVVFZidWpYV0RLV21pREVrcVFj?=
 =?utf-8?B?cksvY2lmTUkvaWJUZ3pTUCtnOEZ2YlZlU0NPUTdkZTN1VlVQbHdIRkc1Y2xk?=
 =?utf-8?B?Y2ZNUDBHeW9MUnlPOTFOcEdRSzJWWGg3dndQYW50ZnRodHJEa09zQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2929224-2ab1-4d3c-27e9-08de792a9e7b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:41:49.3070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBc4Jy892azkYqu2PjdDjO+g8qGh0BhUzLR+OuFvLijGL2ZWl8706JJDLREqFihhdvF5Vc0Dx5/8lgvKSVo8+zr6b1TqkDf3gesxnzNYqvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF97652A3E1
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 27-02-2026 06:00, Matt Roper wrote:
> On Thu, Feb 26, 2026 at 11:37:17PM +0000, Summers, Stuart wrote:
>> On Mon, 2026-02-16 at 19:21 +0530, Nareshkumar Gollakoti wrote:
>>>   While previously applied only to the BMG G21(Battle image) platform
>>>   via workaround Wa_14022085890,this 1.2 GHz minimum is now the
>>
>> nit: space after comma
>>
>>> default
>>>   for BMG and CRI platforms.
>>>
>>>   Setting this frequency floor(1.2GHz) default is critical in multi
>>> GPU
>>>   environment for supporting effective Peer-to-Peer(P2P) transactions.
>>>
>>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_pc.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> index 5e5495a39a3c..881054c9cf92 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -860,6 +860,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc
>>> *pc)
>>>   {
>>>          struct xe_tile *tile = gt_to_tile(pc_to_gt(pc));
>>>          int ret;
>>> +       struct xe_device *xe = pc_to_xe(pc);
>>>   
>>>          lockdep_assert_held(&pc->freq_lock);
>>>   
>>> @@ -885,7 +886,13 @@ static int pc_adjust_freq_bounds(struct
>>> xe_guc_pc *pc)
>>>          if (pc_get_min_freq(pc) > pc->rp0_freq)
>>>                  ret = pc_set_min_freq(pc, pc->rp0_freq);
>>>   
>>> -       if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890))
>>> +       /*
>>> +        * Setting GT RP min frequency to 1.2GHz by default for
>>> +        * all BMG and CRI(For BMG G21 WA do the same).
>>
>> Should we add a comment here that this is the active frequency, so if
>> the device is idle we aren't expecting high power output across the
>> board with this?
> 

Noted

> But I think we are going to see higher power because of this?  We're
> raising the minimum frequency that the GT is able to drop to, so during
> light usage (e.g., casual desktop use) we'd be using more power now.  I
> don't know how much extra power (and heat) the frequency change would
> translate to in real-world usage, but I imagine it's probably going to
> be measurable.
> 
> I'm a bit worried that we may be adding a power regression here for the
> majority of existing BMG users in an attempt to improve performance for
> a very specialized corner case (multi-GPU with cross-device sharing).
> Can't we tighten this logic up and only boost the minimum when we're
> sure there are multiple GPUs and/or there's actually cross-GPU sharing
> going on as suggested earlier in the thread?
> 
>>
>>> +        */
>>> +       if (XE_DEVICE_WA(tile_to_xe(tile), 14022085890) ||
>>> +           (xe->info.platform == XE_BATTLEMAGE ||
>>> +                        xe->info.platform == XE_CRESCENTISLAND))
> 
> Aside from the concerns above, I think we should also avoid putting
> exact platform matches in "random" functions in the driver when
> possible.  If this truly needs to be based solely on platforms then it
> should be a feature flag in the device descriptors for those platforms
> so that it's easy to extend when enabling new platforms in the future
> without needing to track down specific spots in the code like this.  Or
> maybe we can even use an existing feature flag --- is there anything
> truly specific to BMG/CRI here, or should this really be an 'is_dgpu'
> check?
> 
> If we can tighten up the condition based on runtime detection, then the
> condition here could either be a function call to a function that checks
> the necessary conditions, or an xe->info field that we can adjust
> elsewhere as the conditions change.
> 
> 
> Matt

Hi Matt/Vinay,

whats your thoughts after discussion with Ankur?
Let me know your ack on the same.

> 
>>
>> Thomas already mentioned the indentation. Would be nice to get an ack
>> also from Vinay (cc'd) on this one.
>>
>> Otherwise:
>> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>>
>> Thanks,
>> Stuart
>>

Noted Stuart and Thomas.

Thanks
Naresh

>>>                  ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>>> pc_get_min_freq(pc)));
>>>   
>>>   out:
>>
> 

