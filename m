Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE039E8FDC6
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 02:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CEE10E084;
	Wed,  4 Oct 2023 02:33:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A7610E084
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 02:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696386833; x=1727922833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XqypD3KINzRpxjt0rsmVnbGuKAu5zBguh9JuZDQEmKI=;
 b=jn+au3Fo4pAXCYg2ioXFSSvfZ+J9c+utIKYbgwtrMu4HELtIsIp7h6Uj
 9RCj6kBus5iqMWScYCMPF2GOMk7ahRC8BPhwZjs/nODeUx8P5mRijt90A
 6B6XzwhtNe2H9iTwePE6woV3QD3ewWCAEhjR8Ar2AI+Jv9eLaxiWI8eX2
 Xy7/xIbwIaYCSY1XjEE9xMNdyeQbtbwItaICcQ37XhHrrDghiX79oHi+Y
 gGxk39cg1V9xZx4Z/GLO6ZNoz0uqY+zWp2e20XbljIBW/3EwDGCenKrnd
 L21QxKk8GBRF9etYdEvAu8bcOv9/ge9CfFkexUV2l5Z5cyBWPnsxLVDfg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="413953031"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="413953031"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 19:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="867131327"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="867131327"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 19:33:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:33:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 19:33:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 19:33:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 19:33:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBgbC4elHiOgG1obDHGzGiUm8OG6P5r3GSOMOE7yQ7GC6/tSGrOzjV8kAyieF1IqR1fHPBMnHtpv9ebkWtbtIbTM0EtgML+0grzwIwOpg5gFvicIsPoHWnr2L2mOnLFPT5vgQwSU98E0YbnTjKIYhyh+oOqrZuM0FtakstATYFMjyrybTGE7s/VkhEqlGi+GXGlch/kvJdfJ422It+zyzzP/OV1YHvBY8x5qJnmY5+HuRvpSOPy8b8M4/2Hbxz60uiWfG31ydFH1/S1cx5A5uRLitFWeECQpxDh5rK0VLXHXtPM83oq4iJhZ2ORkfjjedtpcC6l6G4DE13pAo2Hc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuX7vVC/1/wpoLaCERAAq3amhclUFNc1Zxqbj+XmqwM=;
 b=DOANiaWGWibuuTx6aaMv1CMIIdIohDScmHCSTzvXqfBLjjvutab5wza92eXOv+s/u71AP666fPn2KTu9znSRdOMBNQ/k1ZmNqZ/9/jpxMi9Ekmaa64OUkSXSxnU8y+f/8Qhka9HSYasCyLakcy4aHaXv1FSPwIaNg+G7Jk7TFlaeWUWEkIiWpay1IKWJihMv+8iqaPZOlalpkyvgGsUynx+kiheSnkqF+9gRF2p018m5+gapbymd5czIysuk5qmJqoNJFYU1CoKP+lsqSJ/AFPwnvjBv8kJU9tuUQ45S1txElMIBaoesBmfRr8+U/pf6L9qXsfyuV99GmYZ1212ZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.28; Wed, 4 Oct 2023 02:33:48 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 02:33:48 +0000
