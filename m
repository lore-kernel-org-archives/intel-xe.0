Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFE3E936ED
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 22:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F035210E0EA;
	Wed,  4 Oct 2023 22:38:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6775210E0EA
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 22:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696459135; x=1727995135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O5T2BZ9VBtSdmFYDtkp5N/uJj+qKjiroJA9EsM7jX+g=;
 b=c2r427kQYTJezvK6tq5bNYoxxIZjRNlu3PpUuvb+DE5aV+xgGUK2buaz
 H/VcR6yxY+SX+QAzAeSFgGXiCOOumou7CIQNgpPkSjvUq5JrepGrT4rwF
 OrqSbfDAiMNN9KY3utdRes3afS+/TFlPkHLH5J5kxgX05jJVbYcqCRk4O
 1ig/Atk9Iwbmk3DbXCURcHYNLClUXLBpMn9Ol16wjhDJOMg3ReIv1woji
 ipE/oqL9v7mtKGvCF6ZMoMETPxLTDGLCLLcbesEucYeBVQCqj7atC79eb
 sgUO7ZQ0x9sBek0csWF+GuHQzhwi4D6QIUO3pA8TzdaRq6SCcCQ53+nCO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4889326"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="4889326"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 15:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728196663"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="728196663"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 15:38:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 15:38:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 15:38:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 15:38:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 15:38:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmjTolOu3IJ0WmSdfk2F6UZgnOlb/hmUE2ZFgCMVmSQ+YuBXudwewhWsZsJ/R3zIxZbeuRgn1QdDYWHywDklkor/rfdhKBcr81y6/RW6HZKnqDk+ltWZtX+ZgzVMOEaXPC5YvmfE31XRiHHaWvNrjwRbDkQB457vGY6KmoEnTPjNtl6girxYAFUBPSRrf3YDIB7XIYc3H0G2iMZ+VWzbfg3HdPQtNTQOwtNwT1jmzwJb4664XIFvmKWKXctFPW3nqQwAwwqm1kf7hOv3CSfmh1DavMSjXhOrk5zKk/EepExRQxxhnApCqfFe0DMbJAIlmVVbpnK32AQBq2Dh7AiBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Uusqqmln0PYo6Jg28NntAtlkmIaiX+i5fnyJ9Qqp8g=;
 b=W+kgyDRIzagfT53TfF/AhPIeL4ZLIuGm47LJTi0ynldQOQpsxiJCd9zvVRJFz0jarK75KWfHAh5U6+1NNXJaNz1zusfzO4lrdhAy0RlIhYQ6iU8jXP9r1Hy9ruZYlY8CgpzGJlSoLt+FUiPleE5ANu1MsnyffIAZwRdHsXEDhgq2pKjoiPpTPMXHtsxjDQ1VMGF/QJ3ICJvp38019L6xSeQZaXZ3Ss/2CGx+IteSzb+k4CTNaIkK1dZfdUXPEowRqm5t4UMRFzwUdrd67bDyf4YMzeOv0vQYLrIHTXOBSM4JlesTn3UgnXGysaaK4aYe+ttu5b5C3VaoEpXX5xi6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 4 Oct
 2023 22:38:04 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Wed, 4 Oct 2023
 22:38:04 +0000
