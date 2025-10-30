Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A99BCCF9FC
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 13:40:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E224110E979;
	Thu, 30 Oct 2025 13:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdrLMKFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7A810E979
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 13:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761831642; x=1793367642;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vC1cH5x2hsRVphW63tYlEkPzWYv8pZR0yopVxTpD8jo=;
 b=UdrLMKFgw0IlRHSnE25txkogtQnbmLCu6BIPmTJZ52ni0jh5DZbnX5dy
 TSPrHTTMDFk6MVjUEAhSc4BHvR8hUYDq8jEf0uHrbVAMcbarjRHLbig6Z
 j8oZ2EJpFMDjeuOt5cvwj1lleTXeOoCaJKtwD0n4CtvRrz+YV3Hy+taZW
 M428MasozFCeyesyHbS3Aq6A2WJDdp9ZcF8ZQKt7sBj7R+zkvl9oVR76F
 jgjpY+kt1LgPv7Q0GtqdKUSxUcADz9TmlIhn8kIqyiGMmCJq3Z5a6v0G7
 Ld+YwEOPjx48wOCqH4DxzqycVrooJ2/ZIOpbozCmSDKYG6XKXFgzAaWdq A==;
X-CSE-ConnectionGUID: gB+EYeGoTByQtMYqClbIZQ==
X-CSE-MsgGUID: QPSVXnOHT023UByTQI6QJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81391167"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="81391167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:40:42 -0700
X-CSE-ConnectionGUID: bDjLkhqfRoGLzyK5wCSlCw==
X-CSE-MsgGUID: Em17jhbvSwG/zBIpfFgKRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190030996"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:40:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:40:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 06:40:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upGwl3ivOnPkQYYKWa5W8+5BeXZ5k8uV++6vsGKU+2PB/uisVut7x3eRsXl/zNW+5043JjnEO00isk7uiGhDGwXIFaoeTY68vByc6tS4U8xtYDzQ5BXUubt9u2oPj/VXJMapUw51rJxqeOBzmPAzLs1XoZr8jOeysH7AoXwtPhj/j61qHUPbJoBlzyWCEep4kjhPIvgmfAR+Jdc4+C5zokWUwQOYOmFN6jgGaixwA4w0avJqTyQpKuDkaKRM5YjWGzE0yaXMfllPg6nF50CylyPw67jMRiCKGmCFtmSJ9nt7Jhh00dm8FKeC9+zR0wOupCmhn3ICXMIiNJEJPRoiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vH49l6MHPDiGSK71yTf48eVp86v5sf0LU0i1P8+fJmk=;
 b=v/mVl7FTccYpaEK/6J5H0InUv+Nm4w6eWMlhsCq20IlJlDHQBOGh0smxht8mjyt4ExHtLxJLHaVeI6i7WlIIQHaMq5Vdrz6PhtWLxR6UtC3PgronG1FX7AMB7mKEuE+FpxXBArTpqtdUPiyY1bgWH2yCMw9scVz4tOR9IHNbjikOENBLwBU9t0Q9gIZfq7Y5ip3IHd+K4SnlduENZWH0WuOvKifCDrLvVMNKMCo5vTetMa4vBmQ1OasQ+pSZiS0+2ZPaZgGupVnJqYl76NDC69Qn1/svbKppG317DkLkc6js0TyHUFf++529/mBNl4EYvs2PS/BbShO7X/IeWEQozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 13:40:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 13:40:35 +0000
Date: Thu, 30 Oct 2025 08:40:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 15/17] drm/xe/pf: Add sysfs device symlinks to enabled
 VFs
