Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60475CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 21:03:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0209710E30F;
	Mon, 11 Aug 2025 21:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJn05h+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B549810E30F
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 21:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754946196; x=1786482196;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=znQ2pw0mkQ1VDj5JmfLrTD58Cd8n+Yoo0DFzs3tyUm8=;
 b=cJn05h+EVyI+xjF6ekJtC/8chvP3Qh3OKPK6niT3v2Op9K4zVFN/C3oe
 QX7f3PJ12/lJYITgX9DUoZj5jvXZGqcLgKq7h40t+x4ZxY1SWmP3mXwOV
 OQSHY/u6zgQNlPh7uOu0PuCxhnVD0PHfZC9OLSbl+CCkwJoH6kaZyH5lx
 Jvc3XBhjdyCSbm8YvaP23Y8nt07kxOkfdTuAdzZ0Jpst64ddI2eUkF93B
 LZ/RpDyZnmtE5xePb12SbdPlOKUzLG4Xs3JK4iCcurm0AGVw9Lff1HRm1
 7z0CvYSSyqWBdy5YvYyFy17q1VJ4TtAKh1MqUGWfzLDoQfpPVkSOQrHUB A==;
X-CSE-ConnectionGUID: WEw9T3aoRDq71+q/sWpdvw==
X-CSE-MsgGUID: q6deO5yRSfORcRpaVTDMRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67918665"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="67918665"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:03:15 -0700
X-CSE-ConnectionGUID: DM9sAb26QgCmpfNcCngxqg==
X-CSE-MsgGUID: WG46mGmhThelCkb6hgHneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; d="scan'208";a="165213922"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 14:03:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:03:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 14:03:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 14:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4q8u/OEFw5WSq62hdTQmQ4F3pRVIP6UgSR5t9HgFVTqKVBMtWKWUZ0DHAAqWPHFObX/Gk3fwRmYNI9hJ4bpZeCRUWYXFwWeeQmfRTft/cc94teZl6PCdxoBOAdTnFTsGIDNKhXOBwUDB7bS26NWxgnsg6GJ95kPDmxor0Zdb4qj8Gp6xoA0ym9fXaeX2Ho3Ltxx1coDjaTh0aXOkkVBiomHGX2c8VmYZ/r7z9Rd26ZOzxiX2jhYyW7OhaQzpm6iBVJ5rRlPpyCr6DHEqpxnpvB1Bw/KWuGkIaFOFytkO+slweRms/KgYMDN0GaopVAEMkAumP8ab8xo/SVFyG+V3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLT6HIa2RnuYQ/u/bu0aH+CL1JJZ1ipM8t5lylM4b9c=;
 b=O8be96E7yAG0TVuAKOtGYhXpaSpDTxo6F8uMGvgOh551rAR5Vrd7HKzju6N7W4iKdig03aTRQiaWK7I1+CgmpzAzOW3+xn+lRvEW9HgRzb3corL5lzYjvIVDq9bkJtzxQMTJxdDGdJi4MOn3m/1JXYvyTLI7hhGY/FfT1HQ50czjZUgIwZMDZ2iScxHxxdLwVW7CZu1XEotP4YiF1yffkal+dY/pO+cqapaZDyWz1J2iVm8Gu47WTX4MHfto7ACyTaH3sQBskTo9JkQOWHZpENcprIBZU8+AYyuM3ixIuk6prJToI26XNPxof79+o0tr80HlQQLtieNpk7X2h9xCDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6498.namprd11.prod.outlook.com (2603:10b6:510:1f1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 21:03:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 21:03:09 +0000
Date: Mon, 11 Aug 2025 14:03:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2] drm/xe: GPU frequency tracing support
Message-ID: <aJpairAgaJlpbs3N@lstrano-desk.jf.intel.com>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
 <aJpVQB3tYc6OUnae@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJpVQB3tYc6OUnae@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY5PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a5636e2-e613-4c91-16c4-08ddd91a79ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/mjJmibd/UeVqzEP542JzFahGpQdBlqqAjYtHIY/rr06LnSoVR2TRm7eYI?=
 =?iso-8859-1?Q?JeH/QW3qaKzMvrFu7HAwN74C5CuNUP02ajzFTA7JxMJzGWe5KJxMC7GBln?=
 =?iso-8859-1?Q?ED0Xz7j46TvAbccevpwFMfVVNtSS2egHvTXU96p1HVXTqCUyZHeDTYzvJ2?=
 =?iso-8859-1?Q?FmwGO0Ti4KMgG9Pm6IihAi8r+813Zu3PSoiDl5ER5y9ZASRqPTsC7KjtD/?=
 =?iso-8859-1?Q?hwA3ubgw9J47rkK7icthCnDUA/X62Kh/eucbq5V40d0M9tOjyhpDpjOHTy?=
 =?iso-8859-1?Q?DHZ/EPVjjBoBN5jRpUn7c+6KTq7AI7UWp8JaYx2hJGmXVbziofzm6MOrMp?=
 =?iso-8859-1?Q?QFxY5Kf0eg8cPM9Ilp8UdJZ00PzlF0WCe4XDjeR8rTgWpFETOREqz82QHh?=
 =?iso-8859-1?Q?K8Yiwqsw0Is5vss/94dS1NJjxdiw9he4u3EgJhda/WGMpU21bFR3dRdfpz?=
 =?iso-8859-1?Q?5sGVhgsjmwoQ+92EauiLCeluOdPSo1KWy4sPLI6JPnLa28vF7FkFzY/50z?=
 =?iso-8859-1?Q?6fI5ulZf2dKB2+We1Y7ceZcAUpAkOGjm1c1hLdHz6jPkB6fkhnd0aAMbnb?=
 =?iso-8859-1?Q?l/YaRE7JH5cjhv29ZU65ZD8fBlwZsD8mJ0jIW5k/IjVAQ5ulNtrl6sNhUH?=
 =?iso-8859-1?Q?bxQBZl/497EZyAA227fOl+HMDFzzDFg9ZTseoUc4HMUqwRx6y9bsrSImJp?=
 =?iso-8859-1?Q?okwQSAkyfw3i9gm28C+b9laj/5RPgoEeFW9+WQEwAjUuM2VMxoZk0PWlmv?=
 =?iso-8859-1?Q?YHSvOU5rTTEuHjH3UZQ6dU8IJshMdRrywbALJuL+b89tMgnF4kKxK5cRwq?=
 =?iso-8859-1?Q?cHhqKTM5/tRw3ygdr+Qtxvq38gVSgIE2LpEhO7H6vdp6qITDQIY+EeU+pm?=
 =?iso-8859-1?Q?HWKAMfB6sFhgrzBN9JnIALK7XCR7+1z7AH+s72XizifYTWfnSLfV/Lqbno?=
 =?iso-8859-1?Q?5mGe6cjV0lWwMt9UpPi8DJtINpfLjE+g/2F/agFs39f4744r878Z2/O2Oj?=
 =?iso-8859-1?Q?U2M8buIfIA8zSFqtn5+hSSp5+BlBtHB/msl1lgk/5YrIXeh9X4Ep/yGlS9?=
 =?iso-8859-1?Q?g6CdCO4r3dF0/vCg1U4USlX4iSEoVOP8y8HJjQzcjG2ZVmK58lJsEHw05E?=
 =?iso-8859-1?Q?BaNO4qozyBbEhwP1SUDgetfFXZUgeK+Y8kfnoLnWFFlSlmC7bPYjp4gNuM?=
 =?iso-8859-1?Q?Xg/MjNXCrRJIZ3o6pSYPig4bJ8GWkOOj+AOekKMNEhnnDkc+5IVnw2SsOP?=
 =?iso-8859-1?Q?Yr7RF0N2xWLNayuxZHUIkJNKyMPnquYudVJQ5ZoEKh2WmKluQ8EJX2zlRW?=
 =?iso-8859-1?Q?m17HVF4oC413Wy79dlzXAyNx0xso3Si0pXvNop7uer++MNU3r1pWLJsCh3?=
 =?iso-8859-1?Q?rc/aO176IXThaw8XMCu7RzXdPZASUKFuktJyeXAKzOJKz7a9YKu+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6tETp6Yk24QOSDni9NHGtn1qoho/WdQeBKBV4AuHA57cTq77Eu84B1U40T?=
 =?iso-8859-1?Q?6UA2IDStWfwaBafMl8JqePG+DTAqa5kNyorfU2rg3YYYWC0IaX+BVem/LI?=
 =?iso-8859-1?Q?dUDyT3ChSq49ZpKcK4BEN44/SE3Ffsyk83BxSczte4ZXvWcS5mqAkpGY1S?=
 =?iso-8859-1?Q?N0M9EusGJLdjEh3m9xuSlCks05Xmk8FQ9pokW5WmZ7ti6Y+z8TOQMpzzvq?=
 =?iso-8859-1?Q?lV96gyGacDW1GOEJ7wyMCELGSgKhjzCrhEEhTnuxu5GWA5Fl+gvC+r6Da/?=
 =?iso-8859-1?Q?Q3yYwRFf7zKnQv95m/3OdZ5NEYyoRilJks3jdFV+3uEdTaJFQrLw/YRoLY?=
 =?iso-8859-1?Q?8NttBL0p0oK8xogiREV72vUiyfYI/VmhLPVk/P00bkAGKGYw23/LynmAu7?=
 =?iso-8859-1?Q?s/y9sB5uxJ8I6EmyvuIi/5BKQeQ8rTEzlROiIbXrPC1+L4swDpvfOsGbWl?=
 =?iso-8859-1?Q?rS20M6/1Bcjx4sePStjmZuysX7rGx5aTdugNqFNmIj9TWHo3l4P0zZQfQb?=
 =?iso-8859-1?Q?ipmlvjfc53GcY0S1F72w1grdzVu8rg254FXQerswHaMMPv0XZ7ZahrJVkQ?=
 =?iso-8859-1?Q?0NP7eYsoyBbP6JTZHdYNfiW+nQUrWvO2k1U6ei3NJ94LqsYhhX2nJibAVz?=
 =?iso-8859-1?Q?1/GaYLGudkNq+hLwbV0tmWDnkSSjVszBo9HTQTxb0Jah1NKv/bO5mRpOUy?=
 =?iso-8859-1?Q?AXSSt6feLXY+/N1/HDPLgQ0ggx4qtCepKTysu4dI37wL4IOLgayWHbiSZ9?=
 =?iso-8859-1?Q?7NVOSIsHAB1PdvhNLuPDysKUUdfR3hzUB2HsDZG2Wzqc2tto8ATk/wcPGA?=
 =?iso-8859-1?Q?HAtB8OZKN1OEsugeA1MhE7aES/BTk2NiuCTHm64PPd53MtjivkHylabycU?=
 =?iso-8859-1?Q?ME+SbVJ6TuyyCYkzwpjjlmlwhXFBuoPJdC9SmDjVT45JP4GGtJkO3Hja8R?=
 =?iso-8859-1?Q?QD9tZ2NprtNdDEiwutqvdGY4Qj0qZ8tKhxApVFbO3OQrEadMqtWzj1UI0B?=
 =?iso-8859-1?Q?WkdDD+faE6umzAvuMBtnjjphWTa+3zj3r2LxKbfhjXO5uk4b3G7iNUwfOe?=
 =?iso-8859-1?Q?gtl3tHaCm3xYAT9rR7z9fL3PUAHJ3U4wAM5efMPQBG3njsEYav0pH3PmHf?=
 =?iso-8859-1?Q?jPoVE3FuVN/E4qDiIwKv81FIr4iN5wIx7hEf0RsAefBj7hSBnNnf4vDkfQ?=
 =?iso-8859-1?Q?TQ7+8bjSTvgxE2kXbSl3rMjWXdBgeqoLzZhtwrRgthQrXRcyIFwpQOuDYw?=
 =?iso-8859-1?Q?FAsV5t1YUpaBv+fdZJmxvvUcDcMbitfT8e1mzQdHdZ8JKtwitRwfW2GYLk?=
 =?iso-8859-1?Q?q6BH+TfvevPNmxWFd5BNiDs5uRIdencvJFqJdBc88GJaWlPh0518K3fHBH?=
 =?iso-8859-1?Q?D0knbnXY77QGPeM2pp/6yz25gOvpHjmwaTDXnIwGqPh5jP3zmFLjTamDte?=
 =?iso-8859-1?Q?yC7VFrGS8sspX3ieVAIJkwYcWZ7S4UJttx60NpN7H6fHShXTTTtZRqUyOz?=
 =?iso-8859-1?Q?Es3JMR/ol+uj4/JVwYEXK+FVcBMe50KPhHiA1mrtJgSfEtlE3+JDsADKjG?=
 =?iso-8859-1?Q?Tj32msDj4l2hfW3dG8LoznlTvYr5NGDUkAywea92VtnkL2EfpDkFLNtamr?=
 =?iso-8859-1?Q?saZY1w9TMQg3O4CTXIbt5c9aafUD4b1v4kFzXjCF9Q1aUR+xnFl7sgcA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5636e2-e613-4c91-16c4-08ddd91a79ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 21:03:09.2734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZ7+AUfIje11IdVWBicmSNabIPJ24v/PbS6upo8R8SHg2/4CFei2H/drhF23FYZQuMax0mTsHTwdUkqT7DNapw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6498
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

