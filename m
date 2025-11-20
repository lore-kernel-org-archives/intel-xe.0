Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF369CFA448
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 21:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A335910E7D7;
	Thu, 20 Nov 2025 21:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RG87iqu7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3372010E7D7
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 21:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763673241; x=1795209241;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pZe0f0xI2iDwyGnW7uuD9y57DWpQeCDQVZ5kJTUvzc0=;
 b=RG87iqu7PmwdMgMXlDDt1miwKHnPVnWCq9o5vluweIU0BEp0vFSbImL+
 /LD52r/eNCJLc4CxkcN0B7YCniONBg1XaFmMslBLQtqQc8Td92rvP+bc3
 vW5Ed5iKRYGZg5NDjli8/qH8VSedC3L79iomWB1WZDhcLOe4y8qxFIN02
 rmIza/vpm8vwXo//9shB6f9H85Ba943/+8dc32u57tZ9jTwDRG0PdxzHF
 O/p8ubxPUp/W988yXUuSJrQre4xz2CmJnv559Nqc0jM+pKhEYF62KMkJp
 l82NHFwVeXIqSBaTZbQZroBLYUP0YIML/k4yypaJ0t2PeW/Ur0KhiivYc w==;
X-CSE-ConnectionGUID: YJDK+ztUQqWKeG5HYoB8FA==
X-CSE-MsgGUID: 4sTrJg4xRR+WdOwoWEY0Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83149421"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="83149421"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:14:01 -0800
X-CSE-ConnectionGUID: G+gn0XEiRtqN8Z27VkJ++g==
X-CSE-MsgGUID: UHYW+SKqSoKYacsGH29f0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="228785031"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 13:14:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:14:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 13:14:00 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 13:14:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAqX3lw90lxadJlpxADqfzOgos0uJvYVkSU5YuJfJ+tZTFVpPRT5ix1rxNWTnhdyE0HGwNhbeZ6hxCvNmW2r7gWIcba4u4C2CiyuIUVC83f79ieucnNWFK4T8bJ1nZpCVLO6+d1hGVGHXEZDOvKK/pjAJ0n+4u0gCrapIy5xczLaScauKmzPrlgGLTmRSyv/f14T8DICfvlw8cIAEVD4k5amne+3k0v+TaXjwog2VbZNupQWxjXqM7D5383gjil/lknrbQHFc+OV6X+C43HAe44XAfLuVHk7VWAEqro9C6ZP5VR7OqajFrzoxjKqsMQOUVGBsg2bLCp14jNToSB1gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRTFaULLqmqhzhPsEGKK1XSsd3vzaunwT3CsSMlHENc=;
 b=DHEpq4gws30sTUUmio7RhPO/cr4xFkW6yvJMEGHpN/jPeNZlfSArurAbcs5prQWoJHqQHjIw2UOIpBTBm9CiZIS47/F9H36xuw/kxYWNVQiJOJ57AkDE/HGDOX/xY8PJJpd6QyDCMpjOfTLKLGnyU3v3oq2B5rn0kW9Q5Ux6hYPWWVQ++KtlXRYmx+5IvuUb3+3GXAzIbPoQdQlGO0FtNco4Fr1i2+0zBX50ecoZ+3/gN5GL4Q9Ov4a2i+zJBGgg1DyYBG8CKxAajoJ/rPwu/6ZJzAJxI7+/TbM7HbxP0REOmECVsIhcxvLCLcXpFM6mOJ3OaDd8nSLSOO0EkjCrEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 21:13:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 21:13:56 +0000