Message-ID: <e7kgbqxar577z7xsz62qz53z2czwvskkointdwsk5visvjadgz@ug62t2xw7p4o>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-16-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-16-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0263.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: c3de3b46-2c7b-42b7-365f-08de17b9e75d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enVjVVd4dEZYNGxCZndxcXdrUVpLZ0E4ZmhFc1BLUDBRVk9pd3Bwc2VGTkFY?=
 =?utf-8?B?Z0J6c3RaVDdHOFpjUGJpNy9VUXFpalNYbGZaQ0k4bW40NlNCdlB5Kyt1MU5s?=
 =?utf-8?B?bmtHQzl0aWx4TlBkTEUzSlMwU3VST3pBbGxKci9HcDExd1ZpR1QvTkdZQXZp?=
 =?utf-8?B?ejV2VEhuMTdXbXJvK0F3dnFyWTZ5TjI3a1AvMlFMZmVXSGVSWkdiNWZtSFgw?=
 =?utf-8?B?TkhQV090MGpzeTd5WlFoTlJBdnZ1TUpCMnRlQzdtY0s5Nk92VlpySi94QW9U?=
 =?utf-8?B?c0hyTldoOVlaUytEMUNnSVFsM3RjellLSzRBSjV1Z2xZQnlEeXozUjZKbVhq?=
 =?utf-8?B?QXB3RGg5Q2xKNnZNTDBOTWR0TzJNang1VEhLbjVTcjBkU1dXOURGdTFDNUwv?=
 =?utf-8?B?OTZONEJUb0IzNmdDeGxMazd3Q3d0WU0xNVo3YXUxTnM4N0R5c3NSekFpSVow?=
 =?utf-8?B?SFFTMDF0RWlYS1ArZkdEMW8zMG9YMG9WcklsT0RwbGRYOUFRR3BNVVNmTkls?=
 =?utf-8?B?ekFLdUlPTnExbFRUcWhBZ01pZEpscGM3ZkordU4wR1R6UUZyY094b2VPc0lC?=
 =?utf-8?B?alVvVHBWY0txOWFvajc0U2E3aW84bk1EN0pGc2ZEWGUxVmhPb3lXbWpxc0Jk?=
 =?utf-8?B?M3lESDNDcHV2YVdHZWJKMUh0UVlSakhhUjE2QnhPRTNsQXFuOHl0UG5tSE1n?=
 =?utf-8?B?S0lyVnRwcHBRYXljWlNQT2RpYWhaa2VqclNSbklSOFF3a3FTRFU5dmIwMDFa?=
 =?utf-8?B?MG1mZFJTZGVaNkxCcURYQ3l0ZjhWMW9QZjdKdTVyZDhkQ1VzNWxKTEF3bGNt?=
 =?utf-8?B?MGZjSDNoalVFOVN5Vm1UU0psOHNnOS9tMVZCdHRtdWgzVFA2T3dZR1ZjRXFS?=
 =?utf-8?B?WVFzQ1J5VTdLOE81VFNyT25TKytraHRSVHA5YkF6QTU5SS9UdjMxZ1NUYktR?=
 =?utf-8?B?ei9FR1FFSmMzS2JaTjJUZ0pXUUN4OWFCekRuV2pVM25hVUowOGZRM0pIcEdE?=
 =?utf-8?B?d2hjV2dhTGJFYldSUCtCWHNYVnRVaUVsMTJQcWlqOFJRbmVIeHVKU3NEWENy?=
 =?utf-8?B?QWxVZDRUY3pRTkcvcWdMRTZGVTZhemg0bXI0V0ZkOUNZTVFDV211cW1jbUwy?=
 =?utf-8?B?eTJHRmJtUWJrdkFadkFJY0c4dlBJTFdyZ1JCVlAxRmlHc2o3dnFyQmxOZVdR?=
 =?utf-8?B?aSt6UUlEbTFhYktFb3RPRzI2eFhzbnFMdXIyQThuUlBoQ2VyNXNaWjRxbzVH?=
 =?utf-8?B?bGtIWWNrZC9DRjFWZ1p0Rkd2a1VPeEtZckdMUkZPMktHMzJDWm9JcHZDZU5Z?=
 =?utf-8?B?S29vTkhYZkJDMEd5cjN0QjRqMkNtS2VsM3NTR2VrNHZpcWU5VFpDTUc4bHlO?=
 =?utf-8?B?TXZLVGlzbkt1Y0ZLWHl0WkZMK0xIb0NhRHhPYmR4L1IzMy9xY2s3T3dWVWhB?=
 =?utf-8?B?N1VXV2ZPOXN6eENkZC9GRHErblFnc1F6R2drY0pGR042MDg3Z2xFUG01c1cw?=
 =?utf-8?B?OFZqb202aTBUWWEwUVFSMkpFN0VIWllDMjhoZUJXc3dwZkF3cVk3eVU1TWZ2?=
 =?utf-8?B?dHlVMmNic3V6YldpKzZvcHFIVGJMOU1TOEtuOFBwZkViZytncHRYOVJ2RmpU?=
 =?utf-8?B?eWlpVVJzUSs1LzlhbGppZThMdWRKU2VTWE14WUV4cFVqb29mUWgyWDBwUVQ4?=
 =?utf-8?B?Q1krejRtUXB3NUVHMVkxUWZtQXg5Nit5VkoySTBMbW5wU0M5Y1I2MXQ4a0xZ?=
 =?utf-8?B?NE4xdXo0VnZId2p4RDNnSmxRSnZlUC9RWVpaTVFPQy9lbzFWWVJvcU5wY2Zu?=
 =?utf-8?B?WVFzNEI1Y0VhYklnTlVNN1o0ZUl1TE9BS2w4ODdETWJ4ZzZzM1BsUUdFOFdB?=
 =?utf-8?B?NkJ6Z0ZaOWI4OUEwMXlNUEFlTTRQcVE4WUZueUNyL3FuS1FZRXQrMExXVU8x?=
 =?utf-8?Q?+eJZSOOMifwtzHO5p75yr7Sm0+2QLZLW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnM3VnpkYmFubXhKekRTcGJKR1gxcGNsMG9GV3VxSWhMNEg5RjVDd3NVWGdV?=
 =?utf-8?B?TndEU25CWVk4N3I5SE1QOStSQVhjN0NjQjBKeVhGclIra05XYUJGN1BFM2gx?=
 =?utf-8?B?eUVNUi9xZUM1c2R2dXRHRkFMNERjNm1EcDYwY01XZitQUmdITVl0d3U0S0xa?=
 =?utf-8?B?SnBPWGlqdUZVTVZkRVhQN0d1WndJRzhIZ04wSnFLYXNTS2lmL0svTlN4bFRW?=
 =?utf-8?B?aHFRakVkWStZb0ZINUsvYnJhSE03eUd6SEd5L2Z4M2YvNXBBQ3FIcUw5Qzdv?=
 =?utf-8?B?bUxQaFlxQWlpcHV3Sk1XRU0yNU9ZaFVsb3VFa3NoSm9EQS8vczZRVkh3OXNq?=
 =?utf-8?B?RkI5VW5PSi8zay9QdS9NSldraEYxb3ZYeVpRNGNiUmlMbHhWRzlBVlJCSHF1?=
 =?utf-8?B?QTdpc0tpY2Z6WThNQ3FkWkRWUHZtRFI0cEVUNUt3RmRORCt5ME5HQXNXN0tl?=
 =?utf-8?B?MktMM1JjTVp4WGNyVVVuS2hGUUY0NFhmTllyM2hLTTB5bGhWZFEyN3dqcGJG?=
 =?utf-8?B?bGxieGRwbG5vRFhaUS9IZUR0TldZbnJsOHVtVVpRbTB1azA2Z29HbUVFWEox?=
 =?utf-8?B?NU5VRGc0cDdkakRYTGtXSUs1WGxtajdudld5Nk1BMHpSR2xYcm1NbVhFNTYv?=
 =?utf-8?B?RGlSYktkMkNzcWdOdkV6T00wZjVaR3pyQnlFZlJHa21XRzNna0Jya2VPVVpl?=
 =?utf-8?B?ZEVvRStPeW0ya3NOL0hYa1U3TjRBUFBzdC91UndXdURBQmUvVmVsbXFvVnls?=
 =?utf-8?B?WnFxL1o4RVNqdCtEd0lYeWgvb2s1NlhiVm5iQWtCRktYZFA3dzRFNEMveWxu?=
 =?utf-8?B?YzZ4ZEY5MUowODdFdi9rOFluQ2F1YTBpQUxRdUsydmdoYm1oN0VjVzUzNEcv?=
 =?utf-8?B?R2FkOWlkL1k5ZHI4Umdpb3A0eTZ0My8yMEp0dVhkRmdwb21vcksxSnJzWENt?=
 =?utf-8?B?S3YwR0t0cjQwU0VFQzJJbmlpRk9DWEszOHJkWDBKeHpZVGlGOGliU2ovQ1pi?=
 =?utf-8?B?a1dHZ3Qvckhnd0lMcXhhUDdBSDQrMzZHMkMvM3FIYWxTbWtPcVNMTWxNbmoz?=
 =?utf-8?B?ZVpxcEFIdHdMdHBRWWtVMGhhM3R1R1V2RWxZclhsSGxRRWNTUW9zZ2M4VExh?=
 =?utf-8?B?a0ZuL3lqSkI1eHFHcVZzaU9OR1MwOVc3aEpubGJXU3ovaVoyZ1BobnRzOGU3?=
 =?utf-8?B?Q2c1cEQ2NUYyZHF6Q0FDZlFGYmZuMG1yRWd2Um9aUnp0VjRKQndFOXlrMkNo?=
 =?utf-8?B?ODZhTXJtZ0Q5clZ3VVk1d0dXdEhKQVBRZE1xeDVzckRWZ0x6UjhHRndnOUxp?=
 =?utf-8?B?aC9rZW9OWVR1UktZWHE5QzViUTBHS0xUMWN5cTJjb0dsT0FoVXliZm5WTlND?=
 =?utf-8?B?UGhJL2JyV1F3ZUdxTzVaRHNlMkRRL3VMeXVoYVBFR1krQk9ZRUNqL1VQcTAy?=
 =?utf-8?B?QzZvMkJyU3d4VkFxYlE5V0pVYU4xbmZicGczdFl2dlZOa2NjZVhEcitPWE1K?=
 =?utf-8?B?UnhoOE1qbTZocTczdUdUY1lic254blF4cUhGR1FPdzJpejNtYlVHOVBKZVR0?=
 =?utf-8?B?U1FudWhMTFR5SVNLbTRRM2FpazJRRm5DT0Y5K2VCZmZlMmNoTyttSFF5OGdh?=
 =?utf-8?B?UUJGY2NpT2JwemtpTlJ6YUxmcXgvTnNpRFYzb2NRRW42TW5zVnJnYmtkazI2?=
 =?utf-8?B?MlZHS0xRVnpOekplajVrd3JGVzhmUWxHMkN2NnFDcHJDeTA0c1FmbGI5UEsx?=
 =?utf-8?B?ZnVKMEhTeGQ1MjIyd1FhMjdjdUdYbkFEckNtWWdpZlUzOWx0cXAvVityTjJY?=
 =?utf-8?B?VG82aUVvS2NIMVZxY1RZYlY4eFIrUC9tNXlOb2xYNkcrN0Z5c2xOaGlsSTBQ?=
 =?utf-8?B?WHkzb0xrV3UxM21wOTNKV1IzdVJvNGpneExlWXI5WmlEbGRKZVA2NWduVU9j?=
 =?utf-8?B?NWN4MzQ2Mm1SNDJKNkVSMFhJaW9WclBQQUFBa21zbWJzbERiUGZpYTBrUWNw?=
 =?utf-8?B?Nk52bnBySDNHdUV2bTJXOW1TNjRPbHNoUndPVnNQb2F5Mnc1TEJ0ZEI5U1NZ?=
 =?utf-8?B?Zlp4QXRXK3dNbjdNWjliV3Y3MWsxUzNLRnNQTmVLVFBzOWt1TTRyKzJwZ0dl?=
 =?utf-8?B?V2lkRjh6b3BoalFSQWwzOWdOTWRFYXluUEVPWW5PQitVQXVnSkN6VGJyV3NJ?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3de3b46-2c7b-42b7-365f-08de17b9e75d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:40:35.3270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6MpWWmaS8ZtrOYqyzT/ogEFD5pPW4AHA3B6r8xoYkX/L8yMwKRg85omDYfSuHJdM6nmMoPk7Hhhy4Xl2BKicPYdeX+W9IO7JXNUoC86jWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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

On Tue, Oct 28, 2025 at 06:58:29PM +0100, Michal Wajdeczko wrote:
>For convenience, for every enabled VF add 'device' symlink from
>our SR-IOV admin VF folder to enabled sysfs PCI VF device entry.
>Remove all those links when disabling PCI VFs.
>
>For completeness, add static 'device' symlink for the PF itself.
>
>  /sys/bus/pci/drivers/xe/BDF/sriov_admin/
>  ├── pf
>  │   └── device -> ../../../BDF	# PF BDF
>  ├── vf1
>  │   └── device -> ../../../BDF'	# VF1 BDF
>  ├── vf2
>  │   └── device -> ../../../BDF"	# VF2 BDF
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
