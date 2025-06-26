Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC52C7EE30
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 19:04:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1872F10E0ED;
	Thu, 26 Jun 2025 19:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIgBzKiJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586E710E0ED
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750964659; x=1782500659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VMg/ncB6pvBdjiu7Bl7m5kt84cEub3ExGwNLv7uFC3o=;
 b=LIgBzKiJZZg18f3Jc9eAytt/TCH3w2bFD3deJlFuIrMeAn3sugnwpP8j
 EVFt8KRHnnEvcdY5gR2u9zMLuqfuUP5a+uk3YoXjg79LIoJfQdMYFWYRh
 eK+J1wd1qAy9cTAxIAYLu2o0owbSm7+VDwipyeDzCpe2q5X01cz8CD4uQ
 iiJo1hfUQocGiqOuXO5xUqwoBoSQx1stG+8MUoq0i337rBzVMVfxP2OG9
 QUJ/kIljLLybkzuul2Tn+Dd/8QqvMKKWeK6VHU9TvrdT9Rf8FaBn2odd8
 Oals4y3+VqQxJUkJSR8HlJS/b2BI+5tTM/jco8CDu7R2skMLe+/FpDWik Q==;
X-CSE-ConnectionGUID: t4nUrlCFSwKt0MQIkwHAqQ==
X-CSE-MsgGUID: 7bsDq+EaTX2Cxt7WVXEVsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53417450"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="53417450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:04:19 -0700
X-CSE-ConnectionGUID: ZMsJaeKZRBSg9mWqCmOcZQ==
X-CSE-MsgGUID: 9BRj08eeRku+F91WCfp9pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="158342819"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:04:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 12:04:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 12:04:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 12:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL7ceyGEo8r6GMbjv8SJ/LI+VevO03BBZ3xaRQUkKIbh7z9unHQpLanMg/Hsep5HXhXXgpHFrf1hmlhzpQLn3pVw0mq85YhsQrx84UhDi2UbaN2Rjq5AIkW/TvKjmdybfpqlxwafIpbZZHA9LQIX93Z+uv3hi4YeCPQvZaBRgJVqXkbhSmy4KuD0eaAP4G75Zu/OhY7/ZY1ifUfbL1+XQ8FZ/OMB6StdMJo6SEtdqixSbB/GE3Zhs/Anap20R9Jzki+HVeSm+uFOApygyV1HNTCw0DAjU/KqMfr1n1SAp7Vm95jBbHQnToMQF9yNUKvS5gUbylW7QTiUw/8kZkJ26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhiZOSOG75NCcECWIgkHrNcGk8NyyXm2dlkto8qnOgo=;
 b=djkYP/W5mwUFi0JpSlz23Q+P3y+xACBZFrEh0obzFJTlNvbbeUFyMb0SUhY6a/c8lKq3WN6EBvJK45otrV439DHd1RNyLpVyb9OviZl2w6QDfVEQMVbRxKN7p5IN2LdNwFMbnfQchIDnMlmpvTM6PDOWxxYBFqExeYr8cj9d2lJNzQipmTsYYBCZeZ6Kz9utnZX0U9FSF6A+VcZfNuDg9j1td4igecht0XFOO9XloLMc+Q40FjkJC1Xzd2bYBS2bqNGVTXWgxaMr5XOMABkjKu2J7LAZ8UDCoBaieqnMMpadLmmKhX0r22pMoMV1VBUZHsBG1DF4JbsQdJUaEWlwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS4PPF2A0C3F85C.namprd11.prod.outlook.com (2603:10b6:f:fc02::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 19:04:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 19:04:00 +0000
Date: Thu, 26 Jun 2025 14:03:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] drm/xe/ptl: Add GuC FW definition for PTL
Message-ID: <ofqsdn5lbok56ekwcucazr6hwud45wzkd4nf7oni23j7fuemma@ogs6yalxcr6h>
References: <20250626182805.1701096-9-daniele.ceraolospurio@intel.com>
 <20250626182805.1701096-14-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250626182805.1701096-14-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS4PPF2A0C3F85C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c2de632-1cf0-4b9d-0d93-08ddb4e4344c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8doYKjJFbrAf2n2PrbzI0idHdvXs+W+Jigig7j+qdl/ewr1Tg3BaaoT+cWHE?=
 =?us-ascii?Q?eIie61nyqritxA4Y0Bpj2xD81P71iwxhLt7aDYzHuHTZag6CFajsI17guKAx?=
 =?us-ascii?Q?ll5HXg6bNWWFeVQybl94AXvNJX36j12/BooRN2hqJS+Rlu/SM+7SVA94IIE2?=
 =?us-ascii?Q?aQllouOTaiUJITwFMW3HJRck26gagOawodSWlQ9pBmso91s54rRBiJfTAizr?=
 =?us-ascii?Q?VmKq+ZDcrP7ljrphaayM9rZ610OYEdKl2Uvcp9Qp7UwsHz3kuoN6fleDWN1a?=
 =?us-ascii?Q?Gy+eGi24KVJCLC35mRKnwaxtw93fdy30G03kp3D49x8tOug0ze28YIrCkXJm?=
 =?us-ascii?Q?Nq+WzBcL8dFS6R9JVtFVn9trT73FJ66y3eWKG2XM8cBKsRvf3IGZBj6T1QF/?=
 =?us-ascii?Q?5gQW996MJv15CpNFUnY1rB4QgjZrM0muroivPAQidQ9vTT7Qc+giDf4xuExY?=
 =?us-ascii?Q?aRJ0CAZKLuGYojlRq2Up91r8EIZNYs5SFC56R67mZf2Pkb5yWOnwEnktCbxE?=
 =?us-ascii?Q?Tk0qUZ4LN4e9ed4ng5aApXV6kXmx+Rp1eI/48uOTM73uydmbb4e2340OFt3f?=
 =?us-ascii?Q?daX1oVvLiuEx1ey9xbz2pgj2FMMklqLtGZ93mx8Rlv6U7XNQOH+Fohfjqfn4?=
 =?us-ascii?Q?3pflCRQVBvgnC+ai6LgkogJ0EaS2q3FLzAS8g6pfcX54LgKNJN6en3p72D5B?=
 =?us-ascii?Q?Dv0y0HJ2juGiGSNffwDwqikpxi1ceO50Bkp5UH726rJhHOVndqauY7LFWiNr?=
 =?us-ascii?Q?dCGP5fHO9ZJ+oyJF5w43cueCstu2Y7UEANGzCIdU7v1ZnaO5H6N3c/FW8AJS?=
 =?us-ascii?Q?1KhC3Mm6r7jSEhK5t3mvjDOh9O3XDyVon5bsC8DeL0bT+j9RXl2HA1Vk4t9q?=
 =?us-ascii?Q?icoD20OCd8jiAkoFVRuEnp5Ys+garmsS77G4HLd01Nf4Wo8qXAZSF9eCb+sr?=
 =?us-ascii?Q?Fb98oWo1cNcXLpojTa1f7kqFk0T8WYN95/0roHx9qnVbR5gG9f1rN8YGG15F?=
 =?us-ascii?Q?DtRZ/5ExkkegF4TmA/mSnIhNjouCG0oiHBrXLEOjG3jOmU4VrqhYAb7T0CDc?=
 =?us-ascii?Q?w4S0Hx7iCsXLVI7eWdUQjnTh4RQygV7oHCWA0ITQo/aaloEcC4IrqGyIoGJn?=
 =?us-ascii?Q?0BMMjFZnyC1+NwWi6vEM7+NRqofjJzUfNUN/wCQ5sw2UIqpY4OdDnwR6AoS9?=
 =?us-ascii?Q?xakR41Jf6P0Tj1eF8+naXH3omtPGVlo8DI6/eKxM+jzlEjFgpb6YKVu6PI8u?=
 =?us-ascii?Q?HT5dkvEoNRM+xVMmoe2LUpFEBsJqizk4kYRpmWXjNNUdB7ky0z34ZC/sK8JP?=
 =?us-ascii?Q?GPjTd+LxJWS7bZZAzf7PBFKWt7n0RpcxzrnG7hNUItkFCcg/hw3n3iJh5Wi/?=
 =?us-ascii?Q?gNsFJB0DvsrXs8qBEf/fLNONx5HY7UzkmUoAPWZuAt+bO+SGpZcsPX3+vxtt?=
 =?us-ascii?Q?NXdDKIc3HBw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ntYdvXk40bQ4vq5X0Ct3v5XibIsrmW5d3rQGvFAGYBSM/9RPJi17zZWkKERt?=
 =?us-ascii?Q?5h4k8/tZSVTrCTDfnnm8Cj4ap5DdBkF2ztqDnI+E3oEkRV7+cb7HUcwJrG6i?=
 =?us-ascii?Q?aTcyKusb682MDLgS24IPwhUmngIWXvbUGQQAYGazXQOG/WpZViIcypUoDqLr?=
 =?us-ascii?Q?ksS1xMOwUu9JDAaCgOnN8XK8a38L2Gj1JS/s+S77+Nl/PApXM5uwr3k9hfWE?=
 =?us-ascii?Q?Ib3KDyv1pmz3JRQ2MO3v63KOC3TFpz67E6cvK9b52JPQ5yVWmylYLJ5G4Jai?=
 =?us-ascii?Q?QA4RSczjAFIgKVUrHZGNneUzyrDn5nvC2pqv5SZkXwefNw6P+ppi0YpbntT/?=
 =?us-ascii?Q?FzWhlq3Azw7PSQbWdQ7mUlXNLDTqGbppTAYuYAJ+KJL7STlZvMTkqX4OdKCs?=
 =?us-ascii?Q?Fsb2KagxnIG2m1XuRceFw1oieON3+LEJtIxAhYQ1UHYGlTUtE+NCoM1ugA/d?=
 =?us-ascii?Q?R7EGI/iy2ZsCRlivzpXLqBaLAbmmHyZmPmaoOFEVNB1y9IxcEdNsIU9ZlOZg?=
 =?us-ascii?Q?VEvj66gmFKDCXlrKTcdHefu4RQ85BxmAMb0JQ78hgXwIrZWuZr4ONcqavhol?=
 =?us-ascii?Q?vcZSDp7GLH/HeFHvAFTLJkJuxg2TBndT0w7cjGzMebD1QnjwqDtjejHEgRbG?=
 =?us-ascii?Q?FV2ugl6IRqitFHW4Nb3g263UmNFnFvzHlVpAKFEv/u5kqzojyE41jOCvt3wZ?=
 =?us-ascii?Q?umCs2GPv+OSc2uByqYOP0YlKngJKKaudySdu9a+f1sXihEa+DEATJZLILRZ2?=
 =?us-ascii?Q?TS/9/84etDpxBuN71sTAXJLKkBbhru9mzw9k6Qw1EuGHzpboVr3rwBL/3Btr?=
 =?us-ascii?Q?0mSPWq4ZXkBSAysj6p0lN1Z+93IjcDmtcPi+p3B8Wp2+nF2BYVo4d8OaBiJt?=
 =?us-ascii?Q?Bs2ANvPj5cevzknKzgKn0rJx2zDQ2ChklcC4dOni8ZgMTNPUOpH09WXqj5CV?=
 =?us-ascii?Q?Kug0xmUl3dg3s0otfn3qM1ojFIKYabnQC+Hntg0O/i9dn4nIaM1dtiqngF/8?=
 =?us-ascii?Q?WulBzfx+SiZizOkcPEr5VowyVnFiYoxm/V86Le+0Bb6e9WUNprJuo02BqX2i?=
 =?us-ascii?Q?jY3XYZdR4+1W2062xVjJa1d9cBQUYiEVOo9KVFN7VCCXg43Hg8eq7fLCzIfl?=
 =?us-ascii?Q?Ux+a/FmWhY8apYWEz/dgnznFRNdGX6XVEewisKRdq+T4z/kPH2vIs9x/aLOp?=
 =?us-ascii?Q?B+jgfb+Vv3kskU5DTJMDkwjSLZ/JzsQpE/7sgc/iTh82+4Gfd1KeyGO2efKj?=
 =?us-ascii?Q?GcwfSuBrvsugjJfCfqQ01rsL+Rcqbmsm321YKBp1xFM0z//g4K0rVn/eNOcG?=
 =?us-ascii?Q?HpJTk7cNOoZRDhOxc/jtKIxMcvHJscEICyuceEGl+8drESl93A+HYts5E6Cn?=
 =?us-ascii?Q?mIEHt2xXOgenkOLyZThFfpQRXLE7nSNnk+c7u2uqSNEhRnX9Rt/b1Do+vV71?=
 =?us-ascii?Q?h/mjGZC9EOIqs5eT+05RgTDgYZ7suRVAI2qZS1kd9gLsrtNcJNHWUOjdJGeg?=
 =?us-ascii?Q?Cxe6YFNZxbN87QzcypS3FjMUC/lTnmDXNZsN5wvh27EpALg6fDQFayX3GsUL?=
 =?us-ascii?Q?0XQpfATNTVLTa7aLqaSv0+qzCe23pujL65Bo/lfdx/OI6S8LFOlS/7CcWJrV?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2de632-1cf0-4b9d-0d93-08ddb4e4344c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:04:00.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzJmW3RTVc37dEBWdKTKGjwSo4i2tKvozwBcO4RRzpSDKzw7RBaxHVZ/T0BuWJFT/jPDZc/eW0KI2qVENRzdklqWCLE/d+8CI5vx8n5adqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2A0C3F85C
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

On Thu, Jun 26, 2025 at 11:28:11AM -0700, Daniele Ceraolo Spurio wrote:
>The first official GuC relase for PTL is 70.47.0, which maps to
>API version 1.22.4.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

I don't see this version in upstream firmware repo, only in our
intel-staging branch. Is this ready or is it just for CI?

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 4d3ace56f38a..2584ee3b0316 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
> #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>+	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 47, 0))	\
> 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 45, 2))	\
> 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
> 	fw_def(METEORLAKE,	GT_TYPE_ANY,	major_ver(i915,	guc,	mtl,	70, 44, 1))	\
>-- 
>2.43.0
>
