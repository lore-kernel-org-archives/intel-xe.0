Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69675EC1451
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 13:56:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2137B10E817;
	Tue,  3 Mar 2026 13:56:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJUWC1RY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D713310E817
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772546185; x=1804082185;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=RufaQJL9j9ZkBJhmhTF+YtFlE7LoNWuw6WNZ4TnlQa4=;
 b=JJUWC1RY/Jw+UNGfyfF9S1ZMP118xu5aPCedDJSftbn4CWGvzvp6iYmH
 SOiGfHJzK0zVyP8edqN8IeNEeSDTLL3kq9p84bMJpFpB2yDyuJZk66z7O
 18ExyUVc0r84fdO9Z8gBWHyrctzn2PMELsPW+jvCZQ+f/aI4YCEA5xcgO
 5B+tOKCL+MtKLBlCgiPBsdpk0ijoxoTZeGjrfp5iX0aukWigl8ZxDUgvD
 4ilpksgs73Wei8L+3JJw4EoHVloms4TwzglCqXWL78rbmuRZt/CImsHRa
 q7+/s7KO12gI28rN4kB33RWMXVVjHJQpRmlsUAWgLEevVb8/skf5aT+3w Q==;
X-CSE-ConnectionGUID: xBy324NYQBC5mcIvBB73zA==
X-CSE-MsgGUID: /uG70CxLRcayYXHpbUePRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84218192"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="84218192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:56:23 -0800
X-CSE-ConnectionGUID: SFbYLU7aTNq039cA/PDQ4A==
X-CSE-MsgGUID: sUll/5PDSxqmgUn8kcwhKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217158540"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 05:56:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:56:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 05:56:23 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 05:56:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rp0O9xDPdP+5UEK1qirPLkfGgblX47Qu3nB6PJFCb6HKGL2ijgW4+vERWdFI9sgHO9AlzoF1dn8NwkVge3F2ji0NDoc0RdEv7rGbCmgq+/5lOHpgveKV3s6Wy5Qz0ODbIP/p9wFIbxb8KCtHWrggWpgAv5BmNNgozVeH6oRRZTetHizeJTWeTkDoQR5v+/Sd6YUMw5Y+4JOO4YTkvDEocVsb+fEPsAmC7jISLQL3V1/+vY9eGtFyTamNrI3BPX/sp7haJ+GwEWf07PeuCfftDr3EDclpR+lDADjm+YgULCB7meNGZEBGqAtyBmpTjSjeNbkfD7V4XyLn+8YR0zCxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+zM2gM58yhT2k9P4lHE1rDv2YYdePaW68u+bP93inM=;
 b=j1jgIwICDLR2tHzVE4e4ebupZpj0Ef5Tf5FgWdD1EfIv8zzVW5bhVfrDPZJQ+8av3HpVEFUSonXA5fd3vJs5/YPYxHwCEusxEXUxyUNRZn8K4tcg4xtzb5ZTwPe2Aj3hKvkswKYKyJenwIUxlkVplkMmdGUNGtLB5C9H05q3cRB33BUJW1DcrqM+0mKdWVU7VaXaN5GZAxiZ7wHlUAuWCGmtG+iGxAnBl5t5iTp5ttHQZFGTa5/UisN5J2V0yJZ8zapm1C0qJe97bqFET0iNf87JsJOdXQyNVewd1F3S+YzSHKikNUl0NvNmwZ2kKbqIi4/MrgzUvhHXqLjULBNb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 13:56:20 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::cdde:8d34:980c:776e%5]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 13:56:20 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/hdcp: Add NULL check for media_gt in
 intel_hdcp_gsc_check_status()
In-Reply-To: <DM4PR11MB54568FCCFAA9BBED0EDC4C10EA7EA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260302-check-for-null-media_gt-in-intel_hdcp_gsc_check_status-v1-1-163d5f826b30@intel.com>
 <DM4PR11MB54568FCCFAA9BBED0EDC4C10EA7EA@DM4PR11MB5456.namprd11.prod.outlook.com>
