Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C9EC3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 21:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC93E10E1C7;
	Wed,  7 May 2025 21:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gOu5luRU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2839110E1C7
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746652498; x=1778188498;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=q0JeUIBry1gjlSgCTojiZyK5F16MXg3Ga0AyaqOKxKw=;
 b=gOu5luRUIcLKSNqA+Rn44UN6jK/I/H8YkPk9ebCRfndUJUTUxCXeK6xp
 sAmIf5p2TlKrfyPM61z8kEl/miwqTKGUV7KB96C9X5A/HiapEl7IALOd5
 5HxcpdggoKUsebuJfFrO5W7crZjrVRUAnVveJ9+qG3knG3lqW81xuQPOU
 9J39TAQ5Kv6mvn07L8RiyZEN9+UJMXpIfMz55SDyE4JsjUKV1f4dRG+7D
 6C5s0ZCL4LAduNkDyksSDJSr1+xv1iFxhsGWNM6eluEq/cBlK4ywBcNz9
 cdWNprGLi0rIcTDdA7nXmeaWV1IcYhGBHP/wjI/PzuBxCBqX7mHKrFWYj w==;
X-CSE-ConnectionGUID: 6qj0ShznS3Ccvdbzx2GeFw==
X-CSE-MsgGUID: yiCM3nGaQgewVbr0NZajxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73794003"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="73794003"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:14:58 -0700
X-CSE-ConnectionGUID: pw09ZKKoR+ipz/gDP90b/w==
X-CSE-MsgGUID: 9J5lcrYfTQeTWfi8TZa3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="136100875"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 14:14:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 14:14:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 14:14:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 14:14:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GepCDgfZxDelNU63SetyOws7kvgzc6JEzDJ850zKzxsxJoosbr4zVu4dffH0C5iwWG4E5Tzin7nT28bh9KhnQPZnEAfA302vDpk4exoqZLtqGhEJ59fHkj0A55Dr+fkImPpD/waDut0bwLdrcWSjsNObAcUhT/JsPOEeDdP1djtOEBvGzUXPCIsAReaJjIYQCNp1a0UTwXzWe/G+zOFgH15E71xzhKrUSy5AFMPCZifmQHJCPF9is32tmRsyokPl2+nMZl+G6HTrSe9eq3tclCIpX/Qx4MxhCM82o8rszhzNWCmlCyRhNrg6iu6UcCew8IevBhzyLueIMQXiGHT8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4lFiJLi5HL72u8sTHaIViKuVzwtxThT1JmrR1WTmEw=;
 b=kAocMp24hO1YO9jUlaDKXkA54RgLfGzcvM5ndfXV9dsIDEhum7ga/aGf/iyaG9C6yxlRmAKOeXTniS07bz/xK4uWbFU/prODSKa3ZRDqsvHC9Ec7BPabpRr1L+2gidYnHpf0oV0AdvZOyW5LjZS7JPXnnWkvaw6lmo22+s43BQPkYRXj+/+VJFlpT0C7WatAMhO+pUFoDUwJGSsUNjFWSg0r3wC3Z87URNNrO2k1TcFo3IEnNVHWdb2rCcP3dMRQPZyT87eaKGEJT25OShieEdXmUzOTirDNP7y4ODu3/Cm23j9bee7ubeUx5UC2IrFB2Bq7E27BZS0ECqcSc8gbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 21:14:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Wed, 7 May 2025
 21:14:26 +0000
Date: Wed, 7 May 2025 16:14:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Check 64-bit CTX timestamp for TDR when
 available
