Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14400CCFA02
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 21:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C293210E325;
	Fri, 31 Oct 2025 21:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh3E0Ixe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFF210E325
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761947205; x=1793483205;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m8zR+krw0Ki+e+e04CCo74U/whW9Qor1yUQRBEXlKII=;
 b=Mh3E0IxeX9lR+yAY9a+a8s5HFFpskTAC6dPAw47kG6Or2zaDZ64kEDlU
 1CWzvj3vnFnRZlon7ScP27RjcQroaPYW5mNtK21RaxY450Rw6WCRBpAwR
 P+5XvrtnxOj1mJQbc8TvXR2DxFSpBH6ShSKHEk69v5w+biIqDZOcSAZtH
 6GA8kYXN+ye5X7334FNCK9p+ZwZNpO0r/PhyhAaTW3uQOGiW2DYP/QnXh
 pLxYG8IpmhbXuYRE9qnyLtjr3S6CKYftU/wIwTIrXHl4xcIGljNuX0ekh
 UsZ6HQxOYY02fbHE/LllkTk9kg7ybfBBvstehLk73uNUwSCRqHpxNA+72 g==;
X-CSE-ConnectionGUID: x+zNzVGYS1u88D+ZvUvsOA==
X-CSE-MsgGUID: yLBodajYT2SU1NhOEoK8CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="81743720"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="81743720"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:46:44 -0700
X-CSE-ConnectionGUID: 4HZy9D7nSMWb9BWb+tUEBQ==
X-CSE-MsgGUID: L1+tu23rTQ+Q1o4TRaB6Mg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 14:46:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 14:46:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 14:46:44 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 14:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRsc8x2L4l6plyqGDSeC8zb5mZWBs9eK4oIon3jZ9xp3JKIA8Zl2uJkSHAXHk/ZqgIu7mi37AUHGo2yD4NPhWXMMx4OSrsvkQhjjMRZcEsPqelNHrGiP9FGJqmNVnBBQV58suBJGQ9sdbG5cclwUTTbj3mIggHn+zmxfofy7J9nFkx6ABCemZhFlJbAAJhr5pq11iqdaYfl33n23RkNflxKfbZ+GFMXOmPcokbKfEqEVv3DuKlawsEXfuYnOYyl/niu2H9Nff8mDQP5cteiQCvhxWtvxR/dtsh5N0UAKx9u23N2UmN2QNvIoLAY3F9FR/ADSoK9aOoS04S/u/tsqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSAeEyonIY2wg6iRzq/zKSaoVsoHufWaxudphMhxhAM=;
 b=dDpI47ya/Kx1v3tBEalybt1fs0JLjb++RC/0maY9qycRwcW2a9zFI0Mn7l75bkKaMd2ZIKA8K+YF0/C6GRoNHIRN9BoVn/aPj+99yYo9emWmRn7VAtJ+/aJUmJxlRGzXiSNqQ86STMehx/qr0WLueYgO9hnY2Dj489ZWOpU2CWDGfb/no6zUmhkkYfRWlbHcbruw7jtoX8ezF+3OITNFpy6Sz9k+XFJXs7IrjjSCqy4CCDo3KHF20xIgnlpzdd0DUQiv+zx3SCrFF14gbuQh8m6UEuePCkzDstSXzPdyKr5qcvw1c4WtC7mycLN7kmlagwNpTJUvelJPYmmJOyQRIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 21:46:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 21:46:41 +0000