On Mon, Aug 11, 2025 at 01:40:32PM -0700, Matthew Brost wrote:
> On Mon, Aug 11, 2025 at 02:04:14PM +0530, S Sebinraj wrote:
> > A periodic GPU frequency monitoring and tracing program for the
> > Xe driver. The implementation provides periodic sampling of
> > GPU frequency through the Linux ftrace infrastructure.
> > 
> > Key features:
> > - Periodic GPU frequency sampling with configurable intervals
> > - Immediate frequency change reporting via tracepoints
> > - Integration with Linux ftrace subsystem under 'power' events
> > - Per-GT (Graphics Technology) monitoring support
> > - Dedicated workqueue for non-blocking frequency sampling
> > - Configurable via CONFIG_DRM_XE_GPUFREQTRACER kernel option
> > - The monitoring interval can be configured at runtime via the sysfs
> >   (default 5sec).
> > 
> > The sysfs entry is at:
> > /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> > 
> > The tracepoint is exposed at:
> > /sys/kernel/debug/tracing/events/power/gpu_frequency
> > 
> > Format: {unsigned int state, unsigned int gpu_id}
> > - state: GPU frequency in KHz
> > - gpu_id: GPU clock domain identifier
> > 
> > This enables userspace tools and system monitoring applications to track
> > GPU frequency changes for power management analysis, performance tuning,
> > and debugging purposes.
> > 
> > Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Kconfig                  |  22 ++
> >  drivers/gpu/drm/xe/Makefile                 |   3 +
> >  drivers/gpu/drm/xe/xe_device.c              |   7 +
> >  drivers/gpu/drm/xe/xe_device_types.h        |   4 +
> >  drivers/gpu/drm/xe/xe_gpufreqtracer.c       | 292 ++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gpufreqtracer.h       |  30 ++
> >  drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h |  48 ++++
> >  drivers/gpu/drm/xe/xe_module.c              |  12 +
> >  drivers/gpu/drm/xe/xe_module.h              |   3 +
> >  9 files changed, 421 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> > index 714d5702dfd7..d9d07ec69875 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -129,6 +129,28 @@ config DRM_XE_FORCE_PROBE
> >  
> >  	  Use "!*" to block the probe of the driver for all known devices.
> >  
> > +config DRM_XE_GPUFREQTRACER
> > +	bool "Enable XE GPU frequency tracing"
> > +	depends on DRM_XE && FTRACE
> > +	default n
> > +	help
> > +	  Enable GPU frequency tracing support for Intel XE driver.
> > +	  This adds an ftrace tracepoint that reports GPU frequency changes
> > +	  at periodic boundaries (default 5 secs, configurable via the
> > +	  gpufreq_monitoring_interval_ms module parameter) and
> > +	  on direct frequency change events.
> > +
> > +	  The monitoring interval can be configured at runtime via the sysfs module parameter:
> > +	  /sys/module/xe/parameters/gpufreq_monitoring_interval_ms
> > +
> > +	  The tracepoint will be available at:
> > +	  /sys/kernel/debug/tracing/events/power/gpu_frequency
> > +
> > +	  Format: {unsigned int state, unsigned int gpu_id}
> > +	  Where state is the frequency in KHz and gpu_id is the GPU clock domain.
> > +
> > +	  If unsure, say N.
> > +
> >  menu "drm/Xe Debugging"
> >  depends on DRM_XE
> >  depends on EXPERT
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 8e0c3412a757..61d46cc4dc25 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -170,6 +170,9 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_sriov_pf.o \
> >  	xe_sriov_pf_service.o
> >  
> > +# GPU frequency tracer
> > +xe-$(CONFIG_DRM_XE_GPUFREQTRACER) += xe_gpufreqtracer.o
> > +
> >  # include helpers for tests even when XE is built-in
> >  ifdef CONFIG_DRM_XE_KUNIT_TEST
> >  xe-y += tests/xe_kunit_helpers.o
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 57edbc63da6f..88198ceb519b 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -34,6 +34,7 @@
> >  #include "xe_exec_queue.h"
> >  #include "xe_force_wake.h"
> >  #include "xe_ggtt.h"
> > +#include "xe_gpufreqtracer.h"
> >  #include "xe_gsc_proxy.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_mcr.h"
> > @@ -896,6 +897,12 @@ int xe_device_probe(struct xe_device *xe)
> >  	if (err)
> >  		return err;
> >  
> > +#if IS_ENABLED(CONFIG_DRM_XE_GPUFREQTRACER)
> > +	err = xe_gpufreqtracer_init(xe);
> > +	if (err)
> > +		return err;
> > +#endif
> > +
> >  	err = xe_oa_init(xe);
> >  	if (err)
> >  		return err;
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 01e8fa0d2f9f..0634dbbbdc3f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -35,6 +35,7 @@ struct dram_info;
> >  struct intel_display;
> >  struct intel_dg_nvm_dev;
> >  struct xe_ggtt;
> > +struct xe_gpufreqtracer_data;
> >  struct xe_i2c;
> >  struct xe_pat_ops;
> >  struct xe_pxp;
> > @@ -529,6 +530,9 @@ struct xe_device {
> >  	/** @oa: oa observation subsystem */
> >  	struct xe_oa oa;
> >  
> > +	/** @gpufreqtracer_data: GPU frequency tracer data */
> > +	struct xe_gpufreqtracer_data *gpufreqtracer_data;
> > +
> >  	/** @pxp: Encapsulate Protected Xe Path support */
> >  	struct xe_pxp *pxp;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.c b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> > new file mode 100644
> > index 000000000000..07eedfb79e93
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.c
> > @@ -0,0 +1,292 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_gpufreqtracer.h"
> > +
> > +#include <linux/workqueue.h>
> > +#include <linux/slab.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kernel.h>
> > +#include <linux/moduleparam.h>
> > +#include <linux/types.h>
> > +#include <linux/container_of.h>
> > +#include <linux/gfp.h>
> > +#include <linux/atomic.h>
> > +#include <drm/drm_managed.h>
> > +
> > +#include "xe_device.h"
> > +#include "xe_gt.h"
> > +#include "xe_gt_types.h"
> > +#include "xe_guc_pc.h"
> > +#include "xe_module.h"
> > +
> > +/* GPU frequency monitoring interval constants (in milliseconds) */
> > +#define XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS	100
> > +#define XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS	10000
> > +#define XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS	5000
> > +
> > +#define CREATE_TRACE_POINTS
> > +#include "xe_gpufreqtracer_trace.h"
> > +
> > +/**
> > + * struct xe_gpufreqtracer_gt_data - Per-GT frequency monitoring data
> > + * @gt: Reference to the GT
> > + * @delayed_work: Delayed work for periodic monitoring
> > + * @last_frequency: Last reported frequency to avoid duplicate reports
> > + * @monitoring_active: Whether monitoring is currently active
> > + */
> > +struct xe_gpufreqtracer_gt_data {
> > +	struct xe_gt *gt;
> > +	struct delayed_work delayed_work;
> > +	atomic_t last_frequency;
> > +	atomic_t monitoring_active;
> > +};
> > +
> > +/**
> > + * struct xe_gpufreqtracer_data - Per-device frequency tracer data
> > + * @xe: Reference to the XE device
> > + * @gt_data: Array of per-GT monitoring data
> > + */
> > +struct xe_gpufreqtracer_data {
> > +	struct xe_device *xe;
> > +	struct xe_gpufreqtracer_gt_data *gt_data;
> > +};
> > +
> > +
> > +/**
> > + * xe_gpufreqtracer_sample_work - Worker function to sample GPU frequency.
> > + * @work: Pointer to the delayed_work_struct representing the scheduled work.
> > + *
> > + * This function is executed in a workqueue context to periodically sample
> > + * the GPU frequency and perform any necessary tracing or logging operations.
> > + * It reschedules itself for the next sampling interval.
> > + */
> > +static void xe_gpufreqtracer_sample_work(struct work_struct *work)
> > +{
> > +	struct xe_gpufreqtracer_gt_data *gt_data =
> > +		container_of(work, struct xe_gpufreqtracer_gt_data, delayed_work.work);
> > +	struct xe_gt *gt = gt_data->gt;
> > +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
> > +	u32 current_freq, last_freq;
> > +
> > +	if (!atomic_read(&gt_data->monitoring_active)) {
> > +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, exiting",
> > +			 gt->info.id);
> > +		return;
> > +	}
> > +
> > +	current_freq = xe_guc_pc_get_act_freq(pc) * 1000; /* Convert MHz to KHz */
> 
> I missed this. The above function performs an MMIO read, which relies on
> a runtime PM reference being held. I think you will need a
> xe_pm_runtime_get_if_active to protect this function, and perhaps a
> drm_dev_enter to protect against hotplug as well.
> 
> With regard to power management, if the PM reference fails (and I don't
> think we want this worker waking the device), you can likely set
> current_freq to a known value. I suspect that if we don't have a PM
> reference, the GuC PC frequency is fixed at a (low) value, but I'm not
> 100% sure on that. You can check with a PM expert (perhaps Rodrigo or
> Vinay) to confirm.
> 
> It should probably look similar to xe_migrate_ulls_exit in this patch
> [1].
> 

You might also need a xe_force_wake_get of the XE_FW_GT domain too.

Matt

> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/667257/?series=149888&rev=2
> 
> > +	last_freq = atomic_read(&gt_data->last_frequency);
> > +
> > +	/* Only report if frequency has changed or this is the first sample */
> > +	if (current_freq != last_freq) {
> > +		drm_dbg(&gt_to_xe(gt)->drm, "GT%u frequency changed, tracing %u KHz",
> > +			gt->info.id, current_freq);
> > +		trace_gpu_frequency(current_freq, gt->info.id);
> > +		atomic_set(&gt_data->last_frequency, current_freq);
> > +	}
> > +
> > +	/* Reschedule for the next sampling interval if monitoring is still active */
> > +	if (atomic_read(&gt_data->monitoring_active)) {
> > +		schedule_delayed_work(&gt_data->delayed_work,
> > +				      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> > +	}
> > +}
> > +
> > +/**
> > + * xe_gpufreqtracer_start_monitoring - Start periodic frequency monitoring
> > + * @gt: The GT instance
> > + *
> > + * Starts periodic sampling of GPU frequency for the specified GT using the global
> > + * monitoring interval from module parameters.
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +static int xe_gpufreqtracer_start_monitoring(struct xe_gt *gt)
> > +{
> > +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> > +	struct xe_gpufreqtracer_gt_data *gt_data;
> > +
> > +	if (!tracer_data) {
> > +		drm_warn(&gt_to_xe(gt)->drm, "no tracer data for GT%u, not supported", gt->info.id);
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	if (gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> > +		drm_err(&gt_to_xe(gt)->drm, "invalid GT ID %u, max supported is %u",
> > +			gt->info.id, gt_to_xe(gt)->info.gt_count - 1);
> > +		return -EINVAL;
> > +	}
> > +
> > +	gt_data = &tracer_data->gt_data[gt->info.id];
> > +
> > +	if (atomic_read(&gt_data->monitoring_active)) {
> > +		drm_warn(&gt_to_xe(gt)->drm, "monitoring already active for GT%u", gt->info.id);
> > +		return -EALREADY;
> > +	}
> > +
> > +	atomic_set(&gt_data->monitoring_active, 1);
> > +	atomic_set(&gt_data->last_frequency, 0);
> > +
> > +	/* Start the delayed work using global interval */
> > +	schedule_delayed_work(&gt_data->delayed_work,
> > +			      msecs_to_jiffies(xe_modparam.gpufreq_monitoring_interval_ms));
> > +
> > +	drm_dbg(&gt_to_xe(gt)->drm, "monitoring started for GT%u with interval %u ms",
> > +		 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gpufreqtracer_stop_monitoring - Stop periodic frequency monitoring
> > + * @gt: The GT instance
> > + *
> > + * Stops periodic sampling of GPU frequency for the specified GT.
> > + */
> > +static void xe_gpufreqtracer_stop_monitoring(struct xe_gt *gt)
> > +{
> > +	struct xe_gpufreqtracer_data *tracer_data = gt_to_xe(gt)->gpufreqtracer_data;
> > +	struct xe_gpufreqtracer_gt_data *gt_data;
> > +
> > +	if (!tracer_data || gt->info.id >= gt_to_xe(gt)->info.gt_count) {
> > +		drm_err(&gt_to_xe(gt)->drm, "invalid tracer data or GT ID %u for stop request",
> > +			gt->info.id);
> > +		return;
> > +	}
> > +
> > +	gt_data = &tracer_data->gt_data[gt->info.id];
> > +
> > +	if (!atomic_read(&gt_data->monitoring_active)) {
> > +		drm_warn(&gt_to_xe(gt)->drm, "monitoring not active for GT%u, nothing to stop",
> > +			 gt->info.id);
> > +		return;
> > +	}
> > +
> > +	atomic_set(&gt_data->monitoring_active, 0);
> > +
> > +	cancel_delayed_work_sync(&gt_data->delayed_work);
> > +}
> > +
> > +/**
> > + * xe_gpufreqtracer_validate_params - Validate GPU frequency monitoring parameters
> > + *
> > + * Validates and corrects the GPU frequency monitoring interval parameter.
> > + * If the parameter is out of range, it will be reset to the default value.
> > + */
> > +static void xe_gpufreqtracer_validate_params(void)
> > +{
> > +	if (xe_modparam.gpufreq_monitoring_interval_ms < XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS ||
> > +	    xe_modparam.gpufreq_monitoring_interval_ms > XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS) {
> > +		pr_warn("xe: gpufreq_monitoring_interval_ms %u out of range [%u, %u], using default %u ms\n",
> > +			xe_modparam.gpufreq_monitoring_interval_ms,
> > +			XE_GPUFREQ_MONITORING_MIN_INTERVAL_MS,
> > +			XE_GPUFREQ_MONITORING_MAX_INTERVAL_MS,
> > +			XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS);
> > +		xe_modparam.gpufreq_monitoring_interval_ms = XE_GPUFREQ_MONITORING_DEFAULT_INTERVAL_MS;
> > +	}
> > +}
> > +
> > +/**
> > + * xe_gpufreqtracer_cleanup_action - DRM managed cleanup action
> > + * @drm: DRM device
> > + * @ptr: Pointer to xe_device
> > + *
> > + * Cleanup function called automatically by DRM managed resource system.
> > + */
> > +static void xe_gpufreqtracer_cleanup_action(struct drm_device *drm, void *ptr)
> > +{
> > +	struct xe_device *xe = ptr;
> > +	struct xe_gpufreqtracer_data *tracer_data = xe->gpufreqtracer_data;
> > +	struct xe_gt *gt;
> > +	u8 tile_id;
> > +
> > +	if (!tracer_data) {
> > +		drm_warn(drm, "no tracer data found, nothing to cleanup");
> > +		return;
> > +	}
> > +
> > +	/* Stop all monitoring */
> > +	for_each_gt(gt, xe, tile_id) {
> > +		drm_dbg(drm, "stopping monitoring for GT%u", gt->info.id);
> > +		xe_gpufreqtracer_stop_monitoring(gt);
> > +	}
> > +
> > +	/* Memory is automatically freed by drmm - just clear the pointer */
> > +	xe->gpufreqtracer_data = NULL;
> > +}
> > +
> > +/**
> > + * xe_gpufreqtracer_init - Initialize GPU frequency tracer for a device
> > + * @xe: The XE device
> > + *
> > + * Sets up the frequency tracer infrastructure for all GTs in the device.
> > + *
> > + * Return: 0 on success, negative error code on failure
> > + */
> > +int xe_gpufreqtracer_init(struct xe_device *xe)
> > +{
> > +	struct xe_gpufreqtracer_data *tracer_data;
> > +	struct xe_gt *gt;
> > +	u8 tile_id;
> > +	int ret = 0;
> > +
> > +	/* Validate module parameters first */
> > +	xe_gpufreqtracer_validate_params();
> > +
> > +	tracer_data = drmm_kzalloc(&xe->drm, sizeof(*tracer_data), GFP_KERNEL);
> > +	if (!tracer_data)
> > +		return -ENOMEM;
> > +
> > +	tracer_data->xe = xe;
> > +
> > +	/* Allocate GT data array based on actual GT count */
> > +	tracer_data->gt_data = drmm_kcalloc(&xe->drm, xe->info.gt_count,
> > +				       sizeof(*tracer_data->gt_data),
> > +				       GFP_KERNEL);
> > +	if (!tracer_data->gt_data) {
> > +		ret = -ENOMEM;
> > +		goto err_free_tracer;
> > +	}
> > +
> > +	/* Initialize per-GT data */
> > +	for_each_gt(gt, xe, tile_id) {
> > +		struct xe_gpufreqtracer_gt_data *gt_data =
> > +			&tracer_data->gt_data[gt->info.id];
> > +
> > +		drm_dbg(&xe->drm, "initializing GT%u (tile %u)", gt->info.id, tile_id);
> > +
> > +		gt_data->gt = gt;
> > +		atomic_set(&gt_data->monitoring_active, 0);
> > +		atomic_set(&gt_data->last_frequency, 0);
> > +
> > +		INIT_DELAYED_WORK(&gt_data->delayed_work, xe_gpufreqtracer_sample_work);
> > +
> > +		drm_dbg(&xe->drm, "GT%u initialized with global interval=%u ms",
> > +			 gt->info.id, xe_modparam.gpufreq_monitoring_interval_ms);
> > +	}
> > +
> > +	xe->gpufreqtracer_data = tracer_data;
> > +
> > +	/* Start periodic monitoring on all GTs using global module parameter */
> > +	for_each_gt(gt, xe, tile_id) {
> > +		ret = xe_gpufreqtracer_start_monitoring(gt);
> > +		if (ret) {
> > +			drm_err(&xe->drm, "xe_gpufreqtracer: failed to start monitoring for GT%u, err=%d\n",
> > +				gt->info.id, ret);
> > +		}
> > +	}
> > +
> > +	/* Register cleanup action for proper work cancellation */
> > +	ret = drmm_add_action(&xe->drm, xe_gpufreqtracer_cleanup_action, xe);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +
> > +err_free_tracer:
> > +	drm_err(&xe->drm, "initialization failed, freeing tracer data");
> > +	return ret;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer.h b/drivers/gpu/drm/xe/xe_gpufreqtracer.h
> > new file mode 100644
> > index 000000000000..561abe27b6e2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer.h
> > @@ -0,0 +1,30 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_GPUFREQTRACER_H_
> > +#define _XE_GPUFREQTRACER_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_device;
> > +struct xe_gt;
> > +
> > +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> > +
> > +/*
> > + * Initialize the GPU frequency tracer for a device
> > + */
> > +int xe_gpufreqtracer_init(struct xe_device *xe);
> > +
> > +#else /* CONFIG_DRM_XE_GPUFREQTRACER */
> > +
> > +static inline int xe_gpufreqtracer_init(struct xe_device *xe)
> > +{
> > +	return 0;
> > +}
> > +
> > +#endif /* CONFIG_DRM_XE_GPUFREQTRACER */
> > +
> > +#endif /* _XE_GPUFREQTRACER_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> > new file mode 100644
> > index 000000000000..5664db62e3fb
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_gpufreqtracer_trace.h
> > @@ -0,0 +1,48 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#undef TRACE_SYSTEM
> > +#define TRACE_SYSTEM power
> > +
> > +#if !defined(_XE_GPUFREQTRACER_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
> > +#define _XE_GPUFREQTRACER_TRACE_H
> > +
> > +#include <linux/tracepoint.h>
> > +
> > +/*
> > + * Tracepoint for GPU frequency changes
> > + * This tracepoint is exposed at /sys/kernel/debug/tracing/events/power/gpu_frequency
> > + *
> > + * location: /d/events/power/gpu_frequency
> > + * format: {unsigned int state, unsigned int gpu_id}
> > + * where state holds the frequency(in Khz) and the gpu_id holds the GPU clock domain.
> > + */
> > +
> > +TRACE_EVENT(gpu_frequency,
> > +	TP_PROTO(unsigned int state, unsigned int gpu_id),
> > +
> > +	TP_ARGS(state, gpu_id),
> > +
> > +	TP_STRUCT__entry(
> > +		__field(unsigned int, state)
> > +		__field(unsigned int, gpu_id)
> > +	),
> > +
> > +	TP_fast_assign(
> > +		__entry->state = state;
> > +		__entry->gpu_id = gpu_id;
> > +	),
> > +
> > +	TP_printk("state=%u gpu_id=%u", __entry->state, __entry->gpu_id)
> > +);
> > +
> > +#endif /* _XE_GPUFREQTRACER_TRACE_H */
> > +
> > +/* This part must be outside protection */
> > +#undef TRACE_INCLUDE_PATH
> > +#undef TRACE_INCLUDE_FILE
> > +#define TRACE_INCLUDE_PATH .
> > +#define TRACE_INCLUDE_FILE xe_gpufreqtracer_trace
> > +#include <trace/define_trace.h>
> > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > index d08338fc3bc1..f5d4f8bca61f 100644
> > --- a/drivers/gpu/drm/xe/xe_module.c
> > +++ b/drivers/gpu/drm/xe/xe_module.c
> > @@ -31,6 +31,7 @@
> >  #define DEFAULT_MAX_VFS_STR		"unlimited"
> >  #define DEFAULT_WEDGED_MODE		1
> >  #define DEFAULT_SVM_NOTIFIER_SIZE	512
> > +#define DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS	5000
> >  
> >  struct xe_modparam xe_modparam = {
> >  	.probe_display =	DEFAULT_PROBE_DISPLAY,
> > @@ -41,6 +42,9 @@ struct xe_modparam xe_modparam = {
> >  #endif
> >  	.wedged_mode =		DEFAULT_WEDGED_MODE,
> >  	.svm_notifier_size =	DEFAULT_SVM_NOTIFIER_SIZE,
> > +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> > +	.gpufreq_monitoring_interval_ms = DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS,
> > +#endif
> >  	/* the rest are 0 by default */
> >  };
> >  
> > @@ -93,6 +97,14 @@ MODULE_PARM_DESC(wedged_mode,
> >  		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
> >  		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
> >  
> > +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> > +module_param_named(gpufreq_monitoring_interval_ms,
> > +		   xe_modparam.gpufreq_monitoring_interval_ms, uint, 0644);
> > +MODULE_PARM_DESC(gpufreq_monitoring_interval_ms,
> > +		 "GPU frequency monitoring interval in milliseconds (100-10000, default: "
> > +		 __stringify(DEFAULT_GPUFREQ_MONITORING_INTERVAL_MS) ")");
> > +#endif
> > +
> >  static int xe_check_nomodeset(void)
> >  {
> >  	if (drm_firmware_drivers_only())
> > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > index 5a3bfea8b7b4..fd60de38d24d 100644
> > --- a/drivers/gpu/drm/xe/xe_module.h
> > +++ b/drivers/gpu/drm/xe/xe_module.h
> > @@ -23,6 +23,9 @@ struct xe_modparam {
> >  #endif
> >  	int wedged_mode;
> >  	u32 svm_notifier_size;
> > +#ifdef CONFIG_DRM_XE_GPUFREQTRACER
> > +	u32 gpufreq_monitoring_interval_ms;
> > +#endif
> >  };
> >  
> >  extern struct xe_modparam xe_modparam;
> > -- 
> > 2.34.1
> > 
