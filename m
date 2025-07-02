Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0549C7EE30
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 08:09:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769DB10E080;
	Wed,  2 Jul 2025 08:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQs7s9Vx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4810E080
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751443740; x=1782979740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LkedgUwcIFPesfyEDX4L4gS6TqO90I9FBBtuzs1Aim8=;
 b=LQs7s9VxWzw/T0SbOB4IwfG8s2kzdyzrN5M7rtYHT+jeFswaPfJcRCLq
 3uYws71okbaUXG69XDsHlDXn2nEg5oN3dKqAnozi2rFX0mrdfEO2n2LaW
 VT/IokQJsJy9/Mb1NihEmXgHlV53pcVYRJ1/JUPxA0EbUkjYawH7nsxSi
 FuIp0fi30rTIdaB4H7dvHFFiS4CzUF3ctbLMTQmOuetRKr8NBQg4sZbav
 E6+QH9szQ3RnjJQCFd50yWo4fiEaoeFXGY8mWrQ5w7XNjICYoTEtPNcPB
 xwVA3DNjtaIdgDLK4BeAVmaORD7U7+4ubAPJmp2ATw/KniLomoN0vyuSj w==;
X-CSE-ConnectionGUID: /TKB1oCXSIKTVa5H8DEhcg==
X-CSE-MsgGUID: Ax8o4aAFQHSF/AbZ1b30+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53869416"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53869416"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:08:59 -0700
X-CSE-ConnectionGUID: 3piV4ouqTnyAVAq9Qzdfrg==
X-CSE-MsgGUID: i7HIUmo/QRi8NOQYhtTY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159715006"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 01:08:59 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:08:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 01:08:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 01:08:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmsjjO0qzFgJ60x5RPLJV1TTLJcbpvRrujVS/jCygtv/dwjHerfJxhO3M4H2yaDhZwArvmQh4q0DXkWOj6Rki7IJfRFz5l2T0tiO7KmDqSFqluMV5WJNwpsrMYM8OiPaUCOJXkITxYS2kjDNtmyeY6aCno5I2E9A2xk0xFS8j55zRbdMjbJ5pliRYrwCPHJxiri1jZGKJdaRC9Fav75+lwIrMCZaY7FcCx48a2uMxocCvJFJVH+F3i7NN5LcrN2aIdg4P+3Jo9+BXoQPki/tr9AAPMlHTQg5/v2S9rMZWPVYa1O833JdnULOXZ/1xyTOw/6ilDguf6CjN4ymfGpG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyXmzsrEz+8AKNkdl+kgWe21zKjUeDR5PqbChsJWdeg=;
 b=g5HnWrwMXV6Hi0Fd84J3U1fAR0bREENPCvOHGy7/pb3qW63ccWcM5A2cTKShe8MqG4MAsGxvv9LZx8i7itJGOLCcSG8SsIEZplBRdPavZjdaAX9PbUIAaRS8qwc9G2c2dIWNo9UKWKCAKdgTm7PZnrcAeeoVo1fBfTIuLfQjyLx7Vlv8sld43fdUGje3oQM9e54iQu0gh+T99aZvfoz8P1mW2DeFBnyTfY7mwC5AipGH4oMJyrH/Dlun08V2QMtaV1mHmc2JR33h4Le2p3T/rfKFAtwkLf6DwM2FueVivnxTykslfmxdOq99jCSaEKUn7B8moRpAwSw3JQHYQVGdaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.21; Wed, 2 Jul 2025 08:08:15 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 08:08:15 +0000
