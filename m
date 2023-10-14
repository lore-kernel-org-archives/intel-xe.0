Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E6CCDB47E
	for <intel-xe@archiver.kernel.org>; Sat, 14 Oct 2023 00:56:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBCF10E034;
	Sat, 14 Oct 2023 00:56:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5890210E034
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Oct 2023 00:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697245004; x=1728781004;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fGlKywoscphYAFmMroZAqIlhpJZOUXGZH6THSq2kaGc=;
 b=L/j84J+ZVoselX+hrI1jKQ7KfAUtjrLl78TB3awFr09OLKeVjZ3sJxZI
 MKb5z1pWxQzVeD9axx3Df0IeLy/KfbpIC8B3zrwRT+IZB5w9r0NZk/2eg
 l0Z8uoVmLujyORdLPcRfmMCVgjlKBv4WbCt2/UPKmlweWcC0cqVtAN751
 e+hl37dMLg1er7S2PvIxB5axyIF1DiOVZMhBz5jCr3oH8RJhpIX9sMm1L
 /u6UXAopLWrnt/El8RG8szxbxp34Qe/JS2wzIMDj0bGhcnmuXZJaSHvpN
 oVKo0VdkhxulImEUGawRUw6VON8+2nKAO4N0qw8hZa1SEruV7ZuLHxp4M g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375644099"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="375644099"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 17:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="898754863"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="898754863"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 17:54:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 17:56:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 17:56:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 17:56:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UD3b7ude7gjFOlk/R6AKRJuX/YmA0h2zsE6CRHoZYUR3hJ/3XLeAvTMa9FI/0FbMmQ12vZUtD/TB6B6c1nZF7oaB6gIW0gS2dUz1yOgzvsq1UQNlq4vcyXX/dMb7DFcXFw/uccino34mV2W/rfZY1nUT2EXMyVicEMjfTjQyF8BI+P+JqmBqCzJUP1otL78EmVQL02KFcmdx3D1Ue++I3TSl+pcq8KqpqG7Xyfc3cCbemB4+fxfvlxI9sgwg1Z7Y/Fk8zRbihOI5aaZ0VQKkAYSFcNlps6YTrJbpDh8JSTAJNiJfsZ+85WwKX8rtEyBWQwloiXgjg3yAzc0ykM1ASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STA4O2jB0ok8HNGM97Wz5dsKBiYEER0MliVaWBAQ2ZQ=;
 b=ASx3x10OiPDlHqHnCJglwSUmGvsPxCd2h/3Tyf1wK+9cy9hzgB1Wgwz5D2o2wsvbUygRKDU22nogsA0PKApWLI+Pu5LFgKCpZTQ77M+zxAPJmZYdrty3ukU+d4LY2FAJs1Il0Dicoh4Ehp+mlpEjlolnI2DdPKWYSc90ux7lFgyQzN0uc5fKta+MVvd2zohBKY6wrgFq3dD8KN1DEPkaY0LdaKFeXaLPIyqydQuuDX6/SZaiJClX27/LsnFE2MmUq3+ooLQ8ZBPVQHgj1s/rVkC7VlaaLbMLEXj+WXqTymVlHysjHLsNlCT1bgAGw5yji/98jQQqrx1hz9BN2SgHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 BN9PR11MB5417.namprd11.prod.outlook.com (2603:10b6:408:11e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Sat, 14 Oct 2023 00:56:35 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::cd4f:fe89:df17:61d%5]) with mapi id 15.20.6863.046; Sat, 14 Oct 2023
 00:56:34 +0000
