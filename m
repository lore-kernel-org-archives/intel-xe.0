Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54ECC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 20:41:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA7710E148;
	Mon, 27 Nov 2023 20:41:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27BBF10E148
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701117667; x=1732653667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1fbKh4WqJWY/7cCUGA9Z35QwtVhMNnRi1uSFgIhHaTE=;
 b=cCy+LhSN9rWgxtsbOTJdtRgfAUz+zzDYhnmLUh00WTvnI169PkZElllu
 8Bh/ZIvy8HxRGSzJ459MP7hPOOyJ0Dx9qINw4sh/QQ92NhmfV4r1qx4Gd
 RsWLY9b16DtEld4rDGjrzijqDcW2T8+qTkP+ejA2pVs+4qKBh3fHvf0it
 WC3yKq0jbHD1yjWqmo0q+ytEnP9OpHOQDoeyedzvIkwfeEGBlfqiEAnV0
 2O1Kcy3sIh2ItJEP3SE6m7UuULCIKBlnEpP7p+lskm+5vMdJd6dDI4N3K
 rBQeskImTsrcSR1iht2gDhRUyjJvBDW9Uznbpzg5Sv0p4AtkHWoiO+f6r w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="5977361"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="5977361"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 12:41:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="891855261"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="891855261"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 12:41:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:41:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:41:05 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 12:41:04 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 12:41:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gau9spmc+LGOnu/tiJIGH4RxKmRyw/UoW5xOygGim/V+6oYqsQgJsRTpCHQ+AFo3WC61/qnEptc4Da5VCtqJ/lrCmTl7GMhSxWJKLBxsSibkCyswuOIPmYeXBNQx+70+edhrYb7XSfseBaexdatHjvuNVzL8x2aIiimLQiGPTmJ/ajqnwN3iMc9QN4nXpRGfhKFaTV1Ubz5ZklzLoZ9a8cBjuiiSt4zeDRg+/m02eAMBdbSRAYkuX5QBbkmofjYfwRTeikNB5/5kboBxbIyRpTB8plhdxCjqumKwP7k5le3QTf2SaVYS0LdUeOQW5rG5nnnl6zgWkGRrGJNT07DqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUNaNBG0pLUUKAm4rPxq9NxOAKEogF49ArjY3TYw/r4=;
 b=Z85bSoJ8T8S4duu+P8T8ybCdAu0UfxK2r9UOreeu50fV9FLZM9nJvvs2a8cIjGsoqTLAxGstmG3cdVD1+UBMDerOdwZCovuUKSH7BUuATcXHY4JfhHJQB6NChS/LmzytGl5kaSSnG8OyC2/PG6CTuWHdbWuAas/wms4oCWh6TG0LQFaGtk2wlM9jVohkacqjzBAM2istr1aKn0JXxa5Iw2jfG1/N5GiTNlnlHLs+PKUKHElM4FA8xEte5n0k5sIA2sROvK8UiMVxymQBBv8+gNZNg82ADz+TfVLZxwu9Y4F1nzTvD3Jq0srUAnivNj9bba90xjjNtEFJBAx0Efio5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 20:41:02 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 20:41:01 +0000