Date: Wed, 4 Oct 2023 15:37:51 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZR3pPzKOklPMGiWh@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-21-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-21-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d4e2fb-51f2-480e-1352-08dbc52a92d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KOiLQ4RTPRNs7iBvqrIVp+mKOECg2+OUaK+CE/Mf9EzimbYS/79Wg5NwZA/ce96TlpLMq0gyyoqIQB9UTT9yHNH3mxOLfd9M+cIsSlqP0/RMcEE4Wirx7zHGClet92mK+ogY/PLDSzOCarvYEXsx+FW1CZaVuCqjXSCoa/LGMDLl0aJ2u2OKqpbnDL0J3HI+qEt/B2hAvnX79qJegcKVnlkAUY8g/M2OQxuH3dsQoOE08ZLiXmYrER3qKIrWjo1Z5Tb5x1PAKgjdeEsTValoxFfpzuQMfMO3Tpi9jBka5gDYf1wU0axH0BU5/TPvvX5CYlE/fCSu74EU4OQjIG04U0cjRT4mohNb0C0TsfA4KBKdHatvjBO3FmKpVIEpUGijImSIImj97nz9+aANGUNCh7bNV3w2hlu36Lx4unKKeEaNUsTZGZYrYtgpuLP9IU/OAJhs0zg61+Bo6mLe7dxzJTjiKPptMBxFhS0DWX3ynDCJzYsMWxmz0s1qfgPkV8UjXZjwmBK2klHXWuZZS/3yXh3pO2sghR8MXjLOWte2RaiLwWl6Kknu/4q1Y71NfV8v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(6486002)(478600001)(6512007)(6506007)(82960400001)(9686003)(83380400001)(6666004)(6862004)(66476007)(41300700001)(66556008)(8936002)(316002)(66946007)(6636002)(5660300002)(33716001)(8676002)(86362001)(4326008)(2906002)(26005)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2x5RE9xTkZaOVN1dktzcVAwWEVSekdzMXRXY0xEZzNnWHc5N2w5WlJXSXgy?=
 =?utf-8?B?dkZ2Q3ZyUmVVa1d3VXo1bXptWXJlajIxbWxINTN0V2xxcm5TVVc2ZU1kbDl3?=
 =?utf-8?B?TzRJQlE5UGN4Skw2dEQ2QktQbzEvWDAzYWtVSmcxYU5ZWG5oa2FMaEQxM1Jy?=
 =?utf-8?B?UjNpeGxGK2M5cXR3SzU2OVlKOGpXWHpCcEs3SzFhQXM4Vng5cTd1TFZITHhk?=
 =?utf-8?B?WXkvcFEyRVZadm5MbE1SSUdHSis3K0xhY0xKWmI1cUVlNGt6N0plV1FUZVY0?=
 =?utf-8?B?TXlZVTdrbGlBaXBKUldmeUVFVnd1SVJBa1JKY3Z5aVlRNTEyL0Y2ekVjWlFw?=
 =?utf-8?B?eVdHOG9Hc1FnKzIxU1pRUTVNejZBV3dpNDRqUWI3d1Z0alJ2UlN0VkZ5MEhN?=
 =?utf-8?B?cmw5TGswOHY1OCtsMjMrVGY0SmpyU3NQYjB0NWJLayt5UGtCam5nL25ZK0xH?=
 =?utf-8?B?SjF4MlJnYzFrTlo2SHJUV0ZQSjJLclRDQVRNWTBkYTVnR01xL1JKeTZFYWJx?=
 =?utf-8?B?L1BNUjRTTVBqMWF5V0Nub05neVNPRG9ENmNIUFdNcGZleXpqeEZ4aDEybDRq?=
 =?utf-8?B?d0pPdVFSd2dFR1NwUWtiTFFHb0o4Z0FORnMrdDNSUGJ0OFlFN2tteXNwQnUr?=
 =?utf-8?B?WTQrcEZTRUtGaU9vNEdHTUxEZWNIcEF1WHZDbElEQWxkcTB2cFJxVlRCZ0hN?=
 =?utf-8?B?N245UVoyeE94TXM5Z1NsTHMwOGs5dFNBM2tab3B3RVVWNXczbFJYTnk4Q2d3?=
 =?utf-8?B?WnlRRjhnenFoMjR5SUt5akFjUkNxRXMzeTRHSVdVV0dpN2o3WXFHVDAvV2Zp?=
 =?utf-8?B?dEd1WjAzaGJ6dExTODRDUWtIekVreHNWSjgzNlpuYzlaOGhTMXNwOWV1Nkow?=
 =?utf-8?B?OUZnSjR3U3hBczJLR2s2ME5FU2xhZlY4KzJ0VEh5UUVsUlNnd1dCL2JpZ3Ra?=
 =?utf-8?B?bzNyTnlOVm1qNmt3VzVVcklZYW9NU3BuMDFHNzJlUS9LdWN2U1QwaHRkV0xi?=
 =?utf-8?B?VU9xQ0JrNk5OV2swM2lpUURPLzFESkRlWW5HTDloSy9iajM1Qk5mdUlCZXFQ?=
 =?utf-8?B?Umt6cXlhZi9VTUc3OGdYTHAzK2xQZkVsTzExQlZHRU1ZZWpQVlJSRmRleW1r?=
 =?utf-8?B?T2RXcjBjT2E2MlpBbzFJM0dzZzJzOUI3eEJPN2lTc0IrV0JPVG8wczhYZDBu?=
 =?utf-8?B?aVR5aExaMjZjcnVJUURmQkRVeXdSMmMrY2owQ01RS3VMY0FSUDFOUnhkNklv?=
 =?utf-8?B?eTdCbXlTRHVUZjJrWHpjSDhES1J6eHhEaXUvSEl1Z0hUUWVnd012blZqaU12?=
 =?utf-8?B?cUFiT0dMTVJOeGJkaFBUUzJrQmdPcnlWbXg2RmErQWlHbnBVQ0ErcER6NGQy?=
 =?utf-8?B?VXNPSTFkeDgwQWllVDFWSG1tdEozSG9jeUNZV1FxenJoRGNrdEc2S2ZBYklk?=
 =?utf-8?B?NUNJbktBM0YrK0QvRllBSHhzcVZFbjJvbXpzNnJhMzE4QnY4QnEvS1dDRWk3?=
 =?utf-8?B?SDR1ZFRhZ3hZc0tlVE0vWC9ZRmc3WDd4NEtEOUxuYTJOczgrOXdyTVdvNHZu?=
 =?utf-8?B?RFp0Q2k4YXNERlVNWFNKQ1VuNWxnS1dTbEJJVWpLaXFHL2U3d1dGdVJ4MHc0?=
 =?utf-8?B?d280aXhFYS9odWlMdXRTZjJaSkEzQUNWSk9PMFhaZi85bEl3cnpYS3VWUUJz?=
 =?utf-8?B?MkhmZXFnckZNM1lTZEJpcnJYQTlLVm1FVDc0cnA2STlFNHpVM2J5VUVUYUZu?=
 =?utf-8?B?c2FldnJQN3FFL3cvbnRJWTh1MmJFaTNqR1ZkOXFhZkJNVVpZbXlDZm1WT3Zw?=
 =?utf-8?B?MjR6SW4zL0t4amFzVGxDWEFPVHRpc0graEVMaU10Y21vdXR3ZThlWTNROFVa?=
 =?utf-8?B?S2lvaHAxWGFuYXlzcXZJK3VLZmpHd3R2L2JERkMva0hRZmNQUGVZVThzVS9M?=
 =?utf-8?B?di9lWGxGTnVxRElIVEpxdFJhYkFwOERwL3g0Nmd2OUdnNHNuMFJtVzBVR29S?=
 =?utf-8?B?amt3OWpSWmVMcGdCczN0c09ianA0WCtBMkNSaWxPc05aUWpKeWg1bUdMU0tm?=
 =?utf-8?B?VlJCNWJmUW5ETTVYQ2c1cGV4d20wbWtIMHhaaitXV0FBRGFJUWwrTGl2UVhT?=
 =?utf-8?B?dDlaN0xHd3JOVzdnN2RtY3N1b3AzYmZSdnFXdFc5UnlVK3NiMXVXdHFWL0kz?=
 =?utf-8?Q?7wJvfGX5//AOAH1YJdXRwVo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d4e2fb-51f2-480e-1352-08dbc52a92d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 22:38:04.7455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wfKgsccys+mm+ikIBsOBMZ1jkQGgrTH2u7K46g3h+ki7EymuOmMuaUpcBAi7+fVfcT3u99E8fxYVn8GEMNuKz5Xi3+ucxzqE+Sd6R3/dt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 20/21] drm/xe/uapi: Use OA unit id to
 identify OA unit
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

