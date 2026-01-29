Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8042D73E84
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 19:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A0210E1CB;
	Thu, 29 Jan 2026 19:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hISMiU3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB3310E29A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 19:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769715350; x=1801251350;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jvHMaJ2cHiLfiXQMblZaxku3zujO1U6N5I2pmsR13SU=;
 b=hISMiU3V5qbsqhU8pVRCe7O1EgaDOKw1hrKfBSlImIWs2dCXwrhwa8OM
 1mj8E+ty9Uis+FSlj5LbU55ZI+CyCzFGKTtOsTZUbkcS+yZ9O/OkM+tVe
 u0kjviJGl7NcPMeRTbMencUf7WMl6ZybTNTrjV096s6Tdp44UrKO6v5yS
 b8WcX0/aTfEYKSXPPezyZI6Zgihp7pufoulve1EDx7QGq6EUIbKfiqZ5X
 eGmsm2DhNd6DDYAiPeI7tyGieChWX+iSLs81Gz6wijhX1Xc06XdsA2lVG
 OrZBgSxrxnWIrQO/pMs9SuNp0iTX9Ip+UamhAktvLfn41ZjyeyN37rFEz g==;
X-CSE-ConnectionGUID: pY/r8axvQN+aizOSRi3j9A==
X-CSE-MsgGUID: cmRWH4aqQNu6FYB3cf3gsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82335032"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82335032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:35:50 -0800
X-CSE-ConnectionGUID: ioPlwV2OSD2QOxUos9m4OQ==
X-CSE-MsgGUID: CcRrJ67oTwCX5K1RQwk4SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213620692"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:35:50 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:35:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 11:35:48 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:35:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnukhOcQqPYNi47v0Vl5y7YaIqWaEJglzpo0NwOyDXxRfKY2duiW+DgDZjoOw5CiMSl1IAVDZCh4uWs1RQoiSrmODMFgCfl385eOA+n1OoJGEHVhDRyA9WF7Ir59qWcSauRimc5a3DO+76ujiXTgCk0sAHd1847gxwResgoygIil/daepdRbt2QCZYwyvpfO3muNZH1BKgDuImL51oPcRd2ZZjdpGcMfem4rmzQmJam1Q53zu6rSEquBYTb6aAsjPWIOSu2JSR5lOHpN+IfpH0MiVr55ioHH1iOuvKH0rfehkj21YF3pB721VDZ0LANjEvuE2irFSDrP5eAOfoxL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdeoxHRF7AsoUrRYBGthWSXdK+l8Vlsp86BmJOU3KmA=;
 b=FaKHINnGFdG8dfegPv8rZ1Dm0rFHR/zS8BHioPvFOvwaraZG0kdlBOTxIH49h4YB9Au8UeM/Iw7RgkIC69X2nw6e4a1Z5nL/up4csbBSfv/ExtUKicppqKPArr/lM+aak0pRXQisvt8xVzpyGzbogWoxaU76UMnDQJuUFl2nsiaauntpTap332AnikCQ1BPwh6rp1/lqZzDuYZ2h5ywYOsWO6Icx9hBaYChRXz6Jm6wYrWl9xcauLqZtjCl+keRHsX+BriPEpDzM/T3hfDD2Vx3/WBeuvEr7YTF5V5OlNvCQwthjpCyJz7LpTlNdqgXo9j/O0s9xziEo/j62yyXsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF399DBF572.namprd11.prod.outlook.com (2603:10b6:f:fc02::1e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 19:35:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 19:35:46 +0000
Date: Thu, 29 Jan 2026 11:35:44 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/vf: Fix fs_reclaim warning with CCS
 save/restore BB allocation
Message-ID: <aXu2kKg/mBP8aIe+@lstrano-desk.jf.intel.com>
References: <20260129125141.523087-4-satyanarayana.k.v.p@intel.com>
 <20260129125141.523087-5-satyanarayana.k.v.p@intel.com>
 <39c1fd57b78f09761867a469fae16c347d879dcb.camel@linux.intel.com>
 <aXug5LbEvo/EKh3Q@lstrano-desk.jf.intel.com>
 <0d8176e7b4e166303aed4ea1b5d57de485be112c.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d8176e7b4e166303aed4ea1b5d57de485be112c.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0324.namprd03.prod.outlook.com
 (2603:10b6:303:dd::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF399DBF572:EE_
X-MS-Office365-Filtering-Correlation-Id: 58157802-c89f-4362-a105-08de5f6d999e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?54x1XZ7qmudqZveD7i4TsmmMEKEBx9LhOZlnl7jlMOgLzs/59epkXSFBIV?=
 =?iso-8859-1?Q?7o6vnsmo3G1OS6yE0o67GuLSdQrFbGmxPJkWH4j3SbUp7z4X7TaulBeOV6?=
 =?iso-8859-1?Q?+j09ifhNJuhwukHbyadmh1EJfOVeC6UPP3IQXVSm+14hKJtM6IRdrpkSDD?=
 =?iso-8859-1?Q?yizbx8ZN6uaefp7Stdzap1HVa6MLRE3i4Y9tRc2RUMGOX3owP4kyZp9ksk?=
 =?iso-8859-1?Q?z6lHxh3b/aBwusKcZwohSC6H0epT6RcuSAS6ZP4H4aKl8yvqwmXaPr1tWR?=
 =?iso-8859-1?Q?EZL4hwCIKwTgMGVZ7G+RORpxyoJhmP+Vvqqnr+PHieKOx+vC+jt8dyP3iu?=
 =?iso-8859-1?Q?Zng8vZVh7uJ6rzN7M7MrrOZ8/OfHcUFI2GECNuyA5C8/Ud8mZ7AnLg+8fw?=
 =?iso-8859-1?Q?13q4/RTJMWnlI5jgElmVgF4cCl+nyxRUa8wWZahsTkXVLHRF5PT9r1ws1h?=
 =?iso-8859-1?Q?xFL3Mzfk3vlzHkzKuITWYh7yG97L2rgY/YFLWFW/nBtBnUXuEz5yBczUMZ?=
 =?iso-8859-1?Q?pKloqj1qf5/D6TaKNLNnfh1Fy1O6sDdG7tk08F9V/9hMQLTaurAveKIiOq?=
 =?iso-8859-1?Q?ut0ZCsmU5WTTbQoxRR+cgXW0ZxIt8EjdkLOhbIbYOMahgbxeD0g7q/U2Ou?=
 =?iso-8859-1?Q?DhEa3JMvhN/4BkSc7QpqhZRIfDjfZEAyt75a1l9cHCkMAIGNxmd0CPWUb8?=
 =?iso-8859-1?Q?5E12wS/s3XfZSFmRxfJho8/EbBgQALbiumGvLx1ZfnmsCA5q3GLRPhkXDp?=
 =?iso-8859-1?Q?YAJrKeQYaLLDMSanmvcrRMoOnGRf4PJHEsVKYq6OKP7ReTu9ZD0RcyUPP2?=
 =?iso-8859-1?Q?oc6SDuCxMolgy39AYF2hK7xs6ddeHjVr0poisQewTDYkIyMFFDSkSR/JQN?=
 =?iso-8859-1?Q?3PgJP9HbBCxZylm3Ks3FQLCvliyUbbC3BwGfzq1KJKUtZFThBc8Zlcipps?=
 =?iso-8859-1?Q?nSjpg5A9SdGVXdW4f1AvQLHLDny9CYlBSNZT94JBml8FvbmqyekJr98k7b?=
 =?iso-8859-1?Q?4nZ0K4HEqaASVDhonXORmub7PSRKgmkF07mRqhx2NNv8LYtQoPr52aZC8C?=
 =?iso-8859-1?Q?SFDq1uXaLI17McebOgZnn7nQHxCR3ZDzp8CGqPc58KgGrTtfU84qp6yIRL?=
 =?iso-8859-1?Q?L7N6YpSUfsxT7CRBt2lNKF5KKIAqbaOYflrQG3eeCT5ElbBmP5Jwm36qXx?=
 =?iso-8859-1?Q?6Li2vLqw4FH+N8bY5m5VwXdqgF2tKz6BNyw3FJfhk/LTaaCrOLmDLDhHZH?=
 =?iso-8859-1?Q?qPzdmRgfExZkvJJBAOrhUz0jZ7tam0ptYoczDSbjlmShHiBdhsATZscEXE?=
 =?iso-8859-1?Q?OowI2/ycoxs1sK9mKgo2IhQE2ZBcfY4qRdTZ7MwIIif5GQIDbSQlWSmOZs?=
 =?iso-8859-1?Q?Q/AkOTUNkNcAfFumXSI2ZHMOGOaWVdjxyBnB7CCK38GVp/vR1NuQUcW1xV?=
 =?iso-8859-1?Q?Q2/ezEIAY2ft8ThxSB64acV9Rc/nrrPuFLLvUCbp/5ylz0ulyfJxkNGz8T?=
 =?iso-8859-1?Q?NVcLKIbCF4d0smxPxZGP4uagW2dzFvyh/cuai5iPXbIc2zJquSdy+hCh5r?=
 =?iso-8859-1?Q?wHbMdxPxi1+SiFWzf54pit8sirMe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HUkVtSCCMvA/gCG/fq4BBPJrR/U7rPJvg0Klx/kiLHyEzMO9ugOQlJId0o?=
 =?iso-8859-1?Q?b/YQgKwonywCdr7SaEUANocxRVSjAXNGn4JMQwO9eQIqAS/aVxO6lwGFkA?=
 =?iso-8859-1?Q?kUlOl08ZPFvoaAVz+nOhQ+iD1HMEGY2BdTSnALwwMfvbjvPXgjBAyBqLFP?=
 =?iso-8859-1?Q?ShQYe56RSb65oC4QJbo2wFSDDxk5Dvp1vPwTCV8JCRZKGmBNNh2BlllB53?=
 =?iso-8859-1?Q?pDwwmbZYyo1F+Jg2DkzF6xisJvHYV9Kl2QeJkKsxGsaLKbIOhzlYYQFns0?=
 =?iso-8859-1?Q?d2x6sb/zVNHI7uTkvp087sxuC+uUv4nn+RSad72xjsqSoOwLqkFmzZyAC6?=
 =?iso-8859-1?Q?as4SAUH6SobQLk1zBM7ol2dw2661BkUNQdLqW8Io6XE1HR1yY/ld434jvp?=
 =?iso-8859-1?Q?8UuJZPVUU/PZfef/N5fqxk9fbdyvk9aBjIaPcOiP1a40P0LLm4YL7LrnEt?=
 =?iso-8859-1?Q?AT5RIWkDDNMF6g12Iy8YTTd1tQmYOXtZRltbfyPeMjEjdcVtyunO/wXQY5?=
 =?iso-8859-1?Q?l5EWBCfiN0LkHEyU6EFidGsSruJ2yy7/KqSlJrkrPdDGbANeks38ETZsoe?=
 =?iso-8859-1?Q?ma/vK8l7Y8Hpjc2ZtppUWRLKPaSmQOKtn1X3z6lTLX1eCiWmahxVkfdFvv?=
 =?iso-8859-1?Q?OE2YdWYg7GCR926etS6xlFO7RF3REWvEzMrBWMuJYZpkAmh7dOrfATh+tz?=
 =?iso-8859-1?Q?HXS3V+aHqsypf2DVGuhoD4Qld3LThiwiO7ufftp2OrX71V0JtREU4+hhx9?=
 =?iso-8859-1?Q?Fmkzs8Yxt0TxCu71H7IboLvtOBP4GkAOAsWqZoFsglt7CeQ3b5/Jrum6bi?=
 =?iso-8859-1?Q?vtKDS0rBu1cSmZnzNJ0jGmZt05D+QbeWI4BL8y4fG7gTQ7rbRXqz0/lB+T?=
 =?iso-8859-1?Q?BoIS7/fcEJVrP6ADXSVzezIpD/jGBWIOKQVjzCG9cOEJFiPOLwpJ50oi44?=
 =?iso-8859-1?Q?UVVoEqvApYkMD4AHZX+2g5RSmDs9QoLCj/z8SUNyroieBZZ1HHw3FZmpmU?=
 =?iso-8859-1?Q?vt49s5quRTQrTCEHS5Cw89Qi3jO4911+ZkWc3AlGB1+MwiVxp9H11B4hce?=
 =?iso-8859-1?Q?dc/PliNUmG6ErV70Y9QDSPa4DRPG/LomqjRdzPLyYnbmUnGCRWu3xkuNTr?=
 =?iso-8859-1?Q?jQ0DdhokIspC8oRZwj88/QDw4bpXKuMuKwpYHRzhVQHOeF8vX9vpuEdamc?=
 =?iso-8859-1?Q?js2SY9Aq/kdPRTyHg9XXLJ0Zb3lHhfPGqJeRIGaFjkkJsXKlak2k23oLN3?=
 =?iso-8859-1?Q?2re6KvcnFlA5j3tsyF1rsAjfOWJUMFfRkqhRHp7jMrpiV9yvKSUTGT1GcH?=
 =?iso-8859-1?Q?EA6U2LfrglHNtLUE+zSnyyDllPrCM14jYFYnfffpnqj7QiKCda0QwAMspg?=
 =?iso-8859-1?Q?m5gwfEksrPBO2UKmcoWNIwJxM1C9Zvl2QQpI9BTYGl95NWTkpdQSc4yDYZ?=
 =?iso-8859-1?Q?p7yaOcDBsuVnKD9k3cTcd6AFb10o8xREHZ/vxal/vWDReW9PBO9p8jtiOS?=
 =?iso-8859-1?Q?OMqaVipfqTizftDzspyg58TFsq6DskmPj1j2UmXMk/4SNRF96WL1RYNz+S?=
 =?iso-8859-1?Q?fOp/2MO0+ujbEvBjrrgT7uzocB44/VVGYgY7YVc2hCx51dK1FinPzYaAjr?=
 =?iso-8859-1?Q?aCnzCTBwkH+7dIm/HcEVNCbRjq+20eK24ZYDW3vO+Xo4HsLeMo7jZbGJ1c?=
 =?iso-8859-1?Q?/SXxPXaopMjMhf5cJBe34z3lw5OK0vQeNqcQT7c67lcc/FKPK50sDXkYRk?=
 =?iso-8859-1?Q?QUVCejAMyq6l2aEvOH10WM8duOQsbcw+LEVEAe5Z5upMCIV7yhsnkBAYmc?=
 =?iso-8859-1?Q?bpVVRht4v1o6Iixqc+63AfJyOSDpcwI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58157802-c89f-4362-a105-08de5f6d999e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:35:46.7931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h0CFWz9z8LUyGlpFS97gelNZDh9wraBCPKi6iyx0mwW8Jpiq/IMi6o0Vnp8ltIqUF2/sjDz4hCkSUSq/Q2SUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF399DBF572
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

On Thu, Jan 29, 2026 at 07:30:01PM +0100, Thomas Hellström wrote:
> On Thu, 2026-01-29 at 10:03 -0800, Matthew Brost wrote:
> > On Thu, Jan 29, 2026 at 04:39:37PM +0100, Thomas Hellström wrote:
> > > Hi.
> > > 
> > > On Thu, 2026-01-29 at 12:51 +0000, Satyanarayana K V P wrote:
> > > > CCS save/restore batch buffers are attached during BO allocation
> > > > and
> > > > detached during BO teardown. The shrinker triggers xe_bo_move(),
> > > > which is
> > > > used for both allocation and deletion paths.
> > > > 
> > > > When BO allocation and shrinking occur concurrently, a circular
> > > > locking
> > > > dependency involving fs_reclaim and swap_guard can occur, leading
> > > > to
> > > > a
> > > > deadlock such as:
> > > > 
> > > > ======================================================
> > > > WARNING: possible circular locking dependency detected
> > > > ------------------------------------------------------
> > > > 
> > > >       CPU0                    CPU1
> > > >       ----                    ----
> > > >  lock(fs_reclaim);
> > > >                               lock(&sa_manager->swap_guard);
> > > >                               lock(fs_reclaim);
> > > >  lock(&sa_manager->swap_guard);
> > > > 
> > > >  *** DEADLOCK ***
> > > > =====================================================
> > > > 
> > > > To avoid this, allocate CCS save/restore BB BOs using GFP_ATOMIC,
> > > > preventing reclaim from being invoked in this context.
> > > > 
> > > > Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy
> > > > commands
> > > > with BO")
> > > > Signed-off-by: Satyanarayana K V P
> > > > <satyanarayana.k.v.p@intel.com>
> > > > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > 
> > > If shrinking and allocation is indeed happening concurrently, then
> > > GFP_ATOMIC is highly likely to fail. In fact it shouldn't be used
> > > if we
> > > can't gracefully recover from a failure or if the failure doesn't
> > > matter at all, like in debugging cases where we can lose data.
> > > 
> > 
> > This is a good point. We might need to rethink this one. Would
> > GFP_NOWAIT be better here? Also as you have hit on - only the
> > allocation
> > path can fail which is handled gracefully (i.e., the shrinker path
> > doesn't rely on allocations).
> 
> I think if the lock is needed, the typical approach would be to split
> bb_new into alloc() outside the lock and init() inside the lock if
> needed. It looks like tlb_inval is using GFP_ATOMIC as well, so should
> be able to benefit. That touches drm code, though, but I think
> GFP_KERNEL should be used throughout unless we have a backup path or
> don't care about failures.
> 

+1. I talked this over with Thomas a agree spliting alloc() and init()
is the best solution + likely can use this going forward or in some
existing cases.

> > 
> > > I'm trying to wrap my head around the sa manager shadow approach
> > > and it
> > > seems to me like external code putting the sa manager in a
> > > particular
> > > state and the internal lock is accessed from outside the sa code
> > > with
> > > no clearly defined locking rules / asserts? IMO it's a very odd and
> > > fragile construct, in particular when used with guard() where it's
> > > unclear exactly what scope is needing locking.
> > 
> > The lock protects:
> > 
> >  - xe_sa_bo_swap_shadow through xe_sa_bo_sync_shadow, so this
> > includes
> >    xe_bb_ccs_new as it picks the correct SA based on shadow state.
> 
> So then basically all (or most) calls that touch a shadow-enabled sa
> manager need to be called under the lock?
> 

Correct. So I think the guards in the correct places.

Matt

> > 
> > > 
> > > I'm trying to find some documentation to explain why this is used
> > > and
> > > the only thing I can find is 
> > > 
> > > "Directly clearing the BB lacks atomicity and can lead to undefined
> > > behavior if the vCPU is halted mid-operation...."
> > 
> > This could be improved.
> > 
> > > 
> > > But what if the vCPU is halted during xe_sa_bo_sync_shadow()? What
> > > is
> > > exactly is the atomicity in this case? 
> > > 
> > 
> > The vCPU is updating the shadow buffer which isn't programmed on the
> > GPU
> > so if it interrupted mid-instruction writing, the GPU doesn't hang on
> > a
> > partially written instruction.
> 
> Oh, so we're updating a buffer simultaneously executing on the GPU?
> 
> > 
> > Some back ground, I had suggested a AVX based solution to write out /
> > clear instructions solution [1] but it was rejected in favor of a
> > shadow
> > buffer solution which appears to have lockdep issues.
> > 
> > Any ideas here would be helpful.
> 
> I still don't fully get the flow, I must admit, and the interaction
> with the CPU-buffer we already have there on DGFX...
> 
> Thanks,
> Thomas
> 
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/156482/
> > 
> > > Thanks,
> > > Thomas
> > > 
> > > 
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bb.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bb.c
> > > > b/drivers/gpu/drm/xe/xe_bb.c
> > > > index 8b678297aaa2..355365625df9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bb.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bb.c
> > > > @@ -62,7 +62,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32
> > > > dwords, bool usm)
> > > >  struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> > > >  			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> > > >  {
> > > > -	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> > > > +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_ATOMIC);
> > > >  	struct xe_device *xe = gt_to_xe(gt);
> > > >  	struct xe_sa_manager *bb_pool;
> > > >  	int err;
> > > > @@ -78,7 +78,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt,
> > > > u32
> > > > dwords,
> > > >  	 */
> > > >  
> > > >  	bb_pool = xe-
> > > > >sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
> > > > -	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
> > > > +	bb->bo = __xe_sa_bo_new(bb_pool, 4 * (dwords + 1),
> > > > GFP_ATOMIC);
> > > >  
> > > >  	if (IS_ERR(bb->bo)) {
> > > >  		err = PTR_ERR(bb->bo);
