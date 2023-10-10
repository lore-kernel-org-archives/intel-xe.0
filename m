Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA573CD80AE
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 11:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C3E10E075;
	Tue, 10 Oct 2023 11:36:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6184010E075
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 11:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696937804; x=1728473804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z9x1tUVPfCu6ld+i4ynLzZR0YWMZQTx0DGXoTU2wXgI=;
 b=mORisbheeIBfrhOl87aKRoIVsecqe2d7rn6F9vBTLZnvjrBTOwfHMvYH
 +pS274GMVjezIwY3Uc/uxh2V2tNdIAO6AcW0SRaA+wr0K9Q+yg/hQ4v21
 6NO5SBmdHD2uDGbpBva7AEaIEUJo8ALYKPUmmBySJ6HkU3QWaQ2ycAMHM
 bNtYWsApW8ebHVfd+b0n34N53U516i3xK3LJDe3uJBTScMgDzRQYVpshd
 u5oAChoW40k3yj+o9b1/DZTbEvcJe2xClFb4Oj3uoyADiL7byEdwK3PSY
 l+X+2VaYQWecjY7ulEJysF5NQJRuE8RTtnHb1c/iF35sVYKzgr66/no8o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364667167"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="364667167"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 04:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="823745216"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="823745216"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2023 04:36:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 04:36:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 04:36:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 04:36:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 04:36:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF2svJa88/5BtbLKfNc2RhL5W4bxyklS6HX1gRpcCP/V1zLjTJFgmXYbWQMUWEtTpeHhymoc+hlfmF7mXaHQSpUN7KA61+iAiUAG9RFXaZH6qHrQVgloYl8omZaYg9ljCfYdmmU/Rxbu7QKJ+Lx9bbK9IFE6NQobsYNZgnoBZdXfuy9Em9L6NpYtK8RmK+GGI14K5uVfd9pJ5b/as+A9bqMp56+cy6fomc5XtqO89ic+kknb2fr97oYrfF99mYLIKWaMU/sOQO193JeeEvexF2AdY3ZQ+ffJB5x/ga94DSSW+qaFGbWIUQnXDZOFWoWGmfjgMVJwSyDIuhUp9FiQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMQeZVcfoGPLneis0WBbcZiJSaxGTQcx9Nne8U/uyHQ=;
 b=TZzT8czX04c0DANd3GUArWA/RboHisBUHkcwONvH3eZ7DwD8vj2CFm0p7r4ibTGJeL3i1wGPgKDtidLyJhZeH7VCW1gLHAWuSvUxFHXDMQ6zAlBSN7JFdg5sLqznsBsyeEdXjSESwW20qiXOnFKSJ1SkQwbeSGvIxKU+ONLj7KLJvS1OHS+y6g0xxdekn5e1UA68xSJ0ZLo0Esf7jipfEqMJjmxomiohvNJ4MdtoNHGNmOSFhV9BTIci/N+m3oeRpaHJd8OfMsd16F5i+Y7cntczayyrWE1o7lUGc9FGQAV8xz8g7bXl0zhVJ9vMRbdo2xQzO2NMDVXCCOSysU7+Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH3PR11MB8444.namprd11.prod.outlook.com (2603:10b6:610:1ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.39; Tue, 10 Oct
 2023 11:36:40 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::547b:6763:164a:4283%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 11:36:40 +0000
Message-ID: <f4f72b4e-526e-42a6-ae5a-48ce6a697947@intel.com>
Date: Tue, 10 Oct 2023 17:06:29 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
References: <20230929062420.394375-1-tejas.upadhyay@intel.com>
 <20230929062420.394375-3-tejas.upadhyay@intel.com>
 <ZRe5GQHmyqjs+wFU@nvishwa1-DESK>
 <DS7PR11MB6197414068E01310BE3EE87081CEA@DS7PR11MB6197.namprd11.prod.outlook.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <DS7PR11MB6197414068E01310BE3EE87081CEA@DS7PR11MB6197.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::16) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH3PR11MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: d223cc4b-45cb-4fad-19bc-08dbc9852b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kCXmehu2KedxtiImdJgXY2hWt3vCUr45uJmVfyrNCXoVXk7n6jGNe5T16GZtWIjza4v/XVU+w2ht6iO4Gn+QF3Kf3UaJRIwcP10qF+UtE99E9Rjh/XHpD7oKlaPMqaK+n2uf0FuHvNrJWmeHniFOyPbXuhcdDuPIaVZlS+bySizmFuYQp1j4+D/SCSs+kdAWTOIZTtPTApqNuDPiBWntWN9z/TAO9GQUe5bDbVJ1FA5Hbf1JS5ZzcAzzcn9CbaSSGQonHHcYi0IbJw7PbehgoQAWs6r1NtmJlcKfZvyEqtUvmcGe7ZDZEj8DbF1nMbSrqP0yfOSnOlAhUecz4J37NsXabiM1eeIbzna9LWrtGjTR7alzbE2uf9V5LGR9DVcXv3h4mdY8ExBQoj0hJWaLEMLcjFLUrqw/j7ud8t2a1xT+gj3Q/8T9qj+7B6DSUcEVJVXU0J8qy2apy6QV2GGlOnd60bQhbtycc4LWC6kDPXpZiomJi6IC4xsBYpQS6YzuIGMZhMqIaoNJxQoPCni0SVf69B/MxsWDsiHiZGbk/786fSnBLQFWciuzIkBgvy8Gq7fRqZiCNOpzkzKg8DzovQ1GRLRuaio90V9eaFxosYdKxUW9q8X/QkWgvbSXM/E7j9Fr+Ld5nqoOiUVCno1yhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(4326008)(83380400001)(26005)(82960400001)(8676002)(8936002)(6636002)(5660300002)(54906003)(66556008)(66946007)(316002)(41300700001)(110136005)(2906002)(6512007)(6506007)(53546011)(2616005)(107886003)(6486002)(478600001)(6666004)(66476007)(30864003)(15650500001)(38100700002)(36756003)(86362001)(31696002)(31686004)(66899024)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTUwcERqdUJJRmZMZE1IcHIvbTVxRU91by9kTFlSMGcxa1U1UStqaTJKMjkw?=
 =?utf-8?B?SkhIK2JoL20wb242a0IzQXpUZ05TVE95RXhmRGpkcFp5ZkNKUFM0Y1ViVXhV?=
 =?utf-8?B?NDVSc1g0N0o5RDdXZHJkdXJVbkpxais3VnZkSE5hTGNvL2tkdjZYU29KVnJu?=
 =?utf-8?B?M2JpWFVwT1liYVA5NnpNRTNUTGJ5anIxTjZmTUM1MjlQNFJMYWlmUjBIczVS?=
 =?utf-8?B?TUV4am1kRVpuRlpsUGoxanVOREt1NTZDMVhZWW1pY3JObHp5RGlRSFRRdHZO?=
 =?utf-8?B?YjRaenBaY2hwRXpEZG9WTGVLTU1jVHRpNXNhWFVuNmg3TFYvUmJHbnBMbXp5?=
 =?utf-8?B?RWRTNmJPblJ6ZS84d21NY05KWDRnaG95TTJCcFcwR2JDZkxEN05qNG1HSHVp?=
 =?utf-8?B?VjBML2VwL3RrR0xsRWVlMEhGYUlIMGxoQTBCamxBbWt1VHFIaTZ5aHlqdmVh?=
 =?utf-8?B?K1JDMHV1eGRxbytQNEFkVFcxSG00NmFaWklLTW1SZHpoYjdJeDFLRmN3YVcy?=
 =?utf-8?B?K0pnWEhmam1BZ2liNitZM0lVRkNyaXlHVFJpVERIM2d2bFM5OU1IQTJwbGhT?=
 =?utf-8?B?N3FyVCs2ZDdVc1ZKd3lKaDJNakdOY2F5akVqQzZDQ25yTENYS1dJWWVMUkdQ?=
 =?utf-8?B?MCsrNnE0bGNtdmMwKzlmM3l5U2lLdUtHMGtSdVY4Z2VyZlg3a2NSYWs5Qjc1?=
 =?utf-8?B?WUd5amNia2xtUlQ5MEN6NzZhd1E2M242cVhjeG1uNk9Cb2JvY1FkQVdJV0ls?=
 =?utf-8?B?cWdrNVlsSGFQRHVsc3NpQlJ5QjdWR1B2bjF1T2N2MDQzQmVsaGx0c25TN2ky?=
 =?utf-8?B?RWtDVy9raGtONldZeWVUU2NCZ29mTFRxQVd1ZFVnbGtOY0F4SDlpdi9nSGho?=
 =?utf-8?B?WlduL2xxL1hvVGoxTDdka1d0dzBiQksvK2M4c1FzQW1CbmhoS0VXZVhSbDFq?=
 =?utf-8?B?aGh4bHVCSTdTZ2dwVVBZaEpwajl0RVVwMWxGaXE0eGhrVjhrSnlEczBWTlYr?=
 =?utf-8?B?U3FYbG9jSWx2YzZXWC80RGgwL1R0Y0NmTitTTVlySVVVZlJyOTFSYWFuSitG?=
 =?utf-8?B?ejc3M3RJMGRBcHJOK0R5eUVUL2luVEc0eGViTEUyM01nZW1TS3FBVUFyNUw3?=
 =?utf-8?B?WUlhVjcwMDBRSURKNkFWcVlkd3NWQjFlNVE3czNOdEU1c1lIYjBUdHB6Q1lB?=
 =?utf-8?B?MTc4ekp3UWx3TGVLclB6b255OEhobW1acldMc3VLclBUVGhzSjNtRUZEY2ht?=
 =?utf-8?B?T2JBYmFRMFFsaUIxMnFxQUFTblB3OFBNc3VaNGlVRXdPWTcyRkpUb0dKUTJF?=
 =?utf-8?B?bGVZWlhTazEzZ2hoWWtMc21GQ25QNU1FVXlXU0diK3BaUVYxNnVQWVdseEdR?=
 =?utf-8?B?T0Z1RkNaeXJXcXBGU1JidnMwb0tmckxjdlJOeDk2RFNGRlYraW8rcjJpTFJy?=
 =?utf-8?B?aytGZ2doYXZmOWZLeTJ3YW1oWnVadWx2N1JVbmUrcGE0NkRhOGxKaWt1U0li?=
 =?utf-8?B?bGVBbmo2anBpQ2ZGNTcxMW50SkpHaVVJcy9tZGZ4MnRuTWtrZEJheDdiVk1B?=
 =?utf-8?B?bjBwa2NWZ0grakoyZGxaamUwbkpUek16WGM5TFpGZ0RXWWIwc3pacDJxckdQ?=
 =?utf-8?B?UjRpQkE1eTYzZlVHY3NRODN0YmpQQWFQdGl4amhabG9pUTR4MG91TjdodGtz?=
 =?utf-8?B?Z2J5RFNwelF4QlJqZ3NMZXNaYWxIcjZWc3AzcUxIS1NVdERiMnJoL0FlMThK?=
 =?utf-8?B?MkhBUFRreFY4NHF1bzhieGpkUkJabFBLRWJObjlIV3Z6SFdhNFdMQUJOaDNW?=
 =?utf-8?B?S05ucy84dXB1djBhYm1hN0JXYVFPWUZTSVdOUHJ6aU1ac25MZXIzQmlmUldr?=
 =?utf-8?B?aWFWQ2ZCdUM1cVRCQ09MUW5BSXdZOHVoRDdoSnlPVmxqMSs3N1cyUFEwVWlz?=
 =?utf-8?B?ZHEyc0V4a1dlV2tUbzBVbjFvekpPckVTQVRlUFYzd2dqa0I3MFBFTzdUMVpk?=
 =?utf-8?B?R2hsVHRXdmxaaCt6dlJpaTFXWWJDQ0RFa0M1dFdQbmFxak1uVnd5c1RnK3hn?=
 =?utf-8?B?YUFTOVRRciszK2xGWnBNMlhXYmk1ZXBZbUhhRmxjK2hQa2toS3VrUlRJdkpz?=
 =?utf-8?B?USs5d2N2aG8wSFR1OTEyQkNLbjNsdEJMR3JIQ01RSFhBakVocTNHUzhicVo1?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d223cc4b-45cb-4fad-19bc-08dbc9852b48
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 11:36:40.0793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tg+CpgRLGj5MNL2RUSMLFqZBC47mOo3bFe2V66YR5osIHybhr6+DqCMAJM0wUG3I1Y+asCmR+xb11n2L291bjyTiTnahn1hZdsrHDKDFb4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8444
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V5 2/2] drm/xe: Update counter for low level
 driver errors
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
Cc: "Roper@freedesktop.org" <Roper@freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko@freedesktop.org" <Wajdeczko@freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 09-10-2023 17:31, Upadhyay, Tejas wrote:
> 
> 
>> -----Original Message-----
>> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>> Sent: Saturday, September 30, 2023 11:29 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>> Cc: intel-xe@lists.freedesktop.org; Roper@freedesktop.org;
>> Wajdeczko@freedesktop.org; Roper, Matthew D
>> <matthew.d.roper@intel.com>
>> Subject: Re: [Intel-xe] [PATCH V5 2/2] drm/xe: Update counter for low level
>> driver errors
>>
>> On Fri, Sep 29, 2023 at 11:54:20AM +0530, Tejas Upadhyay wrote:
>>> we added a low level driver error counter and incrementing on each
>>> occurrance. Focus is on errors that are not functionally affecting the
>>> system and might otherwise go unnoticed and cause power/performance
>>> regressions, so checking for the error counters should help.
>>>
>>> Importantly the intention is not to go adding new error checks, but to
>>> make sure the existing important error conditions are propagated in
>>> terms of counter under respective categories like below :
>>> Under GT:
>>> driver_gt_guc_communication,
>>> driver_gt_other_engine,
>>> driver_gt_other
>>>
>>> Under Tile:
>>> driver_ggtt,
>>> driver_interrupt
>>>
>>> TODO: Currently this is just a counting of errors, later these counters
>>> will be reported through netlink interface when it is implemented and
>>> ready.
>>>
>>> V5:
>>>  - Dump err_type in string format
>>> V4:
>>>  - dump err_type in drm_err log - Himal
>>> V2:
>>>  - Use modified APIs
>>>
>>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_gt.c                  |  6 +++
>>> drivers/gpu/drm/xe/xe_gt.h                  |  1 +
>>> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 15 +++++--
>>> drivers/gpu/drm/xe/xe_guc.c                 | 15 ++++---
>>> drivers/gpu/drm/xe/xe_guc_ct.c              | 44 ++++++++++++-------
>>> drivers/gpu/drm/xe/xe_guc_pc.c              | 16 ++++---
>>> drivers/gpu/drm/xe/xe_guc_submit.c          | 47 +++++++++++++++------
>>> drivers/gpu/drm/xe/xe_irq.c                 |  6 ++-
>>> drivers/gpu/drm/xe/xe_reg_sr.c              | 20 ++++++---
>>> drivers/gpu/drm/xe/xe_tile.c                |  5 +++
>>> drivers/gpu/drm/xe/xe_tile.h                |  1 +
>>> 11 files changed, 123 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>> index a8b5f012588b..3c174b7430be 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>> @@ -47,6 +47,12 @@
>>> #include "xe_wa.h"
>>> #include "xe_wopcm.h"
>>>
>>> +const char *const xe_gt_drv_err_to_str[] = {
>>> +	[XE_GT_DRV_ERR_GUC_COMM] = "GUC COMMUNICATION",
>>> +	[XE_GT_DRV_ERR_ENGINE] = "ENGINE OTHER",
>>> +	[XE_GT_DRV_ERR_OTHERS] = "GT OTHER"
>>> +};
>>> +
>>> /**
>>>  * xe_gt_report_driver_error - Count driver error for gt
>>>  * @gt: GT to count error for
>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>> index 9442d615042f..70c131022f59 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>> @@ -67,6 +67,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt,
>> struct xe_hw_engine *hwe)
>>> 		hwe->instance == gt->usm.reserved_bcs_instance;  }
>>>
>>> +extern const char *const xe_gt_drv_err_to_str[];
>>> void xe_gt_report_driver_error(struct xe_gt *gt,
>>> 			       const enum xe_gt_drv_err_type err);
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> index bd6005b9d498..63a152d74176 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>>> @@ -9,6 +9,7 @@
>>> #include "xe_gt.h"
>>> #include "xe_guc.h"
>>> #include "xe_guc_ct.h"
>>> +#include "xe_tile.h"
>>> #include "xe_trace.h"
>>>
>>> #define TLB_TIMEOUT	(HZ / 4)
>>> @@ -35,8 +36,11 @@ static void xe_gt_tlb_fence_timeout(struct
>> work_struct *work)
>>> 			break;
>>>
>>> 		trace_xe_gt_tlb_invalidation_fence_timeout(fence);
>>> -		drm_err(&gt_to_xe(gt)->drm, "gt%d: TLB invalidation fence
>> timeout, seqno=%d recv=%d",
>>> -			gt->info.id, fence->seqno, gt-
>>> tlb_invalidation.seqno_recv);
>>> +		drm_err(&gt_to_xe(gt)->drm,
>>> +			"gt%d: TLB invalidation fence timeout, seqno=%d
>> recv=%d [%s]",
>>> +			gt->info.id, fence->seqno, gt-
>>> tlb_invalidation.seqno_recv,
>>> +			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
>>> +		xe_tile_report_driver_error(gt_to_tile(gt),
>> XE_TILE_DRV_ERR_GGTT);
>>>
>>> 		list_del(&fence->link);
>>> 		fence->base.error = -ETIME;
>>> @@ -329,8 +333,11 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int
>> seqno)
>>> 				 tlb_invalidation_seqno_past(gt, seqno),
>>> 				 TLB_TIMEOUT);
>>> 	if (!ret) {
>>> -		drm_err(&xe->drm, "gt%d: TLB invalidation time'd out,
>> seqno=%d, recv=%d\n",
>>> -			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv);
>>> +		drm_err(&xe->drm,
>>> +			"gt%d: TLB invalidation time'd out, seqno=%d,
>> recv=%d [%s]\n",
>>> +			gt->info.id, seqno, gt->tlb_invalidation.seqno_recv,
>>> +			xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_GGTT]);
>>> +		xe_tile_report_driver_error(gt_to_tile(gt),
>> XE_TILE_DRV_ERR_GGTT);
>>> 		return -ETIME;
>>
>> Should there be a more fine grained counter here and elsewhere?
>> For eg., this could be XE_TILE_TLB_INVAL_ERR instead of generic ERR_GGTT.
>> (btw, it is ppgtt tlb invalidation, not ggtt).
> 
> We do have error description along with ERR_GGTT type. Any comment @Iddamsetty, Aravind ?

I am not sure if we need such a fine granualarity, ideally we would want
to count all PPGGT and GGTT in one category so we can rename the
category as ERR_GTT.

Thanks,
Aravind.
> 
> Thanks,
> Tejas
> 
>>
>> Niranjana
>>
>>> 	}
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 84f0b5488783..a006de620b82 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -663,8 +663,9 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc,
>> const u32 *request,
>>> 			     50000, &reply, false);
>>> 	if (ret) {
>>> timeout:
>>> -		drm_err(&xe->drm, "mmio request %#x: no reply %#x\n",
>>> -			request[0], reply);
>>> +		drm_err(&xe->drm, "mmio request %#x: no reply %#x
>> [%s]\n",
>>> +			request[0], reply,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(gt,
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return ret;
>>> 	}
>>>
>>> @@ -697,16 +698,18 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc,
>> const u32 *request,
>>> 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT,
>> header);
>>> 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR,
>> header);
>>>
>>> -		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x\n",
>>> -			request[0], error, hint);
>>> +		drm_err(&xe->drm, "mmio request %#x: failure %#x/%#x
>> [%s]\n",
>>> +			request[0], error, hint,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(gt,
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -ENXIO;
>>> 	}
>>>
>>> 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) !=
>>> 	    GUC_HXG_TYPE_RESPONSE_SUCCESS) {
>>> proto:
>>> -		drm_err(&xe->drm, "mmio request %#x: unexpected reply
>> %#x\n",
>>> -			request[0], header);
>>> +		drm_err(&xe->drm, "mmio request %#x: unexpected reply
>> %#x [%s]\n",
>>> +			request[0], header,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(gt,
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> b/drivers/gpu/drm/xe/xe_guc_ct.c index 8b686c8b3339..f68d7fc2c486
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -732,8 +732,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,
>>> const u32 *action, u32 len,
>>>
>>> 	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>> 	if (!ret) {
>>> -		drm_err(&xe->drm, "Timed out wait for G2H, fence %u,
>> action %04x",
>>> -			g2h_fence.seqno, action[0]);
>>> +		drm_err(&xe->drm,
>>> +			"Timed out wait for G2H, fence %u, action %04x [%s]",
>>> +			g2h_fence.seqno, action[0],
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		xa_erase_irq(&ct->fence_lookup, g2h_fence.seqno);
>>> 		return -ETIME;
>>> 	}
>>> @@ -744,8 +746,10 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,
>> const u32 *action, u32 len,
>>> 		goto retry;
>>> 	}
>>> 	if (g2h_fence.fail) {
>>> -		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d,
>> hint %d",
>>> -			action[0], g2h_fence.error, g2h_fence.hint);
>>> +		drm_err(&xe->drm, "Send failed, action 0x%04x, error %d,
>> hint %d [%s]",
>>> +			action[0], g2h_fence.error, g2h_fence.hint,
>>> +
>> 	xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		ret = -EIO;
>>> 	}
>>>
>>> @@ -840,8 +844,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32
>> *msg, u32 len)
>>> 	origin = FIELD_GET(GUC_HXG_MSG_0_ORIGIN, hxg);
>>> 	if (unlikely(origin != GUC_HXG_ORIGIN_GUC)) {
>>> 		drm_err(&xe->drm,
>>> -			"G2H channel broken on read, origin=%d, reset
>> required\n",
>>> -			origin);
>>> +			"G2H channel broken on read, origin=%d, reset
>> required [%s]\n",
>>> +			origin,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		ct->ctbs.g2h.info.broken = true;
>>>
>>> 		return -EPROTO;
>>> @@ -859,8 +864,9 @@ static int parse_g2h_msg(struct xe_guc_ct *ct, u32
>> *msg, u32 len)
>>> 		break;
>>> 	default:
>>> 		drm_err(&xe->drm,
>>> -			"G2H channel broken on read, type=%d, reset
>> required\n",
>>> -			type);
>>> +			"G2H channel broken on read, type=%d, reset
>> required [%s]\n",
>>> +			type,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		ct->ctbs.g2h.info.broken = true;
>>>
>>> 		ret = -EOPNOTSUPP;
>>> @@ -918,12 +924,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct,
>> u32 *msg, u32 len)
>>> 							   adj_len);
>>> 		break;
>>> 	default:
>>> -		drm_err(&xe->drm, "unexpected action 0x%04x\n", action);
>>> +		drm_err(&xe->drm, "unexpected action 0x%04x [%s]\n",
>>> +			action,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 	}
>>>
>>> 	if (ret)
>>> -		drm_err(&xe->drm, "action 0x%04x failed processing,
>> ret=%d\n",
>>> -			action, ret);
>>> +		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d
>> [%s]\n",
>>> +			action, ret,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>>
>>> 	return 0;
>>> }
>>> @@ -958,8 +967,9 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg,
>> bool fast_path)
>>> 	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) +
>> GUC_CTB_MSG_MIN_LEN;
>>> 	if (len > avail) {
>>> 		drm_err(&xe->drm,
>>> -			"G2H channel broken on read, avail=%d, len=%d,
>> reset required\n",
>>> -			avail, len);
>>> +			"G2H channel broken on read, avail=%d, len=%d,
>> reset required [%s]\n",
>>> +			avail, len,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		g2h->info.broken = true;
>>>
>>> 		return -EPROTO;
>>> @@ -1026,9 +1036,11 @@ static void g2h_fast_path(struct xe_guc_ct *ct,
>> u32 *msg, u32 len)
>>> 		drm_warn(&xe->drm, "NOT_POSSIBLE");
>>> 	}
>>>
>>> -	if (ret)
>>> -		drm_err(&xe->drm, "action 0x%04x failed processing,
>> ret=%d\n",
>>> -			action, ret);
>>> +	if (ret) {
>>> +		drm_err(&xe->drm, "action 0x%04x failed processing, ret=%d
>> [%s]\n",
>>> +			action, ret,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(ct_to_gt(ct),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> +	}
>>> }
>>>
>>> /**
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> b/drivers/gpu/drm/xe/xe_guc_pc.c index d9375d1d582f..8fb180f706f4
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>> @@ -196,9 +196,11 @@ static int pc_action_query_task_state(struct
>>> xe_guc_pc *pc)
>>>
>>> 	/* Blocking here to ensure the results are ready before reading them
>> */
>>> 	ret = xe_guc_ct_send_block(ct, action, ARRAY_SIZE(action));
>>> -	if (ret)
>>> -		drm_err(&pc_to_xe(pc)->drm,
>>> -			"GuC PC query task state failed: %pe", ERR_PTR(ret));
>>> +	if (ret) {
>>> +		drm_err(&pc_to_xe(pc)->drm, "GuC PC query task state
>> failed: %pe [%s]",
>>> +			ERR_PTR(ret),
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(pc_to_gt(pc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> +	}
>>>
>>> 	return ret;
>>> }
>>> @@ -218,9 +220,11 @@ static int pc_action_set_param(struct xe_guc_pc
>> *pc, u8 id, u32 value)
>>> 		return -EAGAIN;
>>>
>>> 	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>>> -	if (ret)
>>> -		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed:
>> %pe",
>>> -			ERR_PTR(ret));
>>> +	if (ret) {
>>> +		drm_err(&pc_to_xe(pc)->drm, "GuC PC set param failed: %pe
>> [%s]",
>>> +			ERR_PTR(ret),
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(pc_to_gt(pc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> +	}
>>>
>>> 	return ret;
>>> }
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 870dc5c532fa..208ffde879ed 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1497,13 +1497,17 @@ g2h_exec_queue_lookup(struct xe_guc *guc,
>> u32 guc_id)
>>> 	struct xe_exec_queue *q;
>>>
>>> 	if (unlikely(guc_id >= GUC_ID_MAX)) {
>>> -		drm_err(&xe->drm, "Invalid guc_id %u", guc_id);
>>> +		drm_err(&xe->drm, "Invalid guc_id %u [%s]",
>>> +			guc_id,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return NULL;
>>> 	}
>>>
>>> 	q = xa_load(&guc->submission_state.exec_queue_lookup, guc_id);
>>> 	if (unlikely(!q)) {
>>> -		drm_err(&xe->drm, "Not engine present for guc_id %u",
>> guc_id);
>>> +		drm_err(&xe->drm, "Not engine present for guc_id %u [%s]",
>>> +			guc_id,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return NULL;
>>> 	}
>>>
>>> @@ -1532,7 +1536,9 @@ int xe_guc_sched_done_handler(struct xe_guc
>> *guc, u32 *msg, u32 len)
>>> 	u32 guc_id = msg[0];
>>>
>>> 	if (unlikely(len < 2)) {
>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>> +		drm_err(&xe->drm, "Invalid length %u [%s]",
>>> +			len,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> @@ -1542,8 +1548,10 @@ int xe_guc_sched_done_handler(struct xe_guc
>>> *guc, u32 *msg, u32 len)
>>>
>>> 	if (unlikely(!exec_queue_pending_enable(q) &&
>>> 		     !exec_queue_pending_disable(q))) {
>>> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>>> -			atomic_read(&q->guc->state));
>>> +		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
>>> +			atomic_read(&q->guc->state),
>>> +
>> 	xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> @@ -1577,7 +1585,9 @@ int xe_guc_deregister_done_handler(struct xe_guc
>> *guc, u32 *msg, u32 len)
>>> 	u32 guc_id = msg[0];
>>>
>>> 	if (unlikely(len < 1)) {
>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>> +		drm_err(&xe->drm, "Invalid length %u [%s]",
>>> +			len,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> @@ -1587,8 +1597,10 @@ int xe_guc_deregister_done_handler(struct
>> xe_guc
>>> *guc, u32 *msg, u32 len)
>>>
>>> 	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
>>> 	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
>>> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
>>> -			atomic_read(&q->guc->state));
>>> +		drm_err(&xe->drm, "Unexpected engine state 0x%04x [%s]",
>>> +			atomic_read(&q->guc->state),
>>> +
>> 	xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> @@ -1611,7 +1623,9 @@ int xe_guc_exec_queue_reset_handler(struct
>> xe_guc *guc, u32 *msg, u32 len)
>>> 	u32 guc_id = msg[0];
>>>
>>> 	if (unlikely(len < 1)) {
>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>> +		drm_err(&xe->drm, "Invalid length %u [%s]",
>>> +			len,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> @@ -1646,7 +1660,9 @@ int
>> xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32
>> *msg,
>>> 	u32 guc_id = msg[0];
>>>
>>> 	if (unlikely(len < 1)) {
>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>> +		drm_err(&xe->drm, "Invalid length %u [%s]",
>>> +			len,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> @@ -1672,7 +1688,9 @@ int
>> xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32
>> le
>>> 	u32 reason;
>>>
>>> 	if (unlikely(len != 3)) {
>>> -		drm_err(&xe->drm, "Invalid length %u", len);
>>> +		drm_err(&xe->drm, "Invalid length %u [%s]",
>>> +			len,
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_GUC_COMM]);
>>> +		xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_GUC_COMM);
>>> 		return -EPROTO;
>>> 	}
>>>
>>> @@ -1681,8 +1699,11 @@ int
>> xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32
>> le
>>> 	reason = msg[2];
>>>
>>> 	/* Unexpected failure of a hardware feature, log an actual error */
>>> -	drm_err(&xe->drm, "GuC engine reset request failed on %d:%d
>> because 0x%08X",
>>> -		guc_class, instance, reason);
>>> +	drm_err(&xe->drm,
>>> +		"GuC engine reset request failed on %d:%d because 0x%08X
>> [%s]",
>>> +		guc_class, instance, reason,
>>> +		xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
>>> +	xe_gt_report_driver_error(guc_to_gt(guc),
>> XE_GT_DRV_ERR_ENGINE);
>>>
>>> 	xe_gt_reset_async(guc_to_gt(guc));
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>>> index def9369eb488..3b773d055871 100644
>>> --- a/drivers/gpu/drm/xe/xe_irq.c
>>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>>> @@ -18,6 +18,7 @@
>>> #include "xe_guc.h"
>>> #include "xe_hw_engine.h"
>>> #include "xe_mmio.h"
>>> +#include "xe_tile.h"
>>>
>>> /*
>>>  * Interrupt registers for a unit are always consecutive and ordered
>>> @@ -222,8 +223,9 @@ gt_engine_identity(struct xe_device *xe,
>>> 		 !time_after32(local_clock() >> 10, timeout_ts));
>>>
>>> 	if (unlikely(!(ident & INTR_DATA_VALID))) {
>>> -		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not
>> valid!\n",
>>> -			bank, bit, ident);
>>> +		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not
>> valid! [%s]\n",
>>> +			bank, bit, ident,
>> xe_tile_drv_err_to_str[XE_TILE_DRV_ERR_INTR]);
>>> +		xe_tile_report_driver_error(gt_to_tile(mmio),
>> XE_TILE_DRV_ERR_INTR);
>>> 		return 0;
>>> 	}
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c
>>> b/drivers/gpu/drm/xe/xe_reg_sr.c index 87adefb56024..46ec3ade5577
>>> 100644
>>> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
>>> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
>>> @@ -126,11 +126,13 @@ int xe_reg_sr_add(struct xe_reg_sr *sr,
>>>
>>> fail:
>>> 	xe_gt_err(gt,
>>> -		  "discarding save-restore reg %04lx (clear: %08x, set: %08x,
>> masked: %s, mcr: %s): ret=%d\n",
>>> +		  "discarding save-restore reg %04lx (clear: %08x, set: %08x,
>>> +masked: %s, mcr: %s): ret=%d [%s]\n",
>>> 		  idx, e->clr_bits, e->set_bits,
>>> 		  str_yes_no(e->reg.masked),
>>> 		  str_yes_no(e->reg.mcr),
>>> -		  ret);
>>> +		  ret,
>>> +		  xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
>>> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
>>> 	reg_sr_inc_error(sr);
>>>
>>> 	return ret;
>>> @@ -207,7 +209,9 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr,
>> struct xe_gt *gt)
>>> 	return;
>>>
>>> err_force_wake:
>>> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
>>> +	xe_gt_err(gt, "Failed to apply, err=%d [%s]\n",
>>> +		  err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
>>> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
>>> }
>>>
>>> void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe) @@ -235,8
>>> +239,10 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>>> 	xa_for_each(&sr->xa, reg, entry) {
>>> 		if (slot == RING_MAX_NONPRIV_SLOTS) {
>>> 			xe_gt_err(gt,
>>> -				  "hwe %s: maximum register whitelist slots
>> (%d) reached, refusing to add more\n",
>>> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
>>> +				  "hwe %s: maximum register whitelist slots
>> (%d) reached, refusing to add more [%s]\n",
>>> +				  hwe->name, RING_MAX_NONPRIV_SLOTS,
>>> +
>> xe_gt_drv_err_to_str[XE_GT_DRV_ERR_ENGINE]);
>>> +			xe_gt_report_driver_error(gt,
>> XE_GT_DRV_ERR_ENGINE);
>>> 			break;
>>> 		}
>>>
>>> @@ -259,7 +265,9 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine
>> *hwe)
>>> 	return;
>>>
>>> err_force_wake:
>>> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
>>> +	drm_err(&xe->drm, "Failed to apply, err=%d [%s]\n",
>>> +		err, xe_gt_drv_err_to_str[XE_GT_DRV_ERR_OTHERS]);
>>> +	xe_gt_report_driver_error(gt, XE_GT_DRV_ERR_OTHERS);
>>> }
>>>
>>> /**
>>> diff --git a/drivers/gpu/drm/xe/xe_tile.c
>>> b/drivers/gpu/drm/xe/xe_tile.c index 708dd385f2b1..6f70e4cf3e03 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>>> @@ -71,6 +71,11 @@
>>>  *  - MOCS and PAT programming
>>>  */
>>>
>>> +const char *const xe_tile_drv_err_to_str[] = {
>>> +	[XE_TILE_DRV_ERR_GGTT] = "GGTT",
>>> +	[XE_TILE_DRV_ERR_INTR] = "INTERRUPT"
>>> +};
>>> +
>>> /**
>>>  * xe_tile_report_driver_error - Count driver error for tile
>>>  * @tile: Tile to count error for
>>> diff --git a/drivers/gpu/drm/xe/xe_tile.h
>>> b/drivers/gpu/drm/xe/xe_tile.h index 092a6b17a97e..a0e7a95f53e5 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile.h
>>> +++ b/drivers/gpu/drm/xe/xe_tile.h
>>> @@ -14,6 +14,7 @@ int xe_tile_alloc(struct xe_tile *tile);  int
>>> xe_tile_init_noalloc(struct xe_tile *tile);
>>>
>>> void xe_tile_migrate_wait(struct xe_tile *tile);
>>> +extern const char *const xe_tile_drv_err_to_str[];
>>> void xe_tile_report_driver_error(struct xe_tile *tile,
>>> 				 const enum xe_tile_drv_err_type err);
>>>
>>> --
>>> 2.25.1
>>>