On Tue, Sep 19, 2023 at 09:10:48AM -0700, Ashutosh Dixit wrote:
>Previous uapi uses an indirect way (the engine class/instance of an engine
>connected to an OA unit) to identify an OA unit. Replace this by directly
>using the OA unit ID to identify the OA unit.
>
>With this change DRM_XE_OA_PROP_OA_ENGINE_CLASS property is not needed any
>more and removed. DRM_XE_OA_PROP_OA_ENGINE_INSTANCE is still used with
>DRM_XE_OA_PROP_EXEC_QUEUE_ID.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 267 +++++++++++++++++++++----------------
> include/uapi/drm/xe_drm.h  |  22 ++-
> 2 files changed, 160 insertions(+), 129 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 7cb900fc88f58..ded52d5aabea6 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -60,9 +60,13 @@ static const struct xe_oa_format oa_formats[] = {
> };
>
> struct xe_oa_open_properties {
>+	u16 oa_unit_id;
> 	bool sample;
>+
> 	bool single_exec_q;
> 	u64 exec_q_id;
>+	struct xe_exec_queue *exec_q;
>+	u16 instance;
>
> 	int metrics_set;
> 	enum xe_oa_format_name oa_format;
>@@ -1287,6 +1291,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	struct xe_oa *oa = stream->oa;
> 	int ret;
>
>+	stream->exec_q = props->exec_q;
> 	stream->poll_oa_period = props->poll_oa_period;
> 	stream->hwe = props->hwe;
> 	stream->gt = stream->hwe->gt;
>@@ -1377,61 +1382,27 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> static int
> xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 			       struct drm_xe_oa_open_param *param,
>-			       struct xe_oa_open_properties *props,
>-			       struct drm_file *file)
>+			       struct xe_oa_open_properties *props)
> {
>-	struct xe_file *xef = to_xe_file(file);
>-	struct xe_oa_stream *stream = NULL;
>-	struct xe_exec_queue *q = NULL;
>+	struct xe_oa_stream *stream;
> 	unsigned long f_flags = 0;
>-	bool privileged_op = true;
> 	int stream_fd;
> 	int ret;
>
>-	if (props->single_exec_q) {
>-		q = xe_exec_queue_lookup(xef, props->exec_q_id);
>-		if (XE_IOCTL_DBG(oa->xe, !q)) {
>-			ret = -ENOENT;
>-			goto err_exec_q;
>-		}
>-	}
>-
>-	/*
>-	 * The OAR unit only monitors the RCS on a per context basis. Relax
>-	 * requirements if the user doesn't request global stream access,
>-	 * i.e. query based sampling using MI_REPORT_PERF_COUNT
>-	 */
>-	if (q && !props->sample)
>-		privileged_op = false;
>-
>-	if (privileged_op && xe_oa_stream_paranoid && !perfmon_capable()) {
>-		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
>-		ret = -EACCES;
>-		goto err_exec_q;
>-	}
>-
>-	if (!props->sample && !q) {
>-		drm_dbg(&oa->xe->drm, "Only OA report sampling supported\n");
>-		ret = -EINVAL;
>-		goto err_exec_q;
>-	}
>-
> 	/* We currently only allow exclusive access */
> 	if (props->hwe->oa_group->exclusive_stream) {
> 		drm_dbg(&oa->xe->drm, "OA unit already in use\n");
> 		ret = -EBUSY;
>-		goto err_exec_q;
>+		goto exit;
> 	}
>
> 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> 	if (!stream) {
> 		ret = -ENOMEM;
>-		goto err_exec_q;
>+		goto exit;
> 	}
>
> 	stream->oa = oa;
>-	stream->exec_q = q;
>-
> 	ret = xe_oa_stream_init(stream, props);
> 	if (ret)
> 		goto err_free;
>@@ -1458,9 +1429,7 @@ xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
> 	xe_oa_stream_destroy(stream);
> err_free:
> 	kfree(stream);
>-err_exec_q:
>-	if (q)
>-		xe_exec_queue_put(q);
>+exit:
> 	return ret;
> }
>
>@@ -1502,11 +1471,6 @@ static u64 oa_exponent_to_ns(struct xe_gt *gt, int exponent)
> 	return div_u64(nom + den - 1, den);
> }
>
>-static bool engine_supports_oa(const struct xe_hw_engine *hwe)
>-{
>-	return hwe->oa_group;
>-}
>-
> static bool engine_supports_oa_format(const struct xe_hw_engine *hwe, int type)
> {
> 	switch (hwe->oa_group->type) {
>@@ -1537,20 +1501,134 @@ static int decode_oa_format(struct xe_oa *oa, u64 prop, enum xe_oa_format_name *
> 	return -EINVAL;
> }
>
>+u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
>+{
>+	return hwe->oa_group && hwe->oa_group->num_engines ?
>+		hwe->oa_group->oa_unit_id : U16_MAX;
>+}
>+
>+static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_properties *props)
>+{
>+	struct xe_gt *gt;
>+	int i, ret = 0;
>+
>+	if (props->exec_q) {
>+		/* When we have an exec_q, get hwe from the exec_q */
>+		for_each_gt(gt, oa->xe, i) {
>+			props->hwe = xe_gt_hw_engine(gt, props->exec_q->class,
>+						     props->instance, false);
>+			if (props->hwe)
>+				break;
>+		}
>+		if (props->hwe && (xe_oa_unit_id(props->hwe) != props->oa_unit_id)) {
>+			drm_dbg(&oa->xe->drm, "OA unit ID mismatch for exec_q\n");
>+			ret = -EINVAL;
>+		}
>+	} else {
>+		struct xe_hw_engine *hwe;
>+		enum xe_hw_engine_id id;
>+
>+		/* Else just get the first hwe attached to the oa unit */
>+		for_each_gt(gt, oa->xe, i) {
>+			for_each_hw_engine(hwe, gt, id) {
>+				if (xe_oa_unit_id(hwe) == props->oa_unit_id) {
>+					props->hwe = hwe;
>+					goto out;
>+				}
>+			}
>+		}
>+	}

I think both the if and else blocks above will get you the same hwe 
object, so you can just pick the else code to assign hwe.

Are we allowing the user to pass either oa_unit_id OR exec_q/instance? I 
think based on the HW requirement we should enable OAR/OAG together, so 
maybe enforce that the user passes both params. Thoughts?

Thanks,
Umesh