Date: Fri, 13 Oct 2023 17:56:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZSnnM5HJvVq+vCJX@unerlige-ril>
References: <20230919161049.2307855-1-ashutosh.dixit@intel.com>
 <20230919161049.2307855-10-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230919161049.2307855-10-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::24) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|BN9PR11MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e79e1f-3243-42d9-de76-08dbcc506950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C619iwYQ8wBpy1aMtxs4Z5F7iQ7YaQju59yfmAV15yKCbuMcN1bKI0R2RMsmtcj/niToouHSstFKk1PT5GBx6y+mgHKMgEJ9Q70Ny0ozuSDkvaAJ83uOXMvzsSsmQy6UPkYs7JRHmuShHnksqt035x8+b+g/MVwej1SoXCz/vVuXwnB189YFW7veq6Uq6698tG2IFVEq4DHnmQ2ULuNtUvmcl5J3JM1PILBLv8w3UQEtUcZZc9aRvuBBRM/p3qjxmo1JJmoI/44feLOlO1UzLkeS4vAP2VbvxNV4s7a/2eDEqsYU19EeIzaY18AsQJZ5Wku4LQlPMCQJ/Q6RBuj+FVOs6rFehm9XlWg/aBYkSPQ0EAG4Qjy4p4mzrad8K65yNMGPW1hnSap7q7O5znVj5+QPxAYUP2Ex6qdJDCH9i5VNS8PPwmavMURyXM3Qj9OuldIgxUiBAsJINLRbWyREHeC3pUFRbfJjJXD45qeXc+4j+h8Kq7f6zVXFYBGh/Nipz0UvbsVs5wp+IEQOXTPQGzBSKSsUT7uuOBnKdBOuul1YVd6QrboO4ssgtlZGByFA80+eLHeqtR+kQfn6vkphTJTkNHLANK6e9julIVTgS9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(376002)(396003)(346002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(33716001)(6666004)(6486002)(2906002)(478600001)(30864003)(6862004)(41300700001)(4326008)(8676002)(8936002)(5660300002)(66476007)(66946007)(66556008)(316002)(6636002)(83380400001)(26005)(82960400001)(6506007)(6512007)(9686003)(86362001)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkNPa0s1QXpuWTV4TjV1NnRDQ1phSmRKRWlicmVhU3BzaGl1aDFVR1I3Z2FC?=
 =?utf-8?B?b1FoVXJsZzJsb21OSitIL1FpZGw0M2J2WS9GNXFqVmZXZ3BwdGtnSzFMQmF2?=
 =?utf-8?B?SjJBVnVtWlJ3WnRYOTNtYThacmUyRUJMKzBkNGlEalJoMUIvcFJRRUNIeHpx?=
 =?utf-8?B?NUIzQ0RIbEdjc3p0cXlHYWlsLzlGWXk4RDhGdFlWdUxtNzFXU1N0QUhpL3Jl?=
 =?utf-8?B?QmdoSzhCN3lVQWtvVzg0a2RxTW1Dc1lFb0RCYTRlREVoZDljK0RCVmxuNnB3?=
 =?utf-8?B?N2JQZ0FpUXBlZHoxRUpYN29WVEJEVkorL1RBYTZwUlpudE8yUk9RazZWOC9p?=
 =?utf-8?B?RC9YSFltRXRFT3liWWJ0eU5SOE95QXIydDgrdkxsaUhHSEtCVGdOMDFnUVY5?=
 =?utf-8?B?a1B4SThhaThmaVRPR1BpQVhZR0RNeCtQTU9Jc2lVNUlPbUlSbGErTEh2Q2Q5?=
 =?utf-8?B?NEY5NENYUlFud3B4VWpoM29QeTJhRUZxMWoxTGZRWnFpTDJoRFhNcnA0UGh2?=
 =?utf-8?B?d3draTgzcnVsSDFYb0FqdjFxeGhHendGMnEyM1Z6UVhuNU56N1lWYVFYdFFq?=
 =?utf-8?B?Yk9jQ08rbzFFR2dRdlVJWW0xTWROclUySE52TE8wRURQMHVFRjdsWkdoS1E2?=
 =?utf-8?B?MGU4TlZTaU5FMmZoc29XNG5DelVuMUY3SU1JanN0d2xXTEFRVFVGV0xFM1FJ?=
 =?utf-8?B?Mmp4QnNDWFRBajJQY09QblViOWxtdjJWUElaMHJYRVZ3bHhUM0FxYXRTUlJj?=
 =?utf-8?B?QloxUXo5NGJ5eU9pZjJOTGJSMVVmeEQyQWRvOCtMc3dPVHNWMTFzZDZ3RXJ4?=
 =?utf-8?B?eEdaVVNxV2NPalg0OWkzUUZ1QWZtZzhUTkhjdHZkNEdBV0tNOUVqdGI5NEpa?=
 =?utf-8?B?K3dmcWxBbElwUURsT3RDbE5zQUZ5ci9QTkFPWnR4OUozN2lIWE4zRTBVUnlu?=
 =?utf-8?B?NFZsWUNvSVBsREpodjBlYktkTlV3RkkvTTFTQ3FOUTFKMEZYQTNVc3B5RCtG?=
 =?utf-8?B?S2tWbEZ6aTRQU1c0U3dMSmRwblNFS2FwdzJnSDRZQVFEZkhoazZWK0pyWTRJ?=
 =?utf-8?B?dzZaTmdMVmJUTDArMHpBY2orYUhsdTV1aDBtM1plV2JNTG5TcXVOOFkwOHVJ?=
 =?utf-8?B?aDNxcXdnL21DeXVvOW9RNy9ZMVZxVDQzOFpwYXJKbTA0WGtBVWx1QmFvbkly?=
 =?utf-8?B?NENyQXMzUnVkYmVnQzJ2TldlNThFYkY5RFh1bjBYU2tMaDI0UXpTS2IyeDN3?=
 =?utf-8?B?TWhsWWxJZElGTmZocnFZbWgwRXgzeDVqbERxcFVFbzVDdlNRdlY5TlpQOW8w?=
 =?utf-8?B?cFFHWDRUWE8yUWJFU3N0TE1iM3U1RklFMEp3V2NUOTRJTDFYamJieGw1dlZq?=
 =?utf-8?B?eEVWbjZkYXEraTBMZ29xVmVmY2V5MVpCamN5OWRUTGM0bE1JYXZGUEk3MXE4?=
 =?utf-8?B?TFVpTlJmSHloZGxOcys1d1VNcEJWYUV6KzhLR3gwWEdwOGtRN0poSUtSaWIz?=
 =?utf-8?B?QTRWeHF5Ym96cnZLLzQwYzVOL3ZXZkRleUNQaWJ3QTB1dGN2eWRLbUlNUC83?=
 =?utf-8?B?R2lCa3BJQjRzUVdtbnNsTGc4bXVyQzdHcENEbFAxMHVxSURaYldLVWVtZ1Vm?=
 =?utf-8?B?SjlsQk84Y29IclRnQ2M2SFJKSjgyUmNOeXZDa0tha0E0UlczMWNxbUk1d2hT?=
 =?utf-8?B?TnpPdVJBemxIOHFuS2ZMejFXdzBMVzg2VEVHdmRuTVZxeGdiSTRYZmVUWWE0?=
 =?utf-8?B?RGNYUll1dzhYa1k0MjZkZ1JQcUpZb2ZnZHRpSkNPQi9oTXVTVjhTemY1S3o4?=
 =?utf-8?B?MVhQZTJhL1lwNE12ZEhGZnpONHNINjlrN3VCbnBjTFNyYnBGaWhHekhQZHE5?=
 =?utf-8?B?dlVCREdGSlYwQndGRnk0U2g2eVRsM0hFY1Jtcjh4b2wvN1NxYjNZK3poSDBC?=
 =?utf-8?B?NjRYMVRkMVpyZ2xlV0Vidk1IWXNxQlRIcHpiWHdjaFRGczRuZUFHWVFuRDlN?=
 =?utf-8?B?WndDNG9xUWlLTUlFY0FQdDdFeGN6WnN1UURvR2ZCalU5Vnh4SThBYzJoZWlN?=
 =?utf-8?B?cjNHMmhkSGlqOUw4dW9CdXp0ZlRlOFVQb2xnQk5MMlZBN0k5OUpxOEtlaGNI?=
 =?utf-8?B?a0VnTW1TNFdFM3lKRTAxOEJXKzJrd09XbHZJT0J0UE5qVzgrNVhkUEpYb1NU?=
 =?utf-8?Q?wkVZ7Qdid70HCH0C31q2hVg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e79e1f-3243-42d9-de76-08dbcc506950
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2023 00:56:34.1571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h06jqy6plYuT/0khBVwsTPyc2zc9vAe378dGsB+dnzY0QTDC1QLEmFtkFlwfFz30HkVkJgrvf/+CLUJC0WxHtM3h3dPKn8/WQ3EhA5+b9GQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5417
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 09/21] drm/xe/oa: Read file_operation
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