Date: Wed, 2 Jul 2025 10:08:11 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Clear all LMTT pages on alloc
Message-ID: <ch33kiryzfuhp6ayzgv4eftxdv6w7vof2dsjbmmfoo575mj3jk@vgt3vjqmf6o2>
References: <20250701220052.1612-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701220052.1612-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1P189CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::19) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: c13ec885-1b80-4576-ae86-08ddb93f98dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEc2NjJMQmtlMUxra0NpdzJ3LytlYWZvbWRyOFROVkZNbWpXdE8ySkh1Znd5?=
 =?utf-8?B?UGVoTmx0TXd1NkJmQi9WaU5XT2hCWWFwWlZKTXBSbkd1RHBjRThENmJLUnls?=
 =?utf-8?B?UGkyUnhBNHVSSEIwN1N1MzArQktYWGk3TE1WT3JIOHppQUtFOG8yWFVaY3B1?=
 =?utf-8?B?VE9YUjhyUEswWS91UldrS2Vtb3N4NXJoQ2lHbTJTeXhHSm43cFJWd2hBK252?=
 =?utf-8?B?eFh4SlZZb0tBUzFUNHo4U3gwdmduZkM2TVBHS09GOWt3SUlDSHhnN1RsL2Q5?=
 =?utf-8?B?Um9LTk0vSEVEc2xoZEJqNEcxeVk4Q0xoWUIrQTZXZ3Z0Vmdlcmgvc0xlblVx?=
 =?utf-8?B?cnNmSmllUkZtaDNidXNBRTZhMXZ5RGNMOW0rR3dLQ2VpaWlaNnAwSzJaNnd1?=
 =?utf-8?B?R2xndGx1LzZva0VkWjVXRUhvdUIyMDJCNGVyYTZhanpsYmIyb0U5SjJFMFRI?=
 =?utf-8?B?QmNpR3o1T2ZZQ29RU1hseGR4S3EwRDcwTlJneGV1YlJoM0Y1aWN1dEJCcTJ1?=
 =?utf-8?B?dEgvbzd6NnBIZEx4VStMYXhwSFQ4R1dheWV6WVRDbTBIZCs4OVVIVUV1NFBl?=
 =?utf-8?B?YnVtZFNYREJPbHk5LzYzbktkaVljby9pRnhXYlZ1ZCtNQjNjZVBnUHdYMEMv?=
 =?utf-8?B?dnBJWHBlMExKRGF5MFFqaGZXVTllaHdKY0tQUXdWenB4cHNha2JlWTM0UTRI?=
 =?utf-8?B?Sk11OG1PTHRwUnpPbjF6UnRXZ1hZUThlQmFFQTVyMlk4NjdzNjRkNzUxZG55?=
 =?utf-8?B?enYvZklsY01MVS9KTm5YK05oY0IvR0dNM1BtdzF6L0FOK1ViSWVPSk1EaW9J?=
 =?utf-8?B?MVMwNC9pQnUzNnFzb29mV3RidTJGS2FYNTlpS0tnVnVYTVZkRDJFWFcvMTdl?=
 =?utf-8?B?Rmx3ekhuUHo3TDhTdTdXMjZpT3kxZ1UxL2pCV1dlWGh6aU1EUVZPZ1l0Mk9R?=
 =?utf-8?B?TmJGZjFhWHpkREdYcTdBYVpYUnFNc09MRzR2NFh5NWNzQUhwQm9TM0dCQnlQ?=
 =?utf-8?B?S2hubWY3cmo1NnhuVTdyUVNoV2xJVUVOTDFkY2tjcWllWUNqRXVYMDJ4MHZI?=
 =?utf-8?B?Ty9YRFBlMCtIQnhKaWpKVFVTWDZuQ1A5dE51UnhwQ3gzS0JTOU9IT29kdXEy?=
 =?utf-8?B?WjBPRW5TWUlvWS93eTVwS0NuV3V0Z2NsZitVZlJmdXV6NkVPRGNxc01WN3Y2?=
 =?utf-8?B?ZW5FZVlDWEswbG5vd1R1TGtYTmZmOWV3Z3MzVXdvUFZzbzh1UzlHcjNhN0xJ?=
 =?utf-8?B?MDFBUnhZNzNnWmJqU2tnMmN2dEc1SVBNWFRQNG1ZZHMvWjVzMjl3SkQ3Y2Ey?=
 =?utf-8?B?dDl3dEF1UHUwaFNvK01EdDFsM0l5NlJWOEoyUUhSVytxcVF6eTBGNSt0alo1?=
 =?utf-8?B?UFpFRWF0K25OSjBEdXFwK1A0NktQVTUxbnVHNThBQktLSklDUEJHd0hmRzBN?=
 =?utf-8?B?N3lzUEluZDU2ZEM0QkNJajhQSEY4bXgzTFJuNnV3SDhTUE82aytnemtvdnJF?=
 =?utf-8?B?QmhXOStaS3BoTXVPMVJ1M2d3TFgrRDhtZUNhbnpDcXV2cXRwbHo1em1BUm1j?=
 =?utf-8?B?ZHhvRFVFSG8zYzFvQ3JMYjk1K2tybmp0K01CbUxidDh3TjNkRndWdkRxOWo5?=
 =?utf-8?B?VldNbHFscXNPRkRoSHNGN3JIN3BvaHY5V1JYVnFncTllZ1Z6cU5NVUdrNE45?=
 =?utf-8?B?RkJsR0VTWDViQ0JEQW1iUmZFdDNtbXIrZ0plQnhMUzN6NjBFOVpaYXcxaVNT?=
 =?utf-8?B?UkJoK0g4cURwNkVYSFVzaVE1Tzd4U3c1VER3a2JMWTFPSm1EOVpZMUxJNVpx?=
 =?utf-8?B?aWc3NHpIYTBzeURNdjFiQ3hMY25KWjl3UldqUlhzVmhXUG94WEtqSVc3WG5i?=
 =?utf-8?B?VzlmeHMyQ25DUU5pZlkvUGVoZHNlN2hIdzF4aU41NTVRdVpFdkVBWEFHK1hS?=
 =?utf-8?Q?1znV6soOwFI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anQzQi9Cd1FiUVdETU9mdGtxeWppZE9RYTZCNXFacmNIdTFISWhIOFIrZUxN?=
 =?utf-8?B?SjRDOFhGdFFtblFtRGhHbG91V3dVRWtzei9FL05HbEZFMFIxbjE4UUdXVk5t?=
 =?utf-8?B?Tm14UEZNcEdxNUUzd0pTV1czYmpFR0dmZGtNNFp0L0F3Wmk3SnloRnBXVndy?=
 =?utf-8?B?V0ljdXU2RjE0Wk9BdDFGODZYamJNSWNNd1dwNHhMVTkvQ1dSZjc1Y2pWdnRp?=
 =?utf-8?B?Tzh5V0F1dWNIZ0FIMG5aN2kxRFpISUlxNWdQOEl4OGQvVzNmekIzU1A5Nklu?=
 =?utf-8?B?cDRxOE9Kc29CbDNtVjRkT0hmTXVPK012bDh3RmtyRXZqZDM1WlFVeWJiY3Iv?=
 =?utf-8?B?aEFTby94c1VQQmF4SXkrc2poMU5Jd2EwSElxWUhvb2t1R1o3ZVMrN1FsNEFF?=
 =?utf-8?B?cVJkZXRWQzRnSEdEZVcybTNtZXYzY0NyNExEcWpaMjNxWnFYeTk4RFpOQlNB?=
 =?utf-8?B?eEh4Rm1YUFNFY0F2cjJMTG5ETXNTd0xsbit4RDg1VzFLZGlRREQwNWhjRm5y?=
 =?utf-8?B?VHd0WmJIL1JZSVJNNlBTNEpSRlp5aVlYQUlGRjl2NkdMelZSaUxZcS9acXdl?=
 =?utf-8?B?VlRXbHk4TXdhVi9hRmVlR0RLY1lqOUsvWEFBWDhXNW5mamFaNXZ5azkzSXRB?=
 =?utf-8?B?T09OaDg0bndNWXNGUzBpVDhkcDNaMU1FbFZSK1BDd2EyZ0FleEx1UHdpb0NU?=
 =?utf-8?B?WGxPOEhPRFRWQUN3eUVjOUgzRHRjYm9qdXN2RXYvcm9hTDhibUREeFFjdSt2?=
 =?utf-8?B?VkZuMXJpd2hnZFhBSGQzVzdJbjdtUFJDNWowQVdYaXVxMW12bzVYTk9pU256?=
 =?utf-8?B?UVRXN3BwZ25DQTlxaWZyL0xhbTIrbzFhYTJYZlhHYlMxMVJ5OWZ6TTA2YW1T?=
 =?utf-8?B?a3ppazBBY3RpVDhKdDh5dzdUM0M0K1FXeTVUaXRwYlI4ZjJPcDF3dmhIdG1t?=
 =?utf-8?B?aHdERVdjcHdubnk4WGV3Q1lHaWRXRjRHVWdSOFBvUjJaenpnVFIxWTUvNTlQ?=
 =?utf-8?B?RCs1WFMvUlkvYno1cldTdXVvd296dCs2dTE2UUVjb2p2bWwyWnZtbjhZNE8w?=
 =?utf-8?B?aGJTYVR0bEg2UlBTdk5qZkpScmdZaGo2bGVyT3R3R25jRFFUL25oQ05aV25V?=
 =?utf-8?B?cnArV1c1ak81SGxqT0hNMEs2VFp3eWZlenJ4cGxmckpLWkREMmhmZlJRclRV?=
 =?utf-8?B?ZmM0a3ErK2owNUFUcWhGSTZhVEVFc0tSNmdiRHBxeThOVnY1M281OHp0eE1X?=
 =?utf-8?B?SS8yM1ZjSmFiaHhtNjVEOEFYbitWVHkxZjJZc1VPY25nUXVyYU5wUkRML01o?=
 =?utf-8?B?RzZkdEtPc0RjS0k5ZmI1dHJGbm9KSlV2ZzFDb3N3NWRlaXplNzcrSWxMdlpL?=
 =?utf-8?B?WVZzdWxhamNXZDZ6ZTVVR0hNTWJwMDU4eDJqSkR1Um1CdE9tZUxOWG9MZStZ?=
 =?utf-8?B?aSt0NllsajBRcUlJRzJ1MWxzMXZVU0Jvd3UvdUFZdlhHNWZydFV3bGp3cFpk?=
 =?utf-8?B?dDRhaE15R3YyQzkzV3FsK1Jzc3M4bFpJRU9nclRPL1IwbnpVeUJuUWlrN3g3?=
 =?utf-8?B?dnlyaXVCUDJxZUJjVHo4QmpQQ2ZJSXBjZGZES1RZRTRkY2pqWFRTcE9uSlEz?=
 =?utf-8?B?WWxJekx1dkgvUm5EMTd6TWZHVS8zNERtdFBoQVJqSEVraWRrSFBOcHl3TE0x?=
 =?utf-8?B?ZlVVUGZRU0dLcHRJaVNUbjNsb2xQdHdVandydmJBS0hJVityWER1UkFXNUFx?=
 =?utf-8?B?UUhseWxGL0RTaHQ4c2hTcXhINlo1U09NMHdOQUtqZFFKOVRGbExoOGVCZkxC?=
 =?utf-8?B?ZzZJUXVrWnpRZGhtS3dUZ1RCdWZzbE5CWld2UU4vTjE0dzVvdk4xcnJuWVJp?=
 =?utf-8?B?bUorclhVbmVYU1Z0WFRxNXNBME1sNzdBREcwWldSaFA1eTZuZmN2azdOdWlp?=
 =?utf-8?B?c2xOOGc5a1pFY0sxR3RFUk5LcE9WMFhIK2twSU9KNkZHcmZCMkNYdFJzTnFX?=
 =?utf-8?B?Z25UVjIrVGpHdlNwZGppN29BcmM3ZFluZkJtUTF5Wm1xRnZ2UGtoZDQrbXRC?=
 =?utf-8?B?ZE83V1llakpqdUJVT0drdkNvTDhLdk5LcXlqVWNIQ2g4UVkrYVoxMk5RTWdw?=
 =?utf-8?B?RmVENWNzL29XRGt6ZUdsSDl6ZkNKWUdPc0RHdmdJL3N0WWxWR2dXeVplc3R6?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c13ec885-1b80-4576-ae86-08ddb93f98dd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:08:15.8146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qObiyn47hHud/IuOd1bpmBp+v9UYdfY7TEdyIS+vhfCvijpRQ9lIgJmWSwLlZOhg49FhFEHKbkFAngRipA9LwF3LI6AlkHt3OubXOHmuD5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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