Date: Tue, 3 Oct 2023 19:33:45 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZRzPCbOR4T8QN/XJ@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-16-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-16-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR07CA0107.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::48) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SN7PR11MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 760e6086-111c-4120-19c6-08dbc48256dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQgp1yVsfDMgBTsxa7Hi7dzMYvxEU8CYqfSBjXCgbRD+M6N/HDDmiYrH7WR75Fx2WWcMdWecTLOWNtHZ084Vks4KABxcV/yVbpYj+Fbxrm0wJ+EpJAQJdYUBvxRgLDfCaZc8yM7Dbl7OfkO/b5wfu2drfsGZLDhWqqKzSlFmoyJUkDWXFHF16oLm+5NGTFll8gm8LkZ+CO6AuRXAvqNzYa31uM6drflxatwl3nrfWCeIvo3zxwPknABUG2DlBLDUm6ct420MbKsPfrkqAvQRr5WHUYdNkYvxSuDAMhWKRFSFWPpgG5nSLr+yuiH5pcuYG+GJVJxrfz7IhrqsWu1E4XMGyEeYQmfKMn07AjFyCo0QM3ko6gydp057+lDbyWbq9Zg84XPazkHODZpinBJEq4S+rfEoOnXwRrMY5jYtEhQKaw2/HEL2ZdNRAQ1LHyjOxzOignEBQsBJ+aWHevcU3cdWUeip096/dBiRxTimcWfEg4i9NHO4bXVDnNyCmYaNBu9Lg2N08udha15rFe6F4xBHBXYkDv51YLghvhqdGfjgABZuG3jJSNADwpp3Lype
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(136003)(346002)(39860400002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(9686003)(6512007)(6506007)(38100700002)(86362001)(82960400001)(26005)(6636002)(2906002)(478600001)(83380400001)(6666004)(6862004)(8936002)(66946007)(41300700001)(316002)(8676002)(6486002)(4326008)(5660300002)(33716001)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clRtU3pkNk94SjBJNkMxSW9HWkd1cmJUbGs5KzdwYURuaUw3eFZIU1ZsVElp?=
 =?utf-8?B?OHZEK0c0TTRaMDNBYi9GS2Y1aXpmc2RNMFV5SWxkMmFLM3c0UTIyRlg1T2VE?=
 =?utf-8?B?aUFia1RWSk1FSEdOancvVXdYdlo3QVpneDdLR0gydndIcWhxQ0NKMkFoQldS?=
 =?utf-8?B?RVRLVG43TUMzSHdic2J1aDdOTk4vMGRzTjdMbW5JdGpUL0FtZllKNDlyUTZy?=
 =?utf-8?B?dVY2RldZVHlTekV2YStuSGNuMGNEamJsNFJaVlNsVDIvWTlvU0RhY09tcDQ0?=
 =?utf-8?B?OEczOUpPcFlyQk44NFpMa2hBU0gxV3BYUGRkTERneml0YnUzWkhweVVudnR2?=
 =?utf-8?B?QVdiVUtIZXQvckVKeUhvek5qOU9HWFZ3dVpLVmNuaGJMWS9ETDdqdFdRd2dJ?=
 =?utf-8?B?QnFKVmNrUSt5RjJSUTU3NlFrM3FVajJpZHFvYmk0RkxjNnRma3JqUEJjSDJ4?=
 =?utf-8?B?Skw2SnpLQU9uOENMN0FFaURlMzJTMGhURURubmNGYVpaQUI4OU9MQkh6anBM?=
 =?utf-8?B?OXJEVS9neFJtYkkrYitYclVHSzJ6SklKZHlOVFVLbTB4YmZsbGd4OU4zTWdL?=
 =?utf-8?B?emx0UGpGcG5sMkErMU1nS3JwaVZHaUVBWGNkcUlTWm9zV0FsZXFkdncxZG1q?=
 =?utf-8?B?cUpGQTJURWdaMTFpMmxkc2ZiUWx0M2MvVytmb3hoZ2lCdXNBTDVIMW5Ccmxl?=
 =?utf-8?B?aHlNVWR6cHFkM3VPaTRQQjE3TDArczFHV2xzWmY5bWFvTW50ZnNGM0JjOHFS?=
 =?utf-8?B?aEQ3RjQvOGZHWnlaRGF6bnNudzNPeTh1TmNpR2s0TC9wa2VXT3hid2ZPYlhH?=
 =?utf-8?B?SHN1Sm1pNExrbDNmdzF0TWdmYkpmb1ZyUC95RVdyV1hvSWxENkFLdGxXRkdI?=
 =?utf-8?B?YnBwWXpidEpSL1VrREJVRjZYZHdSY0Iwc29tVHp0VDltN0Q2dlhTT3UxcFBL?=
 =?utf-8?B?MHN1VStsRlVsb0pGbjl4akVBSDJHelc5VitvVlpIRXRIWjY3U1JPbk5jSTdH?=
 =?utf-8?B?MWZmdVQ2QU9UU3lqdG9VbFV0d3crU3FkWnlLbDJPSVVsNklCdGtJblNjVEhS?=
 =?utf-8?B?R09pMUQvb3k4K1FUajFjdWxCNmdweXhWSkRLSFBWdmE5YzFMRUJRVWpUTVJk?=
 =?utf-8?B?bmNLL0o0K1VkQXJhQTFkZFZZYjY0SEJHamJrbFlVWU5KakllcC9heE5uR1Fw?=
 =?utf-8?B?MlBDNnVhcVdFZnBRYjEzYW0wVWlPQUZHZlpIVnNwQjgzRHZvUmx4NEIweGJG?=
 =?utf-8?B?UWc4T0RXZEk5Z2pqVkw3eE9PeVBnbytqaXJVN0w3eWw1VkZqTE5KdTNJKzVO?=
 =?utf-8?B?djNmTnRzc0pqRzdUQ1dKekNuMEx2U2lJU3hSanpHeTJUSFJuWVpUdnNOQTJr?=
 =?utf-8?B?UDNSRVBGck5FQXMwZzA2ZUd1YlZkRUJ1aWloZm44OE9jMGtuSVh3OWhzc1ox?=
 =?utf-8?B?aUozQUtBS3B0R1oveXcwS1YreC9iRHVSWGlHNTc2OUR1ZWFzZ3FYdTl2N295?=
 =?utf-8?B?NzYxNnNubVlQcjFPemk2dVd0aTJXc3M2Y1N2Y2NWck1kVVJod1Z4dDJ2L0pN?=
 =?utf-8?B?Um55ajZTblpqSlFLWC9hWVRmQ3kvQ1Ivc2pGN1ZaL00wU3NVcXBOc3pmb3N4?=
 =?utf-8?B?dmhzelQ2RkRoS2liaFRReG5nWXE5M2N1TUgyNnp0SFJTcDRadWM3bSszTFFR?=
 =?utf-8?B?UGVuZFBjcjNISVFHY2F5UlNrL3p1WXY4Nm5BTmZTUDA0Z1RpVmNJKzI1YUJU?=
 =?utf-8?B?dmxvMUNpMzZycHNjbnJXUUo2TUgwTUJFTG1PM21paUxyeUpBRFE3ZitWU0cz?=
 =?utf-8?B?V2piMUUySnlPY3ZZWFdrSzRndWtZSDkvR0lUVlVqS3NHc0hFL2ZxeGJ6Z3Rk?=
 =?utf-8?B?RVM4YUtpMmRJd1FHRGpQSG9Ka25GdXJmdkVJR0d2MnJVNi9wcXJqU3BRRXEw?=
 =?utf-8?B?Nk5DMkZkeXFjaG90cUF0aEl1NTFyNUpjREU1bTA3U0JyaDNXelNtYjkzbEFE?=
 =?utf-8?B?Tmt1MEI5WG81ODJkM25zam5Yd2JSWTlmZjBFOXNmK2t1bzcrNHBJSVM1N3VO?=
 =?utf-8?B?NjlIZ1VWVVdidDcrUlBXSGlVb29INjlxRURPQTRXZWJaLzVaS3BvOGtKM1VM?=
 =?utf-8?B?emNMZ3BmdUovWmlpUnlJdUthcGVZVTZxVEtZakU0QlJTWnpiMnRKc2xSOHJ3?=
 =?utf-8?Q?ob/ge8BkFl/SatH26zsmiuY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 760e6086-111c-4120-19c6-08dbc48256dc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 02:33:48.6241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBcOi1gNX7iCplAUgg5T26pU0oGkVPAyi12kfFMTAK4RTKKjRK8BhNoIpiCRnTG9pmoWhIpPwl+Iez9fveZc/9EHhnZRtkbjifRIuK/52qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 15/21] drm/xe/uapi: Remove OA format names
 from OA uapi
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 09:10:43AM -0700, Ashutosh Dixit wrote:
>OA format names (in enum drm_xe_oa_format) have an overhead in that the
>uapi header has to be updated each time a HW introduces a new
>format. Instead of directly using OA format names, switch to using the same
>fields Bspec uses to specify formats. The fields change much less often
>than the format names. The format names are still internally maintained,
>just not exchanged through the uapi.