Message-ID: <2144662b-4c97-4101-b6fd-cb092b7713d4@intel.com>
Date: Mon, 27 Nov 2023 12:40:59 -0800
User-Agent: Mozilla Thunderbird
To: Lucas De Marchi <lucas.demarchi@intel.com>, <fei.yang@intel.com>
References: <20231122204501.1353325-1-fei.yang@intel.com>
 <20231122204501.1353325-2-fei.yang@intel.com>
 <ymi5rgc3ba562kxellzosdndtlo23wwlsz75rrafxg6qfevmc4@owfjmqn5tesj>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <ymi5rgc3ba562kxellzosdndtlo23wwlsz75rrafxg6qfevmc4@owfjmqn5tesj>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0052.namprd17.prod.outlook.com
 (2603:10b6:a03:167::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: f90cd74d-e4e6-4172-1288-08dbef892b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FjXibfKukgJ2Sr437vKEPVryghCM1Pd47X7wVueM1fWqecxhvd9J/PyvBZgjz8qM+AUsBchyJ6Pe7NSH+dyXIqbVHJe9y8kP7epLVGd7uwRS4UvzB8BAUCw30hFb18Q3ZyYuEdy/k2DzvTwEKIOf3lhU/23kPbYg2IOHKDGzzUtk14oUeL2Jrd7Yp93d7/62KKF9TWU+3Mz9shhH9NZtQjX8coRwJWQbSCfXclOgV+rs13WLzmW4LXJREmHSwTpuZGKJu8WKBtWg5ItrfhjRpEYdoBINxj2dMUB0oWV5UuJQdk7Vn4Rt51G8tFnjeFiTN9nusjEQCH7n+QQLduidBs0XBGdJ6c/qjzo3uNmKaZGq8q/DcgC7TKfsjvfaaAaSIzZaFVvFEmXJFcN36iqu0FaZaf1ZX4ZyykF4fYJYcEFvRpMThLEYsFZXjSSyhtEMANHvA3/X9b6YmDKKYeKbbGfFLx0ZMuHN//5fCm0lZMRTdVZ63Sbs5T4yqBObu0D8Z3/3oBuV1QvLwf5EWxRJBXOf9cXZ4WCo1kUz85q8GIoHP9Rtpv77qR/IQ8Iq/zSxzr7b07SCxSfVJBiLLiNTKrzHTvsQCV5o6WYjLGr4/SuDsw6KPr5QGOFlXPnEXOKYkEd9Nx2bT2nizFkDJb+k+2fLw7tsS/axT8NZfK7il+1gBJCZ7Rcap2bgNF2d43G1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(31686004)(66946007)(41300700001)(53546011)(6512007)(8676002)(316002)(6636002)(8936002)(66476007)(66556008)(6506007)(478600001)(5660300002)(6486002)(4326008)(2616005)(107886003)(26005)(83380400001)(38100700002)(86362001)(31696002)(82960400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVFwMkxRaG9vNVFXQkltcVh0M0lLeFJyNVRyRUpCcXJnVVRSUkZUMTdaZ2ZP?=
 =?utf-8?B?dWpNbWZWMitGYy9udFlQQkdiaTF5UzNwNmI5ZXVYUjJMZ2JPMVg0Z3hKYmxt?=
 =?utf-8?B?NmpYVGlEck1NTjRxNHRYanBBZmlMemF3bGVMblc4N0FGUjFId2l0K25BYzBD?=
 =?utf-8?B?TU5haTNUaVRlT29WRHNhTXlsb3VFcVhrOGhpdGk5d3l4MWVaSzFsUnJmYUtk?=
 =?utf-8?B?cGVjWnFtM1pGU3ZZY3Uzcjd6VXdWeHo0LzRKeXNGclB5RVlZVmRVZWhIZCt6?=
 =?utf-8?B?V0VPWU1ZUVlFL3crcEFFQnIreVEzanF3MXZmT3AxNzNGcHFsdEtKd05SWnMv?=
 =?utf-8?B?cU1jQm1SOC9ackNSRC9oMkJNMUxkL09vdmpVWTFRY2pDS1pCMjRRT2RBdy9O?=
 =?utf-8?B?K3p6NEErazR2aUJnVWVzR3J6Q0hVY2t5VlpMZzI5bURzYjg3TzdDVU14MjEr?=
 =?utf-8?B?emlXL1V3RE1rSjNZOHZaZ2FtOXU4WnV6VzJEVVdIRm1uM0hEc1B2V2pDMWpl?=
 =?utf-8?B?VkorSG5ENE5VZjFOMDNzcGhySisrdTFqS1pUNWZ4dVg4MmwyTndQbjRIbDJj?=
 =?utf-8?B?QTFuSXlEK1ZjRi83ZDBBdEtRRmd6YjdZeFZIdDlGSk5sWXlTVExOdjFmSWR2?=
 =?utf-8?B?bWxNbUZTMWJLWk9Wd1ROcnVxcnNaWFkycjltZVhveE9oN2l6RWQrOWhsajF1?=
 =?utf-8?B?MFJXWDlLeHBTY0ZZUFByTVFZdzRQRFc3QTIydy9lMEVZVm9zMGZZaERxU1hm?=
 =?utf-8?B?aUtFNXF0d3dhbkQwOEhRd3psazhmalZGQ29aQjFVa2gwVythZ05naVdYUmtp?=
 =?utf-8?B?U3E4Q0luUk9CbUdOcFU5QS9PNGN0clRUUHp4TXFPUElZWkp1VHhpUFlxV1pU?=
 =?utf-8?B?UHd1N0Z3Q2pIYTlmL1dxMDFwcjV1Mnk0c0NpVXBYNktwV21xU1FaN0wwSHBl?=
 =?utf-8?B?UmtnNnNhaEdIWWFqTHk0Y1Q2Z2J5akRXeXZ5UExrOXY1Tk45UGlDSzhZTC9p?=
 =?utf-8?B?cHhvcVdyOGtXWk5COEw1RklNSXpSSnNTNmhzNG1aMXZJK0oxU2xwYXpSSERp?=
 =?utf-8?B?dHk4MUxzREYvMC95VHlYV0dtVnRTM0hsT0M1bUQxMmtETlpYem55WnVnNW45?=
 =?utf-8?B?L2JGWG84ZWVDTU9NdVpxK3I3UnUyRTdqUUJzc3Q3cmJDSUpDT0ZjeGZaZjU3?=
 =?utf-8?B?bElFenBXMEJ2RU5GcHd0cFQ3eUs2dW0rSlRFTzJzV05JRk9Iek85Wmk1Njhx?=
 =?utf-8?B?WUFEYXdiWjdmMjEyRVkwcExiNHpaWVlCejNjUEVQTlNNNzRXWmpmWHlrMm5o?=
 =?utf-8?B?dDZiYzBWK0NEWVVTYWh1YlFKdlhvU0xBalBoRTJSamhOSGtmMFMwMktHTFZq?=
 =?utf-8?B?QkQ2UThPM01yL0o2L0d2NnFVenM2cnArcGlTcGQ5S1ppY09TZUVjbWhZczJV?=
 =?utf-8?B?SGM2U2lkQ2I2YzdvOUpzQXhXOEJDdExNczhzZjQ2Kzk3NGpaZDB3KzZoQmNM?=
 =?utf-8?B?QURyZUpDTUVOM1FRZWNGaEh3TG5udkZhSjkrUTRsTGZ6VlVsS0QwTCtENGw5?=
 =?utf-8?B?RTMzbE5HWFRNdTlidGRqaFFFZkdDZEhtVFFNdmNKQ2hJUHZ0N3ZJUS9QbWt6?=
 =?utf-8?B?eFhaRzAvcmFtTm5JdmZVUkdzMExxSDZuUmU4eEJSMGgvS2t3aXpvWkg0QTgz?=
 =?utf-8?B?TWdOYmk3b3pmTXEvOHc0M1I5cmtocGpUNXhJS0g1SVdMZmtkY1Ewd3lDVUti?=
 =?utf-8?B?NG5XVVBId0FFOTg0YWdJbWFBSnN0MlpTVDhydnFhaWRJWW1CZEloWkJ2bC9F?=
 =?utf-8?B?c01WZVdNT3ZwQ3VQWGZwRkhwaFpWQXZhSERjUkY4Ym93WG01Y1RIM1FRSjdx?=
 =?utf-8?B?cURaKzJxQnhVYTJwNk9zSlRyWVlqVU1Hc2x5T1FSOEwxa0xjOUo0S2ljTG5s?=
 =?utf-8?B?R1VZSElob0I1VGo4aktPV3J4Nk50QU51bGVYUGdnQ0hRVkdZMElSQ2hIeEJu?=
 =?utf-8?B?SU8xVkdrVFU1ZHZVeGQvM0lDSWhoRVQzSiszK1V6QnJ5c2wyTG0zcHNUNWFM?=
 =?utf-8?B?Z2k2d1JaalczR1RtQ29NbEpvTDNoUVFLVEdSWnlZQ1E5bDR4VEFFRDB4QWcv?=
 =?utf-8?B?b3o1WFFWTUt2Szc5bDAzZ1premRWczFDNUJCR2J6bDhXV0tsa0FQZVhxOTly?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f90cd74d-e4e6-4172-1288-08dbef892b15
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 20:41:01.8514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CzS0KzmtSihYdJxC4aUHyED9hFZzxeNAmmI2YnxiOKeG+QnTcccL+0NwYqGXWuXIAGPgmAk0jl9ugUH5gd2gDPDybuD95VBgnC/iQP26HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: explicitly set GGTT access for
 GuC DMA
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
Cc: matthew.d.roper@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 11/27/2023 11:09 AM, Lucas De Marchi wrote:
> On Wed, Nov 22, 2023 at 12:45:01PM -0800, fei.yang@intel.com wrote:
>> From: Fei Yang <fei.yang@intel.com>
>>
>> Confirmed with hardware that setting GGTT memory access for GuC
>> firmware loading is correct for all platforms and required for
>> new platforms going forward.
>>
>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>> ---
>> drivers/gpu/drm/xe/regs/xe_guc_regs.h | 1 +
>> drivers/gpu/drm/xe/xe_uc_fw.c         | 3 ++-
>> 2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> index ba375fc51a87..92320bbc9d3d 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>> @@ -70,6 +70,7 @@
>> #define DMA_ADDR_1_HIGH                XE_REG(0xc30c)
>> #define   DMA_ADDR_SPACE_MASK            REG_GENMASK(20, 16)
>> #define   DMA_ADDRESS_SPACE_WOPCM REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 7)
>> +#define   DMA_ADDRESS_SPACE_GGTT REG_FIELD_PREP(DMA_ADDR_SPACE_MASK, 8)
>> #define DMA_COPY_SIZE                XE_REG(0xc310)
>> #define DMA_CTRL                XE_REG(0xc314)
>> #define   HUC_UKERNEL                REG_BIT(9)
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 3032c4f148d4..438ce51dd373 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -629,7 +629,8 @@ static int uc_fw_xfer(struct xe_uc_fw *uc_fw, u32 
>> offset, u32 dma_flags)
>>     /* Set the source address for the uCode */
>>     src_offset = uc_fw_ggtt_offset(uc_fw) + uc_fw->css_offset;
>>     xe_mmio_write32(gt, DMA_ADDR_0_LOW, lower_32_bits(src_offset));
>> -    xe_mmio_write32(gt, DMA_ADDR_0_HIGH, upper_32_bits(src_offset));
>
> not that this patch changes anything but this upper_32_bits() is a code
> smell. If uc_fw_ggtt_offset() can only return u32, why exactly we would
> try to get the upper 32 bits (and suppress the warning by doing 2x >>
> 16?). Humn... commit ee2dee81e484 ("drm/xe/huc: Extract version and 
> binary
> offset from new HuC headers") extracted css_offset and now we are
> adding 2 u32. So maybe keep the upper_32_bits(), but move src_offset to

This is still guaranteed to be a 32b number even after the sum, because 
we're adding an offset within the GGTT-mapped object and therefore the 
resulting value is still within the 32b address space.
AFAICT the reason we have upper_32_bits() calls in several places with 
GGTT offsets is because of a quirk of the HW specs: when 48b PPGTT was 
introduced back in gen8, all address fields in GT HW (not sure about the 
display side) have been updated to 48b, even the ones where the address 
was guaranteed to be GGTT and therefore 32b, and the specs have been 
updated to always say "write the upper 16 bits in the HDW reg/field" 
even if that is always guaranteed to be 0 for GGTT offsets. I'm guessing 
the aim on the specs side was to be ready if the GGTT ever gets bigger 
than 32b, so I think we should do the same in SW and proceed like you're 
suggesting with moving the variable to be a u64.

Daniele

> u64. That also matches what we have in i915. Before that commit, doing
> that write was basically always writting 0.
>
> With that,
>
>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
> +Daniele / +Matt Brost
>
> Lucas De Marchi
>
>> +    xe_mmio_write32(gt, DMA_ADDR_0_HIGH,
>> +            upper_32_bits(src_offset) | DMA_ADDRESS_SPACE_GGTT);
>>
>>     /* Set the DMA destination */
>>     xe_mmio_write32(gt, DMA_ADDR_1_LOW, offset);
>> -- 
>> 2.25.1
>>

