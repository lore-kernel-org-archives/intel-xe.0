Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B4DC197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 22:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5279010E70E;
	Thu, 16 Nov 2023 22:31:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232F010E70E
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 22:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700173905; x=1731709905;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yIbX/4m16yTz930zU+pjd/MziAsVxvfVI+E225JM9WQ=;
 b=RNE3AXrYH7YEFSi/u4FYUMlmQTubqApgJxb96semgxQ2yGMpjdJkBWPU
 48viXZiJVp4mCzrUs6thCVhLzEDXCS9WbRlJiFjNAKqP6t3LFNAqNJjFZ
 HLCTTvfk7MbpuFzUVPNnP1dtbbugpcooMh/QmnR/Bdk9lt8a0O7KJNJi6
 6oGBiCcvLmvs1T1A9wQJTikD5TQ/Y8mA+mZ1pQMMIY0e5cdt3W2wRBdtm
 KoDdSC/wgxQ5gzBlUKKUhUi2KlyM+po/0SVZEdLllbqylh03wGWZPCVVp
 JvNfaFRfpXobZvV0Mjsb0LkBuqojE6AcvXTOf2kXfLbx13DCXTNtCp4N3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="370549629"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="370549629"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 14:31:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="13274426"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 14:31:28 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 14:31:27 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 14:31:26 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 14:31:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 14:31:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XEn0NiZN0lYh+oJ0d/pjgR6q5uyQt2OgpiEWlyDajWciUQ+S4FRsKC+plq4kZtzTDQRO5yuB+ia6C9/IG9NwTMKjGOo6iB8JX360FkQzq84IBUtfIOASj5mjnPqwKxG0d7c/BiFBD2lmUXg0nS/6ZvgmWDzh66wn2f1IOVvGqMWxDRuDtGAX7n9T63e9xShIrahbkEviCVdyXbKIa0OWMgv1AzN+luL0uToNw5/pPeCYrLmtfYT2llPjztavMv1lbCnZkTGcTOdlnOonubdCT8ArQj7wv9ila52s6TLpjSYvOFdXwN0jQQYUkz0onWB0ltC+BCuJkyDfh9YmBzwQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzjpFFsg8TRoyzdYoh2mEU0oJmXoKW699ac6flCZNlg=;
 b=KI23NOs1BCFbiWdiDNdl+Y3jx1t/kb/UQP/kmqsERAepU7Ce9qOeDuPPjubv2Odl7GHb6zeAAN/tUGRXkfWuPILPNoHF0C27Ins5W7J3GyxKPMOfPGt65MkEhsAywjo45mhgRm0050gpVi0sRMLRisP/PKcYrWtEl6S1D9OVKDfMk6eb4jkEFRUPxDn3LDBLMdi16xJw9zKmym3RCVoMSOlA4g9r/6sqenCb6Qc8ZDm0PPpaqrkAIuqCCIyrt/JNAg3XjIsKs5guozc/KO+zVmh8p4TmFsGeAw8fNTynnAGsJY7EitG/C+oGEElRVnpMMM2fJenQBuo0ODUzd8fBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DM4PR11MB5552.namprd11.prod.outlook.com (2603:10b6:5:399::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 22:31:22 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 22:31:21 +0000
Message-ID: <40a3df04-2f5c-40e1-bef9-2775f27a202c@intel.com>
Date: Thu, 16 Nov 2023 14:31:18 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231115004615.2424177-1-daniele.ceraolospurio@intel.com>
 <20231115004615.2424177-2-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20231115004615.2424177-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DM4PR11MB5552:EE_
X-MS-Office365-Filtering-Correlation-Id: aec79909-a59b-4002-1c0b-08dbe6f3c1cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2Zt3CSt6HwIpdvjBVbn/I9x+Ha4LNv4x0h75yXU8epafP2bdHfTQR15PJiTPJGfvb6IpF22wR0QVGt1lGtOhS7Nu2ISdpVKC9tlgMpNYoNEvdDsQe5imrGDTyUS2E/pLyPfmtOi+I/PEaXkJ70Nb/gYpSz30Aw9Xu3nttYb2NPAoT+scVlrAtw2YjFJPmt74GJYMHo0DSLsw9UQ4m9PeJMhaPD0Q3X3H1fcitHFl8us2bMweMY6xWz7P+Z1PFesM10g/3wxHdpuqJ7WqgfU2SpEggUCjnmFdTQ3oARCt/N5JqdoQtSrhgliI7bYAqZ4ltPpcHHRt5m6GeYMVbmLgc/jSSEJgzo658+VXD5Fv3i34GTSZNhHkwVjBfKzvAffQktcf21KZ+QBsfV1Brh9KV74iNL7+HmCymUy2gL6tHVlzj6zUeEvP2EbzxcurV5Yx2Xzdwd+Fud/nfVc1lEV9QbCn2fj8un0nQaHX05xsh2tOG/pcDoNe8dTgXJvqjM0pK9SdSEKuCajQ5V0REJv16jEx94c6cF7o2fRQ/+2nNXgTHSBx+364q/dXZerNFej3zTOVjLT6J1kjoFb1Efj4wV25eh6mcvLiFAS61DAjZfPSAHIES63ad6x+sAXBQKeB8NuDus1mF4Ng1HM8gL+2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(66946007)(66476007)(41300700001)(316002)(66556008)(5660300002)(86362001)(31696002)(2906002)(4326008)(8936002)(8676002)(82960400001)(83380400001)(38100700002)(31686004)(6666004)(6486002)(478600001)(2616005)(36756003)(107886003)(6506007)(26005)(53546011)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTR0bDY5czZwUkxFNys0cUVhN2FNV3pObHEwNGU0NWJtT3lnL1Z6T1V5OWt5?=
 =?utf-8?B?Zlo5Mjl4QWxXaDZDcXVidVU0SjNHaWp4cysyaDZKcXpzRzVXMXhtY212NXF5?=
 =?utf-8?B?VlNHdURtNC9yeG9lVDc4dVFIQzFHdWt1YzEvRUNiSkdSL3U2UEswVnVyWXRD?=
 =?utf-8?B?YWNTU2l5UzJCbFlLbjU5QnlNdDA0c2dtTDVpYjFjeDdmOHRxQ1ZnR2lvSW13?=
 =?utf-8?B?Z3pwc04zcS9ibzZhb1F3a3NGS2cwZ3NKZzJLMXd6WjVtNk1ON3JlMXNJdW9x?=
 =?utf-8?B?cmcwV2E2aW1iMWIySnYwdmtNQUVROWoyaTRBMDYyb1YvWmpveVZQK2JqTitO?=
 =?utf-8?B?bE9sZHFVc1dhckdPdzVPY1ZpcDdCbUQvZksrUjN3OVU1QStMVW91UGp2dmk5?=
 =?utf-8?B?d3d5SmoxK0dQaVRQOTI1RnIxZHNFTnE1MTNhUy90cVRkUENhOHlzdFJmbTM1?=
 =?utf-8?B?UmpSN1Ftd2FkUGhNSjhmQjloYUJ6RnFnSHFKSkRPNXVubHh5cThmR2JQRStJ?=
 =?utf-8?B?V3A1am9zbmY3aGErWGpQTndOMEVsRkM0cWFVblQvMmx5dE9RSk9LMkxtNWd3?=
 =?utf-8?B?MzIzdjJGc1BNdzM1OTBZSkl5a24xbUZXY1lYV0drOFluZHE2WlF1RGUvTDlB?=
 =?utf-8?B?U29ZU3gzSDUvcE5Dd3RXaDhHSml1bDFoRFQ0ckwzUE9qVXdMNWJ3czA2UlN0?=
 =?utf-8?B?NnVxbDQwdkJmMGJqc0EyT1dxcGlldlRNc3RJNEk4ZnhwUlFIcTEwU3pyTktZ?=
 =?utf-8?B?VWYwaTFJYUFPdCsyQmYwZm1mSlJJZEdScm9KMDVlWnVsZlZvUjhXaGcxMm44?=
 =?utf-8?B?b1hpU2c3WnpoLzhPTmhwd0ZSWHMzVjFYYW50QWRkUzV1b2ZYdnlMcVRKSkI4?=
 =?utf-8?B?cjNjU2dwenh2bUIxZk4xdS9WSCtubkIzVEt0Vi9sMnRnTkVDeHd1RWFXSERX?=
 =?utf-8?B?ZUFCSXJyV0N0cnB6Yzk0aHovR3lMbGhqd3pzcHFqL0ZLWXdkS3Y3WENlaXNz?=
 =?utf-8?B?WnZrWmNkU0dQVFFaNkU3SDZVM1JRaDl6Y0FEdW81NkJhdW9lZkVJZXNLd0hw?=
 =?utf-8?B?S2ZmeFlaQ3BucDV0N3dlY1hEbHh3dUFGd2Nvd2NoMngzNENlNWxzZnFZU2tY?=
 =?utf-8?B?a2g4WWtiandzZVByWHFUMVFhVGRMSUg4U3BrTEtLam1GRm1RZ1IrSVhmQlp6?=
 =?utf-8?B?NDI5UzFJM1pjVW9zTDVyUzFFYmRMU2hLUGlRYkVNNy81RTQ0RkQ1K3B0d3hp?=
 =?utf-8?B?WDN4cFErdXQvMjE0c1NLdlp0dzJneVkwZmI5U0I5K0FxUEVsOE1Sc1h5NXMw?=
 =?utf-8?B?WmVmQjNLUjBqMHdzWlIya2laQm1YNzFwN245UGZwc0Z4eXk4VzA3WGhMUzk2?=
 =?utf-8?B?T1hBV2lGc1RMMnp1MWNGaG1RZXVBMEVXaFg5N1lFTWpTSS95VlkzWk1tUk5k?=
 =?utf-8?B?elpYMnNkOStjSWpJYkh0UXoyUUJXS0dKVGUrVGM4TVVpZzVyUHc1UG96SzZQ?=
 =?utf-8?B?ZUVhcVZVTFAzd2JSV2RYenlyeWZCZGhrU1g3TE90UitWOEFUMkZFTDJsZGpK?=
 =?utf-8?B?bE1EMDlTMDZBT2dlVEtCb0hVN2NHbjdDb0psc3dsR2NCenVWRjFaVFVJMVo0?=
 =?utf-8?B?TzFYaDcySkY1Qk9jVjM3SmVDcFAzNFpRaGVRTnhTLzYyODhwMm5sTTRIZ1JP?=
 =?utf-8?B?bVZvb1Fwam0xbFJ0U3NuM0duTTJNeko1empraWE5ak5lWjRRVDZ4TXdRU0dZ?=
 =?utf-8?B?MlVpeUY1UzBCcktLZTQzNS94NEs2eFFmdzNnTWk2NmVTbTZJTHNieVA5Y000?=
 =?utf-8?B?TStJVWFjUEM2THVQM3VsaVBxTDE2NVNrYW9wODNMS2pjREg5SVpNeGdKSlNq?=
 =?utf-8?B?SWhLUTFGTkZLV3F6ZUpKZ1dQcFZzMnZVWlZJaGlLdVR2SmJsVis0M1pwV003?=
 =?utf-8?B?Zjh0TFMvbTJxc0drMzRRb2tqTmx1S1R5MDU1UVNELzNuZ210alNmdzZWOEVp?=
 =?utf-8?B?VFN4VmdCaUNobkZhVmFXQThINk1nWGRVeVNlQmZ0dGRzNitveUdvN1pINzYw?=
 =?utf-8?B?Q2UvZytDL2VJVGR2U2NVOVdkbXBFbjNwTHcrK1R6UkhzMTlDQmhZYmh3YkRE?=
 =?utf-8?B?a2lBcDdNYnFuYi9YQ21tOUJkOGtMdHQyNmhFQ1FqYnhuSm9SdUlUUEEwZk1P?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aec79909-a59b-4002-1c0b-08dbe6f3c1cd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 22:31:20.7590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h76YdLw26YTSEQxeWnWX1/KM9GbDFTTckE06YmPHG3GT75xAV3wl+6f7ECrpYRi9TnXcnJRQcuJFqxmb27tF8R9fWcJH59Qe/kog15nDCKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5552
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 01/11] fixup! drm/xe/guc: Report
 submission version of GuC firmware
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

On 11/14/2023 16:46, Daniele Ceraolo Spurio wrote:
> Major GuC versions greater than 70 will have the submission version in
> the herader irrespective of their minor version number.
herader

John.

>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index 3032c4f148d4..91d4a2272ee7 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
>   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>   	xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>   
> -	if (uc_fw->minor_ver_found >= 6) {
> +	if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
>   		/* v70.6.0 adds CSS header support */
>   		guc->submission_state.version.major =
>   			FIELD_GET(CSS_SW_VERSION_UC_MAJOR,