Message-ID: <njcubtyaqbejliohfpklue6b3zxbxat2ly6bz4imivaxoh37vu@wi3pickrjp36>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <20250507013039.2043897-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250507013039.2043897-9-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:303:b6::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: cc71cdc2-827b-47d6-a78b-08dd8dac257f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QGfZ8A8rnoIgXCjZiLmgAIaN4XflUI+Ts+ilTctt7m21H4PqeLOnlbZ18Y3w?=
 =?us-ascii?Q?zjEoELR1usV2wSuhNmb6B5OVF5nvWVbrvXQvtI/6pse7rWn9qdDB4TMMbI4I?=
 =?us-ascii?Q?WVW7YK8gLokzWG4UQZEhVBhOfMwAKPs/GTkzpyfhZM3363JYEshQZrTXlAHt?=
 =?us-ascii?Q?4z24kGYr0BcjnFBcZQvEFrnImgofn5YwlzCOybX4XhnTE6SrPtcP7fUNPLH2?=
 =?us-ascii?Q?pId0YkWHzYodwaM5wCO4F5ugbDNL4zR2XWLKwlFl9oI9KDSeslRQCn8ONkzI?=
 =?us-ascii?Q?xUghvvbgH1BR4SnVUoPcugtSS6fP9OMGG5j/pCKs8wNFBEwCBTez0qospk0X?=
 =?us-ascii?Q?pAvlpQ0LlBody94AiW3OzF0hoSywcDvJqN0Qnd9Ppsvc60NdWYndXeM/1zP6?=
 =?us-ascii?Q?MdzlZ19pHxMIm4bwv07n7T+XlKiDmIlNkyBZLoWZvmVxLnUXCKvyONkkYXBm?=
 =?us-ascii?Q?g07a3Ql9LHHCl7jsq7l8xt/XbKeiVmUZkDFIgIqudZanMT9IgjymmUAOuAz7?=
 =?us-ascii?Q?BFOnn7B/xRvVzSGYqZLBpa2y3CDqxMKWO2oDBj5gbG6M8VnFWZmzq8I1kkjc?=
 =?us-ascii?Q?1Agldg+cayrPBlQ9MkLIgh+oPMpJZzW6vEXaN1tWAktw+d2x2kHSmTARwpJm?=
 =?us-ascii?Q?RCHwbwyhkohCAtJ1iopjIVHg/Vxp+lJdXpdMBd0b9qCksjek0MJ0rGY0hvvz?=
 =?us-ascii?Q?Lo4JoTWsb4l3516f8KKQeK9B5j+I1nnlNyKY4njjAhG2e0CPxb+T+EkOevpq?=
 =?us-ascii?Q?+RUFnbBA14RbXgk9finaGV2dnc6ZxJodu27m58Srw6yBtalASP1OZWq6t75H?=
 =?us-ascii?Q?mexywNdtGJOhWAz95KHMq4b6VTgTxZcUl7csqqOnx61cjZ9HQeaVTlBcM6eU?=
 =?us-ascii?Q?oIGzO2EJNhCU8g48z1i26zoIiLeMHOKJ3CTAt9wS48mPS4KOt4hiy4U8VD8X?=
 =?us-ascii?Q?ZcmwsJRY4xK4DpLuF48J1I69i/KB7jpSuB5QWf7YudWsAjbM+hzUZLNv8Q23?=
 =?us-ascii?Q?1Ndo2aB4F8arNm0O3+yVdz6QL1XBh05PScvO9W7EVT8hA5PmYjyyPG0gTCOh?=
 =?us-ascii?Q?LCF6dWNgmlqdz5C1EuGHsmfvvh8no2/qfmDS0IM6NmVRze8mSJ9TQmzxjwiM?=
 =?us-ascii?Q?y9xGJZHOOrjuddj7Dhqn8DqKyBOu16OQHthOFrDlmyqZ/KrvMj51uj/KPUW2?=
 =?us-ascii?Q?nZaodekBLedsrl7tcZdoY4N2GPEnGSE+hCmyScPv5PJpdlORPMmhqZWhHQvI?=
 =?us-ascii?Q?pRaTpw9C21E6+4GNoRtxQaBCT1zILwDY6F+DAMctNWRF1dNJo+J9UlRd7zFk?=
 =?us-ascii?Q?vW9HtbZ8v1JT2/6HyhhErZQlyrahDRPTwhHW3KjF84O/p0nfR/iCIeH/JJ1N?=
 =?us-ascii?Q?ru5BAg9u68/X8FjLUBkzPbTuPKI3PTqLCOKWvj/m0C+eSIy9J1OwtyLlIz1g?=
 =?us-ascii?Q?agSZaO6ky/U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FIiGuSMBXEcDK7uL0bN4Wld0WKKGYmeGUt4N3oyJ2wvpNblKMsJqt9yz3VbU?=
 =?us-ascii?Q?89IZb1Ev0wUmLGeQaZdaJsoJzqw4Xxs4w17tG22fYnfK/rPtyUJYCefFqw9y?=
 =?us-ascii?Q?fEu24WgeEF04BKTfy/RsseBCULO3XiRlE6I0PyPSbJV2xjyF37rYC3+BmXJQ?=
 =?us-ascii?Q?GHUOlDTxE5Lt0K4Nu0wgWdrPzE97510iZIPwgRWGPtIgTVrCPUt3BynPXaWq?=
 =?us-ascii?Q?5JkJiOg5lI5D+2Ufg4O2HwbG0b1/ok5uKJdtlK7V4f4R8RysvTRrhlEZR8uh?=
 =?us-ascii?Q?biSXukALOxCV3BlnOfDdUdC3JBolEzZP1jxKvA4PusoGVYPHoo6M4ajijmxJ?=
 =?us-ascii?Q?FgVD6l6/koJnG8mmFiPKa5sX3wRqiwy2APj7qdCGt0ntxoa+aFsbyncGpbtD?=
 =?us-ascii?Q?ZtaEfT//uNnqmv6usr4d0vfy/Qd0GmeoHTs7tIbCzkGSjNT0cY/Uv3DzwBUL?=
 =?us-ascii?Q?C0nmYtXBkoIL1YY4rhnQ85HZrjrdD6/ntNKMGmyz0VrKrREZKBnZ6FDMW4wL?=
 =?us-ascii?Q?b9SfwK2IeHpUk3UErgrd+XPZ4KRWoK/ubKr98lUHXpnwtBfQmUJS9tvZttxe?=
 =?us-ascii?Q?IP74x3ZDTXYMAYuAfR2rmzv0dXulntDb20nrii03pl+QbG8NnuoAOrPR3Ss6?=
 =?us-ascii?Q?Fle+PgNeSm3hWsd24D4dBZwdpTijRDM8bdQvOeGu1+1/Txn7ope0OTZgpnLy?=
 =?us-ascii?Q?Y2L4i3q4PN6gN8hBQmWv2KYsvRsQKSscfrZjUNeeZ1XeGRIBohGD2EJqr4A7?=
 =?us-ascii?Q?o+9jYPhVPFqysLiKbRutYngrkEG5wizkNpyEcVwzy7kSrcXSUPNKlqi9gz3p?=
 =?us-ascii?Q?NU0qElGdrIuwjT3NOAlvC4ZXL4ts7uYTDMclsMlbN3U7Nji4qH2OwD5JxCMv?=
 =?us-ascii?Q?GpWTLGVcuiSALeL8O68yfV8NgMOin9jZzkIOr9BkehIYb9K1bcrhOADD+xEf?=
 =?us-ascii?Q?uowExiQr07aicLdcV3TfQBLZfQbt/2cOaBxXWNbWBbyM04eD+stUXUhbr6VO?=
 =?us-ascii?Q?abMb2Q7BGycJ/t9Xpvp7tpvvasrHwxZEQCYcTZCN++IwNLvJP5G3iv1b4Zbk?=
 =?us-ascii?Q?Y+hFIKpjRK1WhN7yOS4FZ1gvtkRTWq7xhC2pYrQKEOFqiusM1zmHPDlaDK9e?=
 =?us-ascii?Q?TD+isToJnafnRm/h0LxCzdpvgR/EJyrj3i30FWLEUQvIShwcfZixZ2fopeZS?=
 =?us-ascii?Q?pIYKxJDGbDWgi/UMa1kopwzV4PtjFEMn242efLvrW7QjYkWG/AgBHwoygCVo?=
 =?us-ascii?Q?No43Rjm7tiE4ImztQzTDqAwU3KRSQDyJh5otHAMbFN/hPhw87ZwdPKc05jA0?=
 =?us-ascii?Q?KUN7zjmPlGuxa6c8XePP9Vvig0pwmWAjDWRYJ4Yx2m5icjq0V+5VPkAFsLX/?=
 =?us-ascii?Q?A5oD0XgNFVnW2tCUCqP3j7+OnWgf3gmxizPRDZH+SSqQ6lwQz0lpEFPcEPVI?=
 =?us-ascii?Q?peY7W1Q46C2nsamufnwF1ax+V0NkKFnvvbWFlQU5YkZW0EfOR3p2r6Jnu+Ul?=
 =?us-ascii?Q?vyRFybpmP3gvFT3eZa2TI0uNvRVSvr8ZZidnOAMMJqzpsTbHcUlr2RH27fu3?=
 =?us-ascii?Q?HmW+qq439vgSkof9S1mMUqPRq0wCluGtKhrdojb6a61yDLuMgH1baS00auBg?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc71cdc2-827b-47d6-a78b-08dd8dac257f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 21:14:26.1510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M87pdNQ/eSw0v6oB+XfBAQ55cv4t4bQvgwvgBRtXJNup9F3BGPQBQHunTQgfsBmlXZCsPlNErXtpXzGgIIHFdHZpOysJU0R/aVYFdDlV+wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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