Date: Thu, 20 Nov 2025 13:13:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3_lpg: Apply Wa_16028005424
Message-ID: <20251120211353.GH4063759@mdroper-desk1.amr.corp.intel.com>
References: <20251120165042.1062-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251120165042.1062-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cd25f7-8622-4e29-d6d3-08de2879b6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aQzTkZncfPALxG2wE13M4DDpHx9MfFYh22Y6OYcW0xIjZo+EMWaHMKUyAHhk?=
 =?us-ascii?Q?ZWAq7lOnpejdSs68FdtMuvgRTSYTXeBlqlYI9TSq3VDMGA6r2npJqSIYVuB9?=
 =?us-ascii?Q?ZJtg8G9sJZa0MWo+Re1x3nhEtfN55d3QAb+1JreAhAH/l09IlUdN6ovze4zx?=
 =?us-ascii?Q?kJ5Pg94b5u5Mfgsdz3kYra6d/84QImyBY+/bm/WMkAc0Sn2k3XR1/5ow7MCe?=
 =?us-ascii?Q?/mrC8CwAB+4HqyQ0fOiHF7YrYA5iNPuXa1B3C62oZWG/RBf80b1+ohJd4wht?=
 =?us-ascii?Q?AjszhwTTEQTWdIyEr+dcbkjp34NlVE3ziZRXo6bJDQ7x5Bl4gW0JLz743keR?=
 =?us-ascii?Q?Xf0f+HvQGa08Zc5lPP3O8D5z2cY9DcmjYOPGvvbTudZ4AAuPapMnwX/cCkJx?=
 =?us-ascii?Q?/Ruh0lUAkP0bYQJ5RGTpIel5u21r+pFqHlHCCSHh0emeRyjYoC/P5dnX6qsn?=
 =?us-ascii?Q?2Px/ZyyFhk9Rz92QRJB8LuwJG0MrLaAGR/eIsg5r9vsM9r2H69D2RR6P5xug?=
 =?us-ascii?Q?ErSCq/8oU3yFaLhg0WEokafG5zGv3VavLhsWah7/8PHOXYL7DkNjkT8icX4N?=
 =?us-ascii?Q?Moz7WXRKn6BNePTcvA37mZSW2jxv47YzB67Vc2zmW9IFKUECojR0ZEy6TXeJ?=
 =?us-ascii?Q?V0AM1HAJ7soaOb7G82DDQB/Yjg2+ThGY+liEqwSjC6SqTht36nafM68snZhI?=
 =?us-ascii?Q?lTXpoY46xjpROBeS1ksBrbrOH5ttkHJz5RqLNcfTV7Aj+0yKwakhg983A4gx?=
 =?us-ascii?Q?pxsvrgrdiGRsW9KJVHERRjuN1eG+xcC0BX8bxcjbiZvzw7IyCG8pUu5EOI0K?=
 =?us-ascii?Q?xbfWbvoVeAwM3LM7NMc+iuZK17leLyXrny2yyUTzA9KAHHM4FWdnkQNZg7OO?=
 =?us-ascii?Q?JvF7Plc95Dq67kmN9GFLjs+WM9bn2iMQa9RhMw2t7YFZgSH6akAzvtOT4Uwd?=
 =?us-ascii?Q?Ahh4566Y+v6kmahSHeMf1/mDABv5PNInBmqxyMlL9LuClHg/djMsqEW49GIU?=
 =?us-ascii?Q?GiNnA9HlYVXCD2rryXdF3K99PkLAStmKSO/hOolCZuQX4PsqqEFMoe8ZrL37?=
 =?us-ascii?Q?/8DmsBd0cgw0T5B2W1xalMx6ojz2ywkoifElkcqohnBEni/z2tCPyVm8tG66?=
 =?us-ascii?Q?Mj1PmD3FATfM4G18IFD4ISES+obpqlzol5Vn9isBmw0GHO5X8aiLbBl15dc8?=
 =?us-ascii?Q?6kI5NnImVu7OykmDux2AK9cAdVod4Z3cBqTY6VeSpRerUNqADAd5WDNnatjz?=
 =?us-ascii?Q?if8azuaGy2ks3E8dsuraQgghOj2JHtAtMPjzGKIpaT2vCKNJuEEL/sHEy8fN?=
 =?us-ascii?Q?iMxsdIGQ3P7m17w0KO2I+sxIAmtctBeTvrhz/e/KAIVaNa3HsprvN3/t9by6?=
 =?us-ascii?Q?A/n4deCSoA5C74Al0yr/xfNLwy/miETI3RG47akyLUg7K68orJmNjwyJE78v?=
 =?us-ascii?Q?vGRtkiCpTAWYLQxu3kOuqvyDawU2hs+3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WRZ1hzBsP+jzo6Kb0I4lpJ01eeJV/9B4DWTV7Sks4Dl2pJSdlVTG7DQ15kSW?=
 =?us-ascii?Q?iEbjv77vE8nK6iSR169vFh0atxrI77u7BFV9tltj3A3gfi2eUL+agUGAQq9H?=
 =?us-ascii?Q?2YnpaX2ykNrAw0fnNz0nBEY5len3mQhrC9BWX2aJFVESEh3itfraAEOeu0qr?=
 =?us-ascii?Q?bp/yFWF+4DzXpkZuoTKghgbEOBYtIglxPGi7MH9zzUB/ybGdUd2/FcGmTz1X?=
 =?us-ascii?Q?tSBAS0sbgHmp1JC+jBVEIEQ/r5yKDmWG63ERSr2NhUTh0iQg+NtPB8L8DbSq?=
 =?us-ascii?Q?/k/+vfywpg8jVv2ib6GSMFMflwzJJEvIJQcPNH8DEFD1ndR1dvbQApEtJIiT?=
 =?us-ascii?Q?EYDZy9NVSsBH2WGE5XbQfruu8enz5hkD4VYoXu++kPuVUcmiMf1CLg5Nhxv5?=
 =?us-ascii?Q?IbVhQXZAMDi3McNZQRNB11sVmEqXvml8OspMwW5+A4Q8BUMJz+9L7NJOIFL0?=
 =?us-ascii?Q?hYUokXX2uOH50bAlJqH86xFC+DBnBfA1aJlwZy3v1q6hXJledSypIPB+F6AO?=
 =?us-ascii?Q?HS4wNzmt1P4m5QL27wWutIwc2fTImsMI8hSzh21KCPkeJwN7NgrainnXsBrW?=
 =?us-ascii?Q?D5HUkcw8XMHOrMMeUbqA83q1x/Hj3QD8dDklVfDgZSLuGIi1EIDID9tgfJkV?=
 =?us-ascii?Q?12JqMCelGqxrQp1dyD/aRdyoxpKaDapEUClakgu/yAS6a3wH71V8F8Sl7WIX?=
 =?us-ascii?Q?gRSe/epxBMhQELlXI/5cf9j3YLsJfe7pXcbjvdTbiVohZ7W4J//SJhg7HNhF?=
 =?us-ascii?Q?h28vEZMJ7kwSuDbN3p5I8Y3gknzQATjwoPu+Iy5EutqpxSmJVlZTgrjnA0A2?=
 =?us-ascii?Q?BozVNqhwOBlK1c1uv9bP//7093EgNoh+gw6+bNLM1VNnYFZJlEEFuk71UsHs?=
 =?us-ascii?Q?zEFWgdfYbWI+wN/uonOl/LZ4KzvDPv/GIjEx2uT/suUJTMdIT7gV2M0bRue9?=
 =?us-ascii?Q?xkV99ikq52FTA5/W3zsLRh2dhlCtOtYoOVhueqpd78VhsJep6BT8Die0myur?=
 =?us-ascii?Q?diMHgS7mDHeFWFR5u6XhthyiSjdV6DSH3k9F46y/DB/sBxIpFUoHYH8jhR0o?=
 =?us-ascii?Q?euQCwYTM/OE1AYuF1F5qBqqy7T/NNs6rNyuZJ++9d07578kf7k220s2HO+gY?=
 =?us-ascii?Q?5dF7pF2ol6dW9UwJeM+mPp/7ea4DeobeTWAINDwF+YKckK4uLzb/07Cb8Wh0?=
 =?us-ascii?Q?BAKHcM6x36BH7K1cu+r2AgsAPWxWQdcv5Av3PV1OUrwvp57dzNTkTgkXKJb2?=
 =?us-ascii?Q?qjWVWN57W2Esl56MjVrTkU+yeu5qlxCNQXNQAv9tzLumj2cAGEnh+P54JZC9?=
 =?us-ascii?Q?4nSSdAGMaYMG/3ZLY2UTJ0kCcXtV7X3tBFoHgwpUIWEh8pUev+pmH2K4qyS0?=
 =?us-ascii?Q?i3Erw1YGSXqSQfU+/EOLt+H/n9jvSo6JruLOnQBUvDqU8sTr8UmBTMoWAZ9I?=
 =?us-ascii?Q?4dCTO0IjJOo5wPxEpPNHp96kYYN7pg19ZksBfTXQMXtkVWNjnLXUtErno79F?=
 =?us-ascii?Q?D5xFBgcO3r2jbNNMpLne0xIyZmuzVv0XGwQ9hO/14MxfZhSFs/tyLt5wk8rA?=
 =?us-ascii?Q?xyvvi4810gYd2ztzkUwrPgWEA41kuN0L3oByrHKqDVFo6RtOdWm8Xui4jPCJ?=
 =?us-ascii?Q?Nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cd25f7-8622-4e29-d6d3-08de2879b6f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:13:56.0504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKMIIbBQOKMVwDSbCz4HyFEifKPWz2VrDOGk70BIW+WUYlmW52B1ugQ4hXEwzfuogiawNoCJP5GVSllG5FRlpZXvUsAVVOmPtw4kN2ViPLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Thu, Nov 20, 2025 at 10:20:43PM +0530, Balasubramani Vivekanandan wrote:
> Applied Wa_16028005424 to Graphics version from 30.00 to 30.05
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_guc_regs.h | 3 +++
>  drivers/gpu/drm/xe/xe_wa.c            | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> index 2118f7dec287..65f6d2a5238f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
> @@ -121,6 +121,9 @@
>  #define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
>  #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
>  
> +#define GUC_INTR_CHICKEN			XE_REG(0xc50c)

Looks like this header already has sorting mistakes, but this definition
should probably be a bit higher up (between GUC_SEND_INTERRUPT and
GUC_BCS_RCS_IER) so that we're not introducing additional ones.

Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> +#define   DISABLE_SIGNALING_ENGINES		REG_BIT(1)
> +
>  /* GuC Interrupt Vector */
>  #define GUC_INTR_GUC2HOST			REG_BIT(15)
>  #define GUC_INTR_EXEC_ERROR			REG_BIT(14)
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 3764abca3d4f..7fdb2b7cb8e4 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -15,6 +15,7 @@
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_guc_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
> @@ -323,6 +324,10 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},
>  };
>  
>  static const struct xe_rtp_entry_sr engine_was[] = {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