On Wed, Jul 02, 2025 at 12:00:52AM +0200, Michal Wajdeczko wrote:
> Our LMEM buffer objects are not cleared by default on alloc
> and during VF provisioning we only setup LMTT PTEs for the
> actually provisioned LMEM range. But beyond that valid range
> we might leave some stale data that could either point to some
> other VFs allocations or even to the PF pages.
> 
> Explicitly clear all new LMTT page to avoid the risk that a
> malicious VF would try to exploit that gap.
> 
> While around add asserts to catch any undesired PTE overwrites
> and low-level debug traces to track LMTT PT life-cycle.
> 
> Fixes: b1d204058218 ("drm/xe/pf: Introduce Local Memory Translation Table")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/xe_lmtt.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
> index b56437a816e4..381f576036d0 100644
> --- a/drivers/gpu/drm/xe/xe_lmtt.c
> +++ b/drivers/gpu/drm/xe/xe_lmtt.c
> @@ -78,6 +78,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>  	}
>  
>  	lmtt_assert(lmtt, xe_bo_is_vram(bo));
> +	lmtt_debug(lmtt, "level=%u addr=%#llx\n", level, (u64)xe_bo_main_addr(bo, XE_PAGE_SIZE));
> +
> +	xe_map_memset(lmtt_to_xe(lmtt), &bo->vmap, 0, 0, xe_bo_size(bo));
>  
>  	pt->level = level;
>  	pt->bo = bo;
> @@ -91,6 +94,9 @@ static struct xe_lmtt_pt *lmtt_pt_alloc(struct xe_lmtt *lmtt, unsigned int level
>  
>  static void lmtt_pt_free(struct xe_lmtt_pt *pt)
>  {
> +	lmtt_debug(&pt->bo->tile->sriov.pf.lmtt, "level=%u addr=%llx\n",
> +		   pt->level, (u64)xe_bo_main_addr(pt->bo, XE_PAGE_SIZE));
> +
>  	xe_bo_unpin_map_no_vm(pt->bo);
>  	kfree(pt);
>  }
> @@ -226,9 +232,14 @@ static void lmtt_write_pte(struct xe_lmtt *lmtt, struct xe_lmtt_pt *pt,
>  
>  	switch (lmtt->ops->lmtt_pte_size(level)) {
>  	case sizeof(u32):
> +		lmtt_assert(lmtt, !overflows_type(pte, u32));
> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u32), u32));
> +
>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u32), u32, pte);
>  		break;
>  	case sizeof(u64):
> +		lmtt_assert(lmtt, !pte || !iosys_map_rd(&pt->bo->vmap, idx * sizeof(u64), u64));
> +
>  		xe_map_wr(lmtt_to_xe(lmtt), &pt->bo->vmap, idx * sizeof(u64), u64, pte);
>  		break;
>  	default:
> -- 
> 2.47.1
> 
