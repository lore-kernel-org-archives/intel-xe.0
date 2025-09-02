Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18736CA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB8B310E812;
	Tue,  2 Sep 2025 18:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlKv0ZBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538CB10E812
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756836825; x=1788372825;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=igqOIseXbcyoMH4+xTNAH3VXERtEp/nqUMCuBahgUvc=;
 b=jlKv0ZBkpyE+FufQAEG2iMpREnlch+863bGZInyKhKV6jSz1ttvN5FHj
 BY9ETbFismDHLBTWl9ZzTaSFb+PX9TqomKYvNueO363T/3DTznR+ncJJs
 TYU1Y2ZJT/I5zjZOeSauYRYsHd6T1/UabHOYBAVSftCV1O3/TpulUGT1Z
 yvNxUdp4QB6o3HkudrIJzMSb8vF8rNcPRVOMxMbuLn/15MIXO1IAcohX7
 yh0mCEoHm0NZMw+QRAy80JDJ0t/le2bSEpZoqIYgdNtivLn0QDJI8Pb3T
 Hk9gyQGOO23NRS8+R0r7ckth35ujR8Pscb/zjaJ90XTDPJGg3r57mltGw w==;
X-CSE-ConnectionGUID: Q14CHpheRL2Wn2AEcdnhjw==
X-CSE-MsgGUID: Qg7M957kSjuOk5BAUHXgCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58159409"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="58159409"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:13:44 -0700
X-CSE-ConnectionGUID: 9MMX0N6cSteW6Nq0a7LbnQ==
X-CSE-MsgGUID: 77KVvA41T9+KKtWVEepgjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="175721884"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:13:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:13:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:13:42 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.87) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai/h/uaWtItoR5b39nFhcq1j5wiW824BfZJpl/Mq75/eSkXpP4T7ZtNyUQq6BzAxQzMKYoWR6dDnfLvvNXmB/2E4g+Pqv30e5vltYp1HT6KlVeiiRp3/cOiVxWBaZZlVUDdma7fORLWYHCK1EUnJnn0p/aULewEZRpMexI0fv48xmFIRnZMPRz3t0U1M56jStjEkubwGmEbb7hcYkIAnFegs2iVRpdI/YRTy/IqmecKpsYb/oYlULK5B2JZXW3OM9h//8bPTF7L+cMTe4L8fwVa8XtcVRQgAaeKSYYK5ZPfZGffMZb+O0mpOHqC1TKinmU9xcwBc7szSsYSYL33xtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK2xPfe7o02x2y38JtE/0gEV5ZZeEdThSP/eyhKHe/A=;
 b=nS6rTm7RDMVYzYYZAUcXZpfXhTnXwKOL9aVaP1okpgLitUFR5MXK4TIC6OL6Jt6o59Q46Dqnxl1ITbeaAoT8YGdjBpFlf/XNWhZtmy1Y9fH9eCje1N4aHf7IaPJxGtKXHCcoskkocL5LQRmX+SbJ+I8toI//rX1PV7ECJYiWwPBuhNh+vWjPaaJld3ewgXOaYULk8ZwK6SxUNsUy+YwUMQLOt0QSIEYVHTzv564xszenTIXqpf9pANl5Y7HfTisblEDJoCJRxNaE4b7ygUJOhe/4sO1N8+fKNaS5fiyZ7jy8yh7tJSht+/r+4pIP99Sz5dpgzpg/RXQyykupaPyAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6310.namprd11.prod.outlook.com (2603:10b6:8:a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 18:13:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 18:13:38 +0000
Date: Tue, 2 Sep 2025 13:13:36 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/7] drm/xe: Allow to stub lookup for graphics and
 media IP