On Tue, May 06, 2025 at 06:30:42PM -0700, Umesh Nerlige Ramappa wrote:
>Where available, add support for 64-bit CTX timestamp when calculating
>job run time.
>
>v2: (Matt)
>- Use xe->info.has_64bit_timestamp instead of version check
>- Allow timeout > 100sec on platforms with 64-bit timestampt
>
>Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
> drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  1 +
> drivers/gpu/drm/xe/xe_device_types.h     |  2 +
> drivers/gpu/drm/xe/xe_guc_submit.c       | 18 ++++---
> drivers/gpu/drm/xe/xe_lrc.c              | 64 +++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_lrc.h              | 10 ++--
> drivers/gpu/drm/xe/xe_pci.c              |  2 +
> drivers/gpu/drm/xe/xe_pci_types.h        |  1 +
> drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +++
> 9 files changed, 90 insertions(+), 17 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index da713634d6a0..52f4c96c01dc 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -154,6 +154,7 @@
> #define   STOP_RING				REG_BIT(8)
>
> #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>+#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
> #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
>
> #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
>diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>index 57944f90bbf6..8619244b7c7b 100644
>--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>@@ -12,6 +12,7 @@
> #define CTX_RING_START			(0x08 + 1)
> #define CTX_RING_CTL			(0x0a + 1)
> #define CTX_TIMESTAMP			(0x22 + 1)
>+#define CTX_TIMESTAMP_UDW		(0x24 + 1)
> #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
> #define CTX_PDP0_UDW			(0x30 + 1)
> #define CTX_PDP0_LDW			(0x32 + 1)
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 495bc00ebed4..9446a739948c 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -334,6 +334,8 @@ struct xe_device {
> 		u8 has_sriov:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
>+		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>+		u8 has_64bit_timestamp:1;
> 		/** @info.is_dgfx: is discrete device */
> 		u8 is_dgfx:1;
> 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
>diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>index 813c3c0bb250..bef32f2b0081 100644
>--- a/drivers/gpu/drm/xe/xe_guc_submit.c
>+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>@@ -936,10 +936,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>
> static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> {
>-	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
>-	u32 ctx_timestamp, ctx_job_timestamp;
>-	u32 timeout_ms = q->sched_props.job_timeout_ms;
>-	u32 diff;
>+	struct xe_guc *guc = exec_queue_to_guc(q);
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	u64 ctx_timestamp, ctx_job_timestamp;
>+	u64 timeout_ms = q->sched_props.job_timeout_ms;
>+	u64 diff, max = U32_MAX;
> 	u64 running_time_ms;
>
> 	if (!xe_sched_job_started(job)) {
>@@ -952,15 +954,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>
> 	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>+	if (xe->info.has_64bit_timestamp)
>+		max = U64_MAX;
>
> 	/*
> 	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> 	 * possible overflows with a high timeout.

this would not be true anymore with a 64b counter. Anyway, why would we
need to be soooo paranoid to increase this and consider a diff >=
223sec? For the timeout check we can leave with the counter wrapping at
32b afaics and not change anything here.

> 	 */
>-	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
>+	xe_gt_assert(gt, xe->info.has_64bit_timestamp || timeout_ms < 100 * MSEC_PER_SEC);

the assert is on the value of q->sched_props.job_timeout_ms.
Why are you removing it? Or even why is the assert in this function
rather than on init?


>
> 	if (ctx_timestamp < ctx_job_timestamp)
>-		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
>+		diff = ctx_timestamp + max - ctx_job_timestamp;
> 	else
> 		diff = ctx_timestamp - ctx_job_timestamp;
>
>@@ -971,7 +975,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> 		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
>
> 	xe_gt_dbg(gt,
>-		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
>+		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%llu, diff=0x%llx",
> 		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> 		  q->guc->id, running_time_ms, timeout_ms, diff);
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 9d9be9383207..b5f5547c7c4f 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -653,6 +653,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
> #define LRC_SEQNO_PPHWSP_OFFSET 512
> #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
> #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>+#define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
> #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>
> u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>@@ -691,6 +692,12 @@ static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
> 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
> }
>
>+static u32 __xe_lrc_ctx_job_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	/* This is stored in the driver-defined portion of PPHWSP */
>+	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET;
>+}
>+
> static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
> {
> 	/* The parallel is stored in the driver-defined portion of PPHWSP */
>@@ -702,6 +709,11 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
> 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
> }
>
>+static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
>+}
>+
> static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
> {
> 	/* Indirect ring state page is at the very end of LRC */
>@@ -728,7 +740,9 @@ DECL_MAP_ADDR_HELPERS(seqno)
> DECL_MAP_ADDR_HELPERS(regs)
> DECL_MAP_ADDR_HELPERS(start_seqno)
> DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>+DECL_MAP_ADDR_HELPERS(ctx_job_timestamp_udw)
> DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>+DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
> DECL_MAP_ADDR_HELPERS(parallel)
> DECL_MAP_ADDR_HELPERS(indirect_ring)
>
>@@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
> 	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> }
>
>+/**
>+ * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
>+ * @lrc: Pointer to the lrc.
>+ *
>+ * Returns: ctx timestamp udw GGTT address
>+ */
>+u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
>+{
>+	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
>+}
>+
> /**
>  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
>  * @lrc: Pointer to the lrc.
>  *
>  * Returns: ctx timestamp value
>  */
>-u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>+u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
> {
> 	struct xe_device *xe = lrc_to_xe(lrc);
> 	struct iosys_map map;
>+	u32 ldw, udw = 0;
>
> 	map = __xe_lrc_ctx_timestamp_map(lrc);
>-	return xe_map_read32(xe, &map);
>+	ldw = xe_map_read32(xe, &map);
>+
>+	if (xe->info.has_64bit_timestamp) {
>+		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
>+		udw = xe_map_read32(xe, &map);
>+	}
>+
>+	return (u64)udw << 32 | ldw;

I understand doing this for the next patch, but for this timeout I think
we could just discard the upper part and let the 32b wrap.

Lucas De Marchi