Date: Fri, 31 Oct 2025 16:46:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [CI] drm/xe: Inline gt_reset in the worker
Message-ID: <sp2m3eafb2xb7xye6b5zfy6brset3d3qircqrhwbayvvgzulcr@qujhjs5f4r22>
References: <20251030200503.3667381-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251030200503.3667381-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::37) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f8b3ea-26c0-430f-a01d-08de18c6fa3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hr6pCZoaO9Z5IQYleW88f/UjkuzDKG10r9+km1xQhr5ZqKLMa0iaT4P/1dGO?=
 =?us-ascii?Q?gKLLIEMCIcTtJyCoFWtbss1XeAnVfir8612NebWlsZYp7/yUScG0gcMak/8q?=
 =?us-ascii?Q?lbQkXrg9UYRHjfzW6Td77e0Bx16FPHlgLE5szK6u/41M6Gf5aClFsyPMB/FP?=
 =?us-ascii?Q?NgSUh8Q2ZIDtlDAcqwzAmqg7yIE1bNc3chmA4rj4PCbpuoCQMvr/CeX8bIZm?=
 =?us-ascii?Q?D1uA3jjiSJu0q2vyneIuU9sz0chiJa0ZnDl3PoHUu1dS31ZznJZ2CqUax/is?=
 =?us-ascii?Q?SbFCd9laZCMuva90S55gIdKW4ppTZijjNvh8ZcEWlWxN5vOZiBy2Qcwz17EJ?=
 =?us-ascii?Q?UAxkgxW3jclHx4BLK5gbH5mFpky1ZtMVhrK6pcLHeFKBG+sGNMJpcucbk0F5?=
 =?us-ascii?Q?chfamX8JqWa9uL5bSTCWkHkcZlSvn35B+fGD6oBvS7juPD3rb8rE7M3J79UT?=
 =?us-ascii?Q?BCF33zY2YRWohdbI+yQ6n+uOyhPsj5zr6n96RzwPo5yTXK4iI+qHYg/ZkxEL?=
 =?us-ascii?Q?GIkMJPCsG0tRRb5rQPEpMg4v22NrrpPBWKkAsxn3zzScGnH31+LTcHw69me0?=
 =?us-ascii?Q?J2JPa/fmVx//NfFKFWILL0llIbq+CxL+o9FI8O2HR5wm0IfvWZT8h8J+zLBW?=
 =?us-ascii?Q?B6AZB32VViO19dgMyKEXQYaMhmAP1Rh44RbPO4S2id3T7SVWEQXriWWvCNMF?=
 =?us-ascii?Q?T8YLDpvc2WX88Kf5vHLe1L06bdjFMt0QubFIWgkF4s0zmQtYwrFSz4km+8/3?=
 =?us-ascii?Q?9es2JAPO60B3B4Z1ME2OgpAPDSneOotpc3Tp/yeIZr9xpc/UjngOgI/N6q0d?=
 =?us-ascii?Q?9cODTEN2mlbL/0IR+Bx1/xU+dV+eDh+CEIRh8x9wIS+t4nVAhs5QelBGsWjx?=
 =?us-ascii?Q?J+vp5zDIc8VKG7Q+h/n3GoX94R9ivevqRBthn3iAVCOhP+OIJfJ9xWkj/KJx?=
 =?us-ascii?Q?mjKb7lDRdK6GHT0X7cpRwYtB9yzhZ8pNrR8x95lMcgIXzqGInhXh2axNHslF?=
 =?us-ascii?Q?33rcV4iOLi5xMrptN2aOfKQ8yR/iqqgFzWjuLJv7irS/gv287apalshUmfca?=
 =?us-ascii?Q?rf/VTr4u+Dx4OQjlFer4doA5oaNFViCMClaUaPlWM86QITaqwNhquxmFCbyx?=
 =?us-ascii?Q?6QFom0g9DOf5NqyYPgkpdUzF6BtMw82mSEil4kUh1gz1RFUr93WPs/2npxX/?=
 =?us-ascii?Q?x5uUy9UKv84k9OZMY0OvpJfBgrY1eYwJvvsvetZu/AsT7eiDF4w/yDjWgPgI?=
 =?us-ascii?Q?l2kE+lu/WT0exCS8GrXW99wcLcAr14xSn5WoEYFdQTQDTRlrIdYDRA0WTDxe?=
 =?us-ascii?Q?J/Vuh/RODk+VmqPUNcvBiKWKdc0+6PV6YOK4M+4J/HMO8bwXEwXLRmdjk94G?=
 =?us-ascii?Q?61B4nl1KwI3/D14eNjHCh7W2KRfMDre+qmYuKfvxUs5abRS7V62WoJbIPrzi?=
 =?us-ascii?Q?O1niK3ae9acoGPtKzOTpz7C5Ths2ie4F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G9iRs/Gm9ZWfyt4sHFw2sqDjGxeX6cY0rihUqX+KCBU0hJCzdseE2HHlXq5f?=
 =?us-ascii?Q?53zQyjR6iG5ehixpf/gQa3BxLuaGxqKoawa40HWpYtQpNUPvUTrWn2PAu4Ya?=
 =?us-ascii?Q?RXKMfKJlkBlaPrToXmNREs6bgZG1GCc1XWX7ryPvE4sRnvB5YZBpaH7hLKsi?=
 =?us-ascii?Q?iCMDHASFyx59yBUbEOSaK+eyGPPjw3Ks6orN42DB+k3cz+OMzPh4kuPMlDfA?=
 =?us-ascii?Q?jszqOsLCwkZ42aSQkNb4TvsYZTzvZcg3UKsA0Mb24yc6bP6jPtDgZLhqKm4U?=
 =?us-ascii?Q?I6P0Eo6QwZ8oWep3jqQ498E8ujpAz9vdAW2RSTtf8ixddT2sdiSibUx6sL3Y?=
 =?us-ascii?Q?66mhhHc+MatFmXc72P5Z6mYZxrHJRlB9raQG5in27DfACclIbaqHCiifL1HN?=
 =?us-ascii?Q?AFOc90xM7k4assVbFIGjKQCp6X6ODro8t8k6fT5dbqprvJBkcdLVO6Jr9c7h?=
 =?us-ascii?Q?ygbpmldeqSST4wM+rAv/uxw3WBHBs7QaNdN8o9kLmEC09aSOC6uKxOzpD1Yi?=
 =?us-ascii?Q?cc6C0Ac5Or6Ohx62ENtPgmmhzQ7cBxL6DJMeexWtXCYoPvpVm+ApFH4i4GUa?=
 =?us-ascii?Q?Rz/9g1wGprQmYJd0Rl/e+B+NmXgCv9i8bjofkhWtEpk5OqhW18+W4CIE5nqx?=
 =?us-ascii?Q?WsEu2HaAXL0lpADWMv1dBGlMrPt+oQqbsYRskakIFDWCcFZg8I9AIxwlFX1O?=
 =?us-ascii?Q?Mbn3anPMYHm8H7wv/yRLVQG2X7tME71AyRa3eK+EAoae9uyUZ227UxSzXoH2?=
 =?us-ascii?Q?mGt+VKQABzoGBovrjKgCfQTIGwnw7SDniIWuDzok4KNo/tTTqLD++C3oBGV0?=
 =?us-ascii?Q?7aGmEJc7Y4o/b/C4+xvb4onRu6AxGVyaB42PQR4cKGDOR18YqVMx+oBeR0G5?=
 =?us-ascii?Q?9EzMUNjv5RjsmWT2Cza8NY2pfKbAZSUDg7YMsC/3LZnCxcb85jv9P2l3VdkC?=
 =?us-ascii?Q?73JtZAIpQViNmD6Tyyb626fUPgC44dcwYcyMj2uif/B7YQWmDLgVTG9oDU3L?=
 =?us-ascii?Q?aSdGQrOhfoqzJ25nS3cZ2Q1vbo73xs6DiiPWrFbwEWyFnYh1CRYM7NpoRm8b?=
 =?us-ascii?Q?V3JDYxv8vbhfYkr5oCwUpnf2iz8gxMXo5Q7SKQzEwKMYhglh4UwznuH62GgC?=
 =?us-ascii?Q?jbONUmwL008bgzO0kPMkmqpQcCdgpnF+JGRX8Z6i2PKM9sg0/xeHrul7fwVP?=
 =?us-ascii?Q?Wl76VBiVx9VzIxmAT6nudIw3fjdLTFb37pw4TcyrNhev/ByIzwOtIC5BzVkI?=
 =?us-ascii?Q?eNW6zpGTDoSIyZEhc17Ei0ZX4y2FXXabb1zue1kHHwq/3kF+MYxpNXrY62Ox?=
 =?us-ascii?Q?HXhsKbAJfyE8U6U7oS2932zSCAcG3+HKlsBzR/3EzMGOK6OMDZC1lq1/AjnV?=
 =?us-ascii?Q?X3GQoj/ILrVXVC/YY9Kp57kfgKyQG6vLskzOQQaxKTTNgVV/OzRtbc/+ujTG?=
 =?us-ascii?Q?o4pcG9dn35hh5pFuHW5cnljKfQnT6/97AEgKxk7hvbq3uWzKgdDkZ2ThA1vG?=
 =?us-ascii?Q?o0AT56449p73Iqr5a0Aczz7z1VqHlZAyo1ZQa5j5JvNdlTQjumfskL73VHcr?=
 =?us-ascii?Q?6ME3i8lcmzYXN3QSM8irJfugXWQBwS+3eLRqgPej77NiZTTWu/spzX02MHsy?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f8b3ea-26c0-430f-a01d-08de18c6fa3a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 21:46:41.5637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /G4noi+CpqJrqYYY241z5jA2oGX2tHwJ8RZq5LeP28FRPlurvsSzBhjojMJzmSmWwXufZGvZgzHtxf2aWjow9Z3sm8ZMZz+b+7Pp3oprVho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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

On Thu, Oct 30, 2025 at 01:05:04PM -0700, Lucas De Marchi wrote:
>@@ -864,12 +857,12 @@ static int gt_reset(struct xe_gt *gt)
> 		goto err_out;
>
> 	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+
>+	/* Pair with get while enqueueing the work in xe_gt_reset_async() */
> 	xe_pm_runtime_put(gt_to_xe(gt));
>
> 	xe_gt_info(gt, "reset done\n");
>
>-	return 0;

oops, it should have been

-	return 0;
+	return;

With the xe_gt_err() in the failure path it's also good to keep track of
the error, so I'll bring them back.

Let me do some tests and resend.

Lucas De Marchi