Message-ID: <pcncyjgtsu4sqpgzbfsfitkcvlk5fjkxjer5t5nusjyii5rgmv@wnzeoujuqzah>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
 <20250829171922.572-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250829171922.572-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6310:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ef11bb-dead-44c7-d6fb-08ddea4c7042
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ppCz9xn9Arm+/mYusT7KOk3heEN5DjyBLvdEyizeTorVZEl5sorE5VbiyF1Z?=
 =?us-ascii?Q?P23lhDu/dfZOtzv7ZxsxH9GUTydBtWtaUxQQ0N8Uno/j1+FpKU0cfM3cnSLb?=
 =?us-ascii?Q?PGcc8w1IXqbijjpreXtBpDbjOvR60//yPlJ/roDKY5H1IipluhoIxTv6NUWN?=
 =?us-ascii?Q?c5cSYKsKSjEeDG2eCDbohqZtlgXg8lb6Jb3usz+tf7ja55ULI+/ub9IMg/BM?=
 =?us-ascii?Q?3zS97Z6Pf8UDjjKiI/rtzVsNWruAAGYJ1fUr1UCWyYSf7SC7ZjKU9CaGzS1o?=
 =?us-ascii?Q?Suv7nnRWL5WhpEiFQOyUmdZuEXSkA0V9zWhkwo5D4kIiesPIGsidfOOEnYFx?=
 =?us-ascii?Q?7nFD4DgIG8WzjjcLxFEAyl01H5NtE4DxSE6+tZBVz7xo+kGDV1ucNRmyGMQx?=
 =?us-ascii?Q?KA6+Ek/9zP5ygkFpvr4pikOIupihOzNIjaJs39Zt+X3w5P6M8hTI0OTgoCKY?=
 =?us-ascii?Q?hsJqkEs5U5EVuRbdsTP6ivPLhlcMgk+ume9Le42X71/9WpPd0/OtNJRXqXxS?=
 =?us-ascii?Q?67LwjqFSZQTK9El0jrP6q5tGGc9rsjk1uetN/pFU/j9iyYuNlpB0nWaJqSH0?=
 =?us-ascii?Q?iOyKpYPNhzOnz/eEsxZ5IsOBYiHnQ03Ji3boh+2R3++cjHk/3jF0NRElowqH?=
 =?us-ascii?Q?6hB68m1pj3TKRRmbnrQAlgQ5GwdBJS6djDqIXESASziUQoUtbVPKCp7fiB32?=
 =?us-ascii?Q?nL803BAqcS8id8e3b1MTkbcsSoi2LZFA0IxZHGnpzc+D10e2kXRuAgj2x8/Z?=
 =?us-ascii?Q?gpV+QxMFTIgLyNYxoB2A5l18LwVOXxeHPiL1ZS/gJnVYrZzlZLx8EpHeR9Ci?=
 =?us-ascii?Q?KTkbAaPL4bHhayZP6oer5MvpUY9E9FWWVZnj9v0EgyphauWz0nYX+6tTHEHj?=
 =?us-ascii?Q?pS1e5z3vIRG+2TUIM1JWiODth8vRskzhPsRHyTPtTZVWeW28rcY/HiY2Z7Rx?=
 =?us-ascii?Q?2rCLtAcFNn4xNSNpsBBCpoCnc3CRwJtuNqbVkpc1oArBH3BpX/lAZ3/7KBWK?=
 =?us-ascii?Q?Q+X+pS5om+QpuojpMO3fD/7o9VyT1gW6spWh4i1bpm5rTLWbdYVPrq3fPEdJ?=
 =?us-ascii?Q?EnopcRDqASru+Q1yeczvkDeVGeC9Xol+LiM8nUWnd/DQLH7R1T/rQbrOao3y?=
 =?us-ascii?Q?2mhIyhr+IhG4xasLZQ0yj0BoNEHGP3bbc73cv0j17AjRhp2HHdpYdcsKOj4W?=
 =?us-ascii?Q?yiwRv+VQFn+ar4EUIVfpYy02gNLndqyHMJZ2TLcNRwkMDFjPKt/jeNM3t1Z9?=
 =?us-ascii?Q?7sY8rxEwdb/WMFWtJB2GAGMzCY9T3NXD7/lwXkUR2VZm4iZEwpYKATKSYQaB?=
 =?us-ascii?Q?we/q2RMmcoZK9zLUkj/BrX+K4Y2E5TFcAuXh9ywWha7nk99+FgNLwkV1NpN5?=
 =?us-ascii?Q?mvHY774fwgKqgnTAJPdB7o3ZcikSwdfMw5ENy+bblN9ZjMgNLEPCRS0qVnXT?=
 =?us-ascii?Q?PQjdDE49aVFkExcY7aL4IYDtiZkOo/SMQeGfJX57AltvfbdbHW4j4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OK5Qk56/cPZZLwHJkZhScX3NT/DcKkHml0asZq/EFVIXSSL98Svdqua/lpqV?=
 =?us-ascii?Q?E4zMftKsPwBXUHIHOH/QPR7poBtwHYU4vTtJ0z7Hv6gVZsmGvrkhZg2BPJmK?=
 =?us-ascii?Q?0eGG6edw/3ySU4u9wi4xA8hPlyyEOI80vW33uzrbyesxJSqBGEqD+Qb4Jf0M?=
 =?us-ascii?Q?w7q9ClnRX5SE3KrHsRNafHIZBg60L7EDBXWqfXo3fRIa4gScl9L5MV91yuKN?=
 =?us-ascii?Q?ZLGyaBuNGXEutZTxD23b6HoEzshUjluEIwoVd2N9IBCTpz6YLBieJlEPgGiu?=
 =?us-ascii?Q?QuzKt7pl11IG25POBlJGWRr0cUocBApe1PiJvf0yMz4ewKW2icxyoLwAyMtR?=
 =?us-ascii?Q?Kfg4PDS4z6ljiBJjZn3SywIyt0tkbxHM42Id6yeS9Uf4R9YeUo6CVVrOyuMh?=
 =?us-ascii?Q?jRbN0RKubKmwTgJ2zoY+hI7DURa/dYWptYFOoD9U9p1n8xrth4pl5FY0yb7P?=
 =?us-ascii?Q?0T/QSN+Lwn/OauSFHMAoBJfPNMBcacAON5hr8d4xfE5lW6tBNAKM8Uo8gXIP?=
 =?us-ascii?Q?cy+Xnqfd892E/2xYzStxCDKOsziCQLW2PtjRMco1yb/ygh4bwNGXTR6g5G3j?=
 =?us-ascii?Q?F8euvL/qLKs9fSBmjsdtpjw1KPC4GQFsF167s2XiG/kzfe5UaPH9HCT0oehE?=
 =?us-ascii?Q?u+bJduqzNg4x3EFL8y5vf1eINsnwKUmrDSMzcqdiRVItQ0dMnfUm3TarCu89?=
 =?us-ascii?Q?IBJnYJhb2qMum5R/gKITEPSCfrrq2vtsGzyn9y0Mo8CythpfQ5CW0cgD9Kpy?=
 =?us-ascii?Q?sXZtonvLbIU2Jr8gswRcaozbQYbt6gP8LMRmKpCwAAq9X5CmLWFCvJ2hKEcd?=
 =?us-ascii?Q?7/KHlCuALM6L+af05NUEpSDWiW6cv7c3nPemQpJlXzvUTWS96EvjxnHrVxBM?=
 =?us-ascii?Q?t6FVIvu/PqQheW7bZpYH53s2EZI61ab/+8XLkv4ydlExNZ/oD8+FRJqmMHP9?=
 =?us-ascii?Q?T0TWWVp5kG3gNaFRyWvcGWb7g1/HjizaNY5XaEWpGauq8LOm6B4UBuI/wGHo?=
 =?us-ascii?Q?udwNReT5u2hIXbDhNnpw6Uaq1sCObx5cI61MTZQ7AMspWKwI9/eTgjKm1la5?=
 =?us-ascii?Q?8XX2PxVbImA3j5ZxphqdytawQkmO+LD2sbTNuUHblLTTWy/n0CKZuGLAReRH?=
 =?us-ascii?Q?R+KpJU1YYLvWoISBLXjSRrEnagXbZa+xHgUizX1MKb1Ry/8aqUhZky5rHdQZ?=
 =?us-ascii?Q?lVIZwaEPO8Q4Z1CvAsa++u0lTlsxrC5hrfxNca2AD69CQ8NBVi9edOWlkZeB?=
 =?us-ascii?Q?ophxR0qLjZG1TVa3CZAcwfwq3voBb143X4PgyZIT4fhasFZvg67mPCA1huL5?=
 =?us-ascii?Q?I0yyTVe5ob5vOotlcB+4P55MayZ/KMGTFfo+8YC4SyvfyjvpJF0G1mt05V5Q?=
 =?us-ascii?Q?T1RxxRoDU65DoNjRGYA7GukJZcLV0pJCC/0dSmh1ZM1HNntj0FY2JlNKUoep?=
 =?us-ascii?Q?P3WtiibsmmrJVzIMGsssuwI+xQUbZmgUchQgND6Tm8aMnxznq5sGErC7+0Am?=
 =?us-ascii?Q?NDGWZMpa9CdAnFBmXKDM3d2ksvPbk1+a8hGaNqVh7ayX+a+6Ubw3UOjcQgsQ?=
 =?us-ascii?Q?Dp51fSpQKcPp+uRv8zTq/keimQfZLxI/YQY4ofxftqrEnhnE1TFixsx4zp9e?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ef11bb-dead-44c7-d6fb-08ddea4c7042
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:13:38.0319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yq7QCWxJidZNHm+JoCy69neGdlZsTpAwMkYN0dGf8lo0ge4AEiO44dnd3+v34R0LaxIzhaBFkAjG63Qx24UOofrmdR4Fr89fTdWT5wIIvn0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6310
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