On Tue, Sep 19, 2023 at 09:10:37AM -0700, Ashutosh Dixit wrote:
>Finally implement the OA stream read file_operation which was the only fop
>missing in the previous commit. Both blocking and non-blocking reads are
>supported. The read copies OA perf data from the OA buffer to the user
>buffer provided as part of read system call.
>
>v2: Implement oa_report_ctx_invalid (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c | 360 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 360 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 261b168a61bf5..d6d9dcc5c0bda 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -146,6 +146,30 @@ static u64 oa_report_id(struct xe_oa_stream *stream, void *report)
> 	return oa_report_header_64bit(stream) ? *(u64 *)report : *(u32 *)report;
> }
>
>+#define OAREPORT_REASON_MASK_EXTENDED	GENMASK(25, 19)
>+#define OAREPORT_REASON_TIMER		BIT(0)
>+#define OAREPORT_REASON_CTX_SWITCH	BIT(3)
>+#define OAREPORT_REASON_CLK_RATIO	BIT(5)
>+#define OAREPORT_CONTEXT_VALID		BIT(16)
>+
>+static u64 oa_report_reason(struct xe_oa_stream *stream, void *report)
>+{
>+	return FIELD_GET(OAREPORT_REASON_MASK_EXTENDED, oa_report_id(stream, report));
>+}
>+
>+static void oa_report_id_clear(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		*(u64 *)report = 0;
>+	else
>+		*report = 0;
>+}
>+
>+static bool oa_report_ctx_invalid(struct xe_oa_stream *stream, void *report)
>+{
>+	return !(oa_report_id(stream, report) & OAREPORT_CONTEXT_VALID);
>+}
>+
> static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
> {
> 	return oa_report_header_64bit(stream) ?
>@@ -153,6 +177,29 @@ static u64 oa_timestamp(struct xe_oa_stream *stream, void *report)
> 		*((u32 *)report + 1);
> }
>
>+static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		*(u64 *)&report[2] = 0;
>+	else
>+		report[1] = 0;
>+}
>+
>+static u32 oa_context_id(struct xe_oa_stream *stream, u32 *report)
>+{
>+	u32 ctx_id = oa_report_header_64bit(stream) ? report[4] : report[2];
>+
>+	return ctx_id & stream->specific_ctx_id_mask;
>+}
>+
>+static void oa_context_id_squash(struct xe_oa_stream *stream, u32 *report)
>+{
>+	if (oa_report_header_64bit(stream))
>+		report[4] = INVALID_CTX_ID;
>+	else
>+		report[2] = INVALID_CTX_ID;
>+}
>+
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> {
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>@@ -234,6 +281,199 @@ static enum hrtimer_restart xe_oa_poll_check_timer_cb(struct hrtimer *hrtimer)
> 	return HRTIMER_RESTART;
> }
>
>+static int xe_oa_append_status(struct xe_oa_stream *stream, char __user *buf,
>+			       size_t count, size_t *offset,
>+			       enum drm_xe_oa_record_type type)
>+{
>+	struct drm_xe_oa_record_header header = { type, 0, sizeof(header) };
>+
>+	if ((count - *offset) < header.size)
>+		return -ENOSPC;
>+
>+	if (copy_to_user(buf + *offset, &header, sizeof(header)))
>+		return -EFAULT;
>+
>+	*offset += header.size;
>+
>+	return 0;
>+}
>+
>+static int xe_oa_append_sample(struct xe_oa_stream *stream, char __user *buf,
>+			       size_t count, size_t *offset, const u8 *report)
>+{
>+	int report_size = stream->oa_buffer.format->size;
>+	struct drm_xe_oa_record_header header;
>+	int report_size_partial;
>+	u8 *oa_buf_end;
>+
>+	header.type = DRM_XE_OA_RECORD_SAMPLE;
>+	header.pad = 0;
>+	header.size = stream->sample_size;
>+
>+	if ((count - *offset) < header.size)
>+		return -ENOSPC;
>+
>+	buf += *offset;
>+	if (copy_to_user(buf, &header, sizeof(header)))
>+		return -EFAULT;
>+	buf += sizeof(header);
>+
>+	oa_buf_end = stream->oa_buffer.vaddr + OA_BUFFER_SIZE;
>+	report_size_partial = oa_buf_end - report;
>+
>+	if (report_size_partial < report_size) {
>+		if (copy_to_user(buf, report, report_size_partial))
>+			return -EFAULT;
>+		buf += report_size_partial;
>+
>+		if (copy_to_user(buf, stream->oa_buffer.vaddr,
>+				 report_size - report_size_partial))
>+			return -EFAULT;
>+	} else if (copy_to_user(buf, report, report_size)) {
>+		return -EFAULT;
>+	}
>+
>+	*offset += header.size;
>+
>+	return 0;
>+}
>+
>+static int xe_oa_append_reports(struct xe_oa_stream *stream, char __user *buf,
>+				size_t count, size_t *offset)
>+{
>+	int report_size = stream->oa_buffer.format->size;
>+	u8 *oa_buf_base = stream->oa_buffer.vaddr;
>+	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>+	u32 mask = (OA_BUFFER_SIZE - 1);
>+	size_t start_offset = *offset;
>+	unsigned long flags;
>+	u32 head, tail;
>+	int ret = 0;
>+
>+	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->enabled))
>+		return -EIO;
>+
>+	spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+	head = stream->oa_buffer.head;
>+	tail = stream->oa_buffer.tail;
>+
>+	spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+
>+	/* An out of bounds or misaligned head or tail pointer implies a driver bug */
>+	if (drm_WARN_ONCE(&stream->oa->xe->drm,
>+			  head > OA_BUFFER_SIZE || tail > OA_BUFFER_SIZE,
>+			  "Inconsistent OA buffer pointers: head = %u, tail = %u\n",
>+			  head, tail))
>+		return -EIO;
>+
>+	for (; OA_TAKEN(tail, head); head = (head + report_size) & mask) {
>+		u8 *report = oa_buf_base + head;
>+		u32 ctx_id, *report32 = (void *)report;
>+		u64 reason;
>+
>+		/*
>+		 * The reason field indicates what triggered this report (e.g. timer
>+		 * triggered or a context switch).
>+		 *
>+		 * In MMIO triggered reports, some platforms do not set the reason bit in
>+		 * this field and it is valid to have a reason field of zero.
>+		 */
>+		reason = oa_report_reason(stream, report);
>+		ctx_id = oa_context_id(stream, report32);
>+
>+		/*
>+		 * Squash whatever is in the CTX_ID field if it's marked as invalid to be
>+		 * sure we avoid false-positive, single-context filtering below...
>+		 *
>+		 * Note: we don't clear the valid_ctx_bit so userspace can understand that
>+		 * the ID has been squashed by the kernel.
>+		 */
>+		if (oa_report_ctx_invalid(stream, report)) {
>+			ctx_id = INVALID_CTX_ID;
>+			oa_context_id_squash(stream, report32);
>+		}
>+
>+		/*
>+		 * NB: The OA unit does not support clock gating off for a specific
>+		 * context and the kernel can't securely stop counters from updating as
>+		 * system-wide/global values.
>+		 *
>+		 * Automatic reports include a context ID so reports can be filtered on
>+		 * the cpu but it's not worth trying to automatically subtract/hide
>+		 * counter progress for other contexts while filtering since userspace can
>+		 * issue MI_REPORT_PERF_COUNT commands which would still provide a
>+		 * side-band view of the real values.
>+		 *
>+		 * To allow userspace to normalize counters for a single filtered context
>+		 * then it needs be forwarded bookend context-switch reports so that it
>+		 * can track switches in between MI_REPORT_PERF_COUNT commands and can
>+		 * itself subtract/ignore the progress of counters associated with other
>+		 * contexts. Note that the hardware automatically triggers reports when
>+		 * switching to a new context which are tagged with the ID of the newly
>+		 * active context. To avoid the complexity of reading ahead while parsing
>+		 * reports to try and minimize forwarding redundant context switch reports
>+		 * (i.e. between other, unrelated contexts) we simply elect to forward
>+		 * them all.
>+		 *
>+		 * We don't rely solely on the reason field to identify context switches
>+		 * since it's not-uncommon for periodic samples to identify a switch
>+		 * before any 'context switch' report.
>+		 */
>+		if (!stream->exec_q || stream->specific_ctx_id == ctx_id ||
>+		    stream->oa_buffer.last_ctx_id == stream->specific_ctx_id ||
>+		    reason & OAREPORT_REASON_CTX_SWITCH) {
>+			/*
>+			 * While filtering for a single context we avoid
>+			 * leaking the IDs of other contexts.
>+			 */
>+			if (stream->exec_q && stream->specific_ctx_id != ctx_id)
>+				oa_context_id_squash(stream, report32);
>+
>+			ret = xe_oa_append_sample(stream, buf, count, offset, report);
>+			if (ret)
>+				break;
>+
>+			stream->oa_buffer.last_ctx_id = ctx_id;
>+		}
>+
>+		if (is_power_of_2(report_size)) {
>+			/*
>+			 * Clear out report id and timestamp as a means to
>+			 * detect unlanded reports.
>+			 */
>+			oa_report_id_clear(stream, report32);
>+			oa_timestamp_clear(stream, report32);
>+		} else {
>+			u8 *oa_buf_end = stream->oa_buffer.vaddr +
>+					 OA_BUFFER_SIZE;
>+			u32 part = oa_buf_end - (u8 *)report32;
>+
>+			/* Zero out the entire report */
>+			if (report_size <= part) {
>+				memset(report32, 0, report_size);
>+			} else {
>+				memset(report32, 0, part);
>+				memset(oa_buf_base, 0, report_size - part);
>+			}
>+		}
>+	}
>+
>+	if (start_offset != *offset) {
>+		struct xe_reg oaheadptr = __oa_regs(stream)->oa_head_ptr;
>+
>+		spin_lock_irqsave(&stream->oa_buffer.ptr_lock, flags);
>+
>+		xe_mmio_write32(stream->gt, oaheadptr,
>+				(head + gtt_offset) & GEN12_OAG_OAHEADPTR_MASK);
>+		stream->oa_buffer.head = head;
>+
>+		spin_unlock_irqrestore(&stream->oa_buffer.ptr_lock, flags);
>+	}
>+
>+	return ret;
>+}
>+
> static void xe_oa_init_oa_buffer(struct xe_oa_stream *stream)
> {
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>@@ -305,6 +545,125 @@ static void xe_oa_disable(struct xe_oa_stream *stream)
> 			"wait for OA tlb invalidate timed out\n");
> }
>
>+static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
>+			size_t count, size_t *offset)
>+{
>+	struct xe_reg oastatus_reg = __oa_regs(stream)->oa_status;
>+	u32 oastatus;
>+	int ret;
>+
>+	if (drm_WARN_ON(&stream->oa->xe->drm, !stream->oa_buffer.vaddr))
>+		return -EIO;
>+
>+	oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
>+
>+	/*
>+	 * We treat OABUFFER_OVERFLOW as a significant error:
>+	 *
>+	 * We could handle this more gracefully, but some Gens don't correctly suppress
>+	 * certain automatically triggered reports in this condition and so we have to
>+	 * assume that old reports are now being trampled over.
>+	 *
>+	 * Considering how we don't currently give userspace control over the OA buffer
>+	 * size and always configure a large 16MB buffer, then a buffer overflow does
>+	 * anyway likely indicate that something has gone quite badly wrong.
>+	 */
>+	if (oastatus & GEN12_OAG_OASTATUS_BUFFER_OVERFLOW) {
>+		ret = xe_oa_append_status(stream, buf, count, offset,
>+					  DRM_XE_OA_RECORD_OA_BUFFER_LOST);
>+		if (ret)
>+			return ret;
>+
>+		drm_dbg(&stream->oa->xe->drm,
>+			"OA buffer overflow (exponent = %d): force restart\n",
>+			stream->period_exponent);
>+
>+		xe_oa_disable(stream);
>+		xe_oa_enable(stream);
>+
>+		/*
>+		 * Note: oa_enable is expected to re-init the oabuffer and reset
>+		 * oastatus_reg for us
>+		 */
>+		oastatus = xe_mmio_read32(stream->gt, oastatus_reg);
>+	}
>+
>+	if (oastatus & GEN12_OAG_OASTATUS_REPORT_LOST) {
>+		ret = xe_oa_append_status(stream, buf, count, offset,
>+					  DRM_XE_OA_RECORD_OA_REPORT_LOST);
>+		if (ret)
>+			return ret;
>+
>+		xe_mmio_rmw32(stream->gt, oastatus_reg,
>+			      GEN12_OAG_OASTATUS_COUNTER_OVERFLOW |
>+			      GEN12_OAG_OASTATUS_REPORT_LOST, 0);
>+	}
>+
>+	return xe_oa_append_reports(stream, buf, count, offset);
>+}
>+
>+static int xe_oa_wait_unlocked(struct xe_oa_stream *stream)
>+{
>+	/* We might wait indefinitely if periodic sampling is not enabled */
>+	if (!stream->periodic)
>+		return -EIO;
>+
>+	return wait_event_interruptible(stream->poll_wq,
>+					xe_oa_buffer_check_unlocked(stream));
>+}
>+
>+static ssize_t xe_oa_read(struct file *file, char __user *buf,
>+			  size_t count, loff_t *ppos)
>+{
>+	struct xe_oa_stream *stream = file->private_data;
>+	size_t offset = 0;
>+	int ret;
>+
>+	/* Can't read from disabled streams */
>+	if (!stream->enabled || !stream->sample)
>+		return -EIO;
>+
>+	if (!(file->f_flags & O_NONBLOCK)) {
>+		/*
>+		 * There's the small chance of false positives from wait_unlocked,
>+		 * e.g. with single engine filtering since we only wait until oabuffer
>+		 * has >= 1 report we don't immediately know whether any reports really
>+		 * belong to the current engine.
>+		 */
>+		do {
>+			ret = xe_oa_wait_unlocked(stream);
>+			if (ret)
>+				return ret;
>+
>+			mutex_lock(&stream->lock);
>+			ret = __xe_oa_read(stream, buf, count, &offset);
>+			mutex_unlock(&stream->lock);
>+		} while (!offset && !ret);
>+	} else {
>+		mutex_lock(&stream->lock);
>+		ret = __xe_oa_read(stream, buf, count, &offset);
>+		mutex_unlock(&stream->lock);
>+	}
>+
>+	/*
>+	 * We allow the poll checking to sometimes report false positive EPOLLIN
>+	 * events where we might actually report EAGAIN on read() if there's
>+	 * not really any data available. In this situation though we don't
>+	 * want to enter a busy loop between poll() reporting a EPOLLIN event
>+	 * and read() returning -EAGAIN. Clearing the oa.pollin state here
>+	 * effectively ensures we back off until the next hrtimer callback
>+	 * before reporting another EPOLLIN event.
>+	 * The exception to this is if __xe_oa_read returned -ENOSPC which means
>+	 * that more OA data is available than could fit in the user provided
>+	 * buffer. In this case we want the next poll() call to not block.
>+	 */
>+	if (ret != -ENOSPC)
>+		stream->pollin = false;
>+
>+	/* Possible values for ret are 0, -EFAULT, -ENOSPC, -EIO, ... */
>+	return offset ?: (ret ?: -EAGAIN);
>+}
>+
> static __poll_t xe_oa_poll_locked(struct xe_oa_stream *stream,
> 				  struct file *file, poll_table *wait)
> {
>@@ -873,6 +1232,7 @@ static const struct file_operations xe_oa_fops = {
> 	.llseek		= no_llseek,
> 	.release	= xe_oa_release,
> 	.poll		= xe_oa_poll,
>+	.read		= xe_oa_read,
> 	.unlocked_ioctl	= xe_oa_ioctl,
> };
>
>-- 
>2.41.0
>