Date: Tue, 3 Mar 2026 10:56:16 -0300
Message-ID: <87o6l5m2yn.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0037.namprd02.prod.outlook.com
 (2603:10b6:a03:54::14) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|CO1PR11MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: 256939b0-457c-44a4-63c9-08de792ca5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: krlkjPHc0xOEwwCO1DqJKoKTN6aGBTjVUmtuDPGzA/fxmU1blJwq1oQBTG+tFVa0Yl4QIMVu/MjRYEA1oznHxlJOIdQg4tHU3PDljCW255in0JqpnHe6RvxWx3/scrNvg5+6GBDzM5BllSs5FTgjN2cjWYV8bUsH9k33XCfU5f+64WUVHh5ZepB7ot4r9Cj5oEnozsGgaejM4/wW6Klub/+jTG8N/5VosBOADiND5arTU+sm3PRZzOxWLdNXBHxX6lijmiURx8Vl9jbLlQ7RR3HghdFtD7HSvRt8CKKBe1Zro1bQZoQWPZolDQHxp9xFqFZg947NQOuaYiKLNjFMPkbb7XoHPP80IrpFx7e3c4zjWlVzAU9bnPNOZ2nGg56By6XuBUt2HaA1wjIhE8qCr/MxDM2e5/ag8Rr5rbKypTVNIm5MpQOdCZsq1lMX82CfOXkVZ+RNZPoiUmb4VloruSp6DhXlFGr3T2YEbmaAwUNuo45zsV2fwjRu6JaUO9W6NuA36OloNlrzaXEVPtK1GttayMBARb5kesmT8veSElA5WWK5E7YcKB/cfuUYeZ92R02haWx+VXAhgbesguxu0X8rnoK9cl9yDMaXcvL3FZqiP1Jh86hH6Cgnx41O9G06MFiXf0rOyJU0xtXJF4WYJ7+/ZMoTibQmK/RHAwGLLdznEr4GF6S4Po7Kalnhd30BUVWmxQuhis5WnuFrVReOFz4vDjOeCye9YD6eGTio65k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gp5Z17n6k2IS+jcsV3c6kGoIIwi0h/c8IPNEX4QFvZr1vgzTwom4vvGA7YxD?=
 =?us-ascii?Q?V0ntzaW9i9wk9RHz6Ik/0lt6bmYpEU+yjhVCvDVd+P/vAiUPzocQR+Pm/huM?=
 =?us-ascii?Q?ywwhFhTry71M9NJ2ssWerBEuUs6vzFYZS8nwRnEIQ4KDIfsSqEt8k9REsm1K?=
 =?us-ascii?Q?ObhwNq9cK46g0oQsXGwLGWKHxfqVPZRteRPlJh1jBpwTMaGLtZ6xBYgTJvm4?=
 =?us-ascii?Q?n5aO81iHJHRd2VNkVV3ihy2wUIoUhAGDrGEsByOQKqVxFp2IU/7nLutP0y8v?=
 =?us-ascii?Q?yPUbLXydMo1nCwVXAdbCL6gS6TufjPolkJfOcH/xCAGNFxFgyR7zs/1gIK9h?=
 =?us-ascii?Q?EFY+niLfTr0Edf+Fr76tLPcMZBmlqnE2biubil1XjpdslXBbj8o2RhnihgMS?=
 =?us-ascii?Q?vJ24vHYGNSB/UuZJH8XhCi0FD6XZ7z2CCskvPAgFw3CA9ZXRxBO5KJTlgM9D?=
 =?us-ascii?Q?FDy3L3JnBNTP2Kq31NAeS4k/OfmxBIGUDsiFCq+nlsgXC8FKw2c573AR7UBc?=
 =?us-ascii?Q?734wyVURtMnzK8D7Z6jvbpwHcxNuDjkwgEp9zqrEK15D3fHv+7/CtDgiBSMm?=
 =?us-ascii?Q?zH+068BT6kUY3qnS0i8PjRWVqxOyhkppxW4pNGJtflGQScMgf0dbL6LsDPl7?=
 =?us-ascii?Q?odo2hfZUKvO+5iQs6PCrNLRvQuUmVwq3KA9LD9LqjhDhejkCsUNFAsoc35Ol?=
 =?us-ascii?Q?ka0C2mSIXxziGOBaqnx44DAraqSVcgZHdrEx6Q82bb/6QZg5atpYoLNbaV3O?=
 =?us-ascii?Q?gZaHwHrNp4I6UYdLiUcAx2YfP5nZArbWhEQdXyf0PSfjrD1bcWb8mzF9UK9E?=
 =?us-ascii?Q?MONMI3Amu6KplnJewrGxzbcsCKKx+vNAObs0gPtH+Fh4VXzjzeR/BENLqMi5?=
 =?us-ascii?Q?Yzgod4W6EmuyI64le+jwFsrvClQ9gpybjaTW6XaFk70jtyfMDUhqcbMUWQ1o?=
 =?us-ascii?Q?GRzEtU0gX4ni3GoCmyyOQg3KL9CTgNkFmzWQ+7037hHLP5buxqXROm5OjctI?=
 =?us-ascii?Q?Tsfm4ryaz/HexkJ782LdEY3+i6Xo5rdPQ8PeYRmE062A/R1eOs4igFFFyM1G?=
 =?us-ascii?Q?TiRmfdJWG9zXKhIO+oV21ziR30hkji27BkmvyTZTG+YYuTTkGDspg9sIQ2Lu?=
 =?us-ascii?Q?PRo5CESFmGghq4HrM5f22JwR93jbjLTXtE6GDXz7jomG6c2RyfFVSb/p3rxb?=
 =?us-ascii?Q?ELEXUJCzys8mgl0KIOxByvCa+jDgYM8n5yYXMlpqQL6jCwRgjyU0RlrdCEBU?=
 =?us-ascii?Q?HJzEbDTFAT6eh5ccn3m8StOb/BDnLku95sNFvG4Ouj/CV2lw0S65B/Ps+q84?=
 =?us-ascii?Q?IpHbvMObpjJrs8GvSjBubi4G/E14IgIgUxs3i++5kAWkqbPkiyoYTOieF+KB?=
 =?us-ascii?Q?y0aJ5fp0FvMMK1ly+Bq18Cc++pXL0100bQWGkYCMWnOuUiDEEaYhBimtKt16?=
 =?us-ascii?Q?Zqe8wBdqMvcvjWyY2Kdf/KYpPYBJumbbH3IpFnqntyXprRlFgprhRZPdnmgs?=
 =?us-ascii?Q?gaQO7Fbvcxf7HAp5Y2KI4JTfW+cHnbCPh/MTdCz4lDVKGjAniC5rMM7ovvPT?=
 =?us-ascii?Q?N57q4Bz8lxmTq6hHO6aLY3P/RSGK5G1gBeUHGHwiDzj2DvX+bNTlIq+J61Ia?=
 =?us-ascii?Q?MceXwio9u/eJ5xO2G1mll0GOGKZEo1pplkTIcPie93z3RLUnqG9NDSuy3C1B?=
 =?us-ascii?Q?qlakOkpcvn5MdTShyjntC2S6FNrJ6FO786Q5tr2mdYFIl5pPsr/lni3lrf+j?=
 =?us-ascii?Q?vQUpvy3gXQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 256939b0-457c-44a4-63c9-08de792ca5c9
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 13:56:20.2106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVagw+Et86DtARUXcVOLrBFGuRqnN7IF49aiTT5kfIWao1pZTIXrpgAcQfLMbB+1p3L10XnPpSk6/DfMRW8qSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
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