On Fri, Aug 29, 2025 at 07:19:16PM +0200, Michal Wajdeczko wrote:
>In upcoming patch we will want to replace lookup code during the
>test to relax the strict match that we use in production.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_pci.c | 38 +++++++++++++++++++++----------------
> 1 file changed, 22 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 6e9005dc5677..701ba9baa9d7 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -511,6 +511,26 @@ static void read_gmdid(struct xe_device *xe, enum xe_gmdid_type type, u32 *ver,
> 	*revid = REG_FIELD_GET(GMD_ID_REVID, val);
> }
>
>+static const struct xe_ip *find_graphics_ip(unsigned int verx100)
>+{
>+	KUNIT_STATIC_STUB_REDIRECT(find_graphics_ip, verx100);
>+
>+	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++)
>+		if (graphics_ips[i].verx100 == verx100)
>+			return &graphics_ips[i];
>+	return NULL;
>+}
>+
>+static const struct xe_ip *find_media_ip(unsigned int verx100)
>+{
>+	KUNIT_STATIC_STUB_REDIRECT(find_media_ip, verx100);
>+
>+	for (int i = 0; i < ARRAY_SIZE(media_ips); i++)
>+		if (media_ips[i].verx100 == verx100)
>+			return &media_ips[i];
>+	return NULL;
>+}
>+
> /*
>  * Read IP version from hardware and select graphics/media IP descriptors
>  * based on the result.
>@@ -528,14 +548,7 @@ static void handle_gmdid(struct xe_device *xe,
>
> 	read_gmdid(xe, GMDID_GRAPHICS, &ver, graphics_revid);
>
>-	for (int i = 0; i < ARRAY_SIZE(graphics_ips); i++) {
>-		if (ver == graphics_ips[i].verx100) {
>-			*graphics_ip = &graphics_ips[i];
>-
>-			break;
>-		}
>-	}
>-
>+	*graphics_ip = find_graphics_ip(ver);
> 	if (!*graphics_ip) {
> 		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> 			ver / 100, ver % 100);
>@@ -546,14 +559,7 @@ static void handle_gmdid(struct xe_device *xe,
> 	if (ver == 0)
> 		return;
>
>-	for (int i = 0; i < ARRAY_SIZE(media_ips); i++) {
>-		if (ver == media_ips[i].verx100) {
>-			*media_ip = &media_ips[i];
>-
>-			break;
>-		}
>-	}
>-
>+	*media_ip = find_media_ip(ver);
> 	if (!*media_ip) {
> 		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> 			ver / 100, ver % 100);
>-- 
>2.47.1
>