I am rethinking this now. Maybe we should retain the same thing that 
existed in i915 - the enum of formats. I see some resistance to this 
change from UMDs like Mesa. If the enum is easier for UMDs, let's just 
retain that.

As for updating the UApi for each platform, we must make sure hardware 
retains a backwards compatible OA format for new platforms. That's 
outside the scope of this activity though.

Sorry about the churn, since I suggested this. Let me know if you think 
otherwise.

Thanks,
Umesh

>
>Bspec: 52198, 60942
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 52 +++++++++++++++++++++-----------
> drivers/gpu/drm/xe/xe_oa_types.h | 23 ++++++++++++--
> include/uapi/drm/xe_drm.h        | 33 ++++++++++----------
> 3 files changed, 72 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 19ad23b90e6ad..d49debe732bbd 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -53,10 +53,10 @@ static const struct xe_oa_format oa_formats[] = {
> 	[XE_OA_FORMAT_A12]			= { 0, 64 },
> 	[XE_OA_FORMAT_A12_B8_C8]		= { 2, 128 },
> 	[XE_OA_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>-	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256 },
>+	[XE_OAR_FORMAT_A32u40_A4u32_B8_C8]	= { 5, 256, XE_OA_FMT_TYPE_OAR },
> 	[XE_OA_FORMAT_A24u40_A14u32_B8_C8]	= { 5, 256 },
>-	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, TYPE_OAM, HDR_64_BIT },
>-	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, TYPE_OAM, HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u64_B8_C8]		= { 1, 192, XE_OA_FMT_TYPE_OAM_MPEC, HDR_64_BIT },
>+	[XE_OAM_FORMAT_MPEC8u32_B8_C8]		= { 2, 128, XE_OA_FMT_TYPE_OAM_MPEC, HDR_64_BIT },
> };
>
> struct xe_oa_open_properties {
>@@ -65,7 +65,7 @@ struct xe_oa_open_properties {
> 	u64 exec_q_id;
>
> 	int metrics_set;
>-	int oa_format;
>+	enum xe_oa_format_name oa_format;
> 	bool oa_periodic;
> 	int oa_period_exponent;
>
>@@ -1529,13 +1529,6 @@ static u64 oa_exponent_to_ns(struct xe_oa *oa, int exponent)
> 	return div_u64(nom + den - 1, den);
> }
>
>-static bool oa_format_valid(struct xe_oa *oa, u64 format)
>-{
>-	if (format >= XE_OA_FORMAT_MAX)
>-		return false;
>-	return test_bit(format, oa->format_mask);
>-}
>-
> static bool engine_supports_oa(const struct xe_hw_engine *hwe)
> {
> 	return hwe->oa_group;
>@@ -1543,7 +1536,32 @@ static bool engine_supports_oa(const struct xe_hw_engine *hwe)
>
> static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
> {
>-	return hwe->oa_group && hwe->oa_group->type == type;
>+	switch (hwe->oa_group->type) {
>+	case TYPE_OAG:
>+		return type == XE_OA_FMT_TYPE_OAG || type == XE_OA_FMT_TYPE_OAR;
>+	case TYPE_OAM:
>+		return type == XE_OA_FMT_TYPE_OAM || type == XE_OA_FMT_TYPE_OAM_MPEC;
>+	default:
>+		return false;
>+	}
>+}
>+
>+static int decode_oa_format(struct xe_oa *oa, u64 prop, enum xe_oa_format_name *name)
>+{
>+	u32 counter_sel = FIELD_GET(XE_OA_MASK_COUNTER_SEL, prop);
>+	u32 type = FIELD_GET(XE_OA_MASK_FMT_TYPE, prop);
>+	int idx;
>+
>+	for_each_set_bit(idx, oa->format_mask, XE_OA_FORMAT_MAX) {
>+		const struct xe_oa_format *f = &oa->oa_formats[idx];
>+
>+		if (type == f->type && counter_sel == f->format) {
>+			*name = idx;
>+			return 0;
>+		}
>+	}
>+
>+	return -EINVAL;
> }
>
> #define OA_EXPONENT_MAX 31
>@@ -1600,12 +1618,12 @@ static int xe_oa_read_properties_unlocked(struct xe_oa *oa, u64 __user *uprops,
> 			props->metrics_set = value;
> 			break;
> 		case DRM_XE_OA_PROP_OA_FORMAT:
>-			if (!oa_format_valid(oa, value)) {
>-				drm_dbg(&oa->xe->drm, "Unsupported OA report format %llu\n",
>+			ret = decode_oa_format(oa, value, &props->oa_format);
>+			if (ret) {
>+				drm_dbg(&oa->xe->drm, "Unsupported OA report format %#llx\n",
> 					value);
>-				return -EINVAL;
>+				return ret;
> 			}
>-			props->oa_format = value;
> 			break;
> 		case DRM_XE_OA_PROP_OA_EXPONENT:
> 			if (value > OA_EXPONENT_MAX) {
>@@ -2227,7 +2245,7 @@ u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
> 		hwe->oa_group->oa_unit_id : U16_MAX;
> }
>
>-static void oa_format_add(struct xe_oa *oa, enum drm_xe_oa_format format)
>+static void oa_format_add(struct xe_oa *oa, enum xe_oa_format_name format)
> {
> 	__set_bit(format, oa->format_mask);
> }
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index ac8b23695cc6e..3cc1d88fe4a51 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -24,7 +24,7 @@ enum {
> 	OA_GROUP_INVALID = U32_MAX,
> };
>
>-enum oa_type {
>+enum oa_unit_type {
> 	TYPE_OAG,
> 	TYPE_OAM,
> };
>@@ -34,6 +34,25 @@ enum report_header {
> 	HDR_64_BIT,
> };
>
>+enum xe_oa_format_name {
>+	XE_OA_FORMAT_C4_B8 = 7,
>+
>+	/* Gen8+ */
>+	XE_OA_FORMAT_A12,
>+	XE_OA_FORMAT_A12_B8_C8,
>+	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
>+
>+	/* DG2 */
>+	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
>+	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
>+
>+	/* MTL OAM */
>+	XE_OAM_FORMAT_MPEC8u64_B8_C8,
>+	XE_OAM_FORMAT_MPEC8u32_B8_C8,
>+
>+	XE_OA_FORMAT_MAX,
>+};
>+
> struct xe_oa_format {
> 	u32 format;
> 	int size;
>@@ -96,7 +115,7 @@ struct xe_oa_group {
> 	struct xe_oa_regs regs;
>
> 	/** @type: Type of OA unit - OAM, OAG etc. */
>-	enum oa_type type;
>+	enum oa_unit_type type;
> };
>
> /**
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index fe873dc63fc5a..77949c5abcee1 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1124,23 +1124,13 @@ struct drm_xe_perf_param {
> 	__u64 param;
> };
>
>-enum drm_xe_oa_format {
>-	XE_OA_FORMAT_C4_B8 = 7,
>-
>-	/* Gen8+ */
>-	XE_OA_FORMAT_A12,
>-	XE_OA_FORMAT_A12_B8_C8,
>-	XE_OA_FORMAT_A32u40_A4u32_B8_C8,
>-
>-	/* DG2 */
>-	XE_OAR_FORMAT_A32u40_A4u32_B8_C8,
>-	XE_OA_FORMAT_A24u40_A14u32_B8_C8,
>-
>-	/* MTL OAM */
>-	XE_OAM_FORMAT_MPEC8u64_B8_C8,
>-	XE_OAM_FORMAT_MPEC8u32_B8_C8,
>-
>-	XE_OA_FORMAT_MAX	    /* non-ABI */
>+enum drm_xe_oa_format_type {
>+	XE_OA_FMT_TYPE_OAG,
>+	XE_OA_FMT_TYPE_OAR,
>+	XE_OA_FMT_TYPE_OAM,
>+	XE_OA_FMT_TYPE_OAC,
>+	XE_OA_FMT_TYPE_OAM_MPEC,
>+	XE_OA_FMT_TYPE_PEC,
> };
>
> enum drm_xe_oa_property_id {
>@@ -1167,6 +1157,15 @@ enum drm_xe_oa_property_id {
> 	 * The value specifies the size and layout of OA unit reports.
> 	 */
> 	DRM_XE_OA_PROP_OA_FORMAT,
>+	/**
>+	 * OA_FORMAT's are specified the same way as in Bspec, in terms of
>+	 * the following quantities: a. enum @drm_xe_oa_format_type
>+	 * b. Counter select c. Counter size and d. BC report
>+	 */
>+#define XE_OA_MASK_FMT_TYPE	(0xff << 0)
>+#define XE_OA_MASK_COUNTER_SEL	(0xff << 8)
>+#define XE_OA_MASK_COUNTER_SIZE	(0xff << 16)
>+#define XE_OA_MASK_BC_REPORT	(0xff << 24)
>
> 	/**
> 	 * Specifying this property implicitly requests periodic OA unit
>-- 
>2.41.0
>