"Lin, Shuicheng" <shuicheng.lin@intel.com> writes:

> On Mon, Mar 2, 2026 10:19 AM Gustavo Sousa wrote:
>> When media GT is disabled via configfs, there is no allocation for media_gt,
>> which is kept as NULL.  In such scenario,
>> intel_hdcp_gsc_check_status() results in a kernel pagefault error due to &gt-
>> >uc.gsc being evaluated as an invalid memory address.
>> 
>> Fix that by introducing a NULL check on media_gt and bailing out early if so.
>> 
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> index 29c72aa4b0d2..1cac00c17d4c 100644
>> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
>> @@ -39,6 +39,12 @@ static bool intel_hdcp_gsc_check_status(struct
>> drm_device *drm)
>>  	struct xe_gt *gt = tile->media_gt;
>>  	struct xe_gsc *gsc = &gt->uc.gsc;
>
> If gt is NULL, this "&gt->uc.gsc" is already undefined behavior.

I don't think so. It just turns out that the offset will be invalid. We are not
dereferencing the gt pointer here.

> I would prefer to move this assignment to after below check.

I think that might be unecessary. Would you agree with keeping it as-is
based on my argument above?

>
>> 
>> +	if (!gt) {
>> +		drm_dbg_kms(&xe->drm,
>> +			    "not checking GSC status for HDCP2.x: media GT not
>> present or disabled\n");
>> +		return false;
>> +	}
>> +
>>  	if (!gsc || !xe_uc_fw_is_available(&gsc->fw)) {
>
> BTW, if gt is not NULL, then gsc cannot be NULL. So this "!gsc" check
> could be dropped.

Yep. Makes sense.

--
Gustavo Sousa

>
> Shuicheng
>
>>  		drm_dbg_kms(&xe->drm,
>>  			    "GSC Components not ready for HDCP2.x\n");
>> 
>> ---
>> base-commit: 40e52ed6c66cef091579dd7fe49ccd2de135f5c5
>> change-id: 20260302-check-for-null-media_gt-in-
>> intel_hdcp_gsc_check_status-071898b8a402
>> 
>> Best regards,
>> --
>> Gustavo Sousa <gustavo.sousa@intel.com>
