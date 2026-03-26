Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDF2109C047
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 07:43:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5199610E26B;
	Thu, 26 Mar 2026 07:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bhEeEPvW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B44F10E26B
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Mar 2026 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774510987; x=1806046987;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cF4KfgQn2KKRwgWwNPbGRAy4wuRYHhF5qP4drs3dDjc=;
 b=bhEeEPvWd8CWMx3ZglScjbFQOfOxoxpfFHDb3F6AsYY2mfPNfHEzB54Q
 f4pKTn9HCCW7jYG11RWUgBTeoaXu1TgKs+VKmDfHuaTNpLzRm8M/Drubh
 eJ1/Nn0FxvGslhr0wgocyYNU5ARmF1bBPiXQleWvmwzNl4Knau3tre41d
 d92tahj+FkEmG4KBs6zeFDbNAaaC7pTx7xFUVSz3gN0KAvYmvAIuUyx/y
 NOtBuzN75MfXrHk60JaofCg/NfU138wxGheCGDGT06VGnMLybipz71DCW
 5BDSpdw81/BVGmYWdP7uteSyItPipgkfv0cArr4SnMMU6o8r2M8x/4yst Q==;
X-CSE-ConnectionGUID: Bq4d3UDvTaSbImrN/mARiA==
X-CSE-MsgGUID: cMGbOoNcRwGutYAxwgPdcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75627970"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75627970"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:43:05 -0700
X-CSE-ConnectionGUID: OGtEtDySSa2Bu0rCL7LLlA==
X-CSE-MsgGUID: jnMa6BeHRRSGppvihdyVCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="225179548"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:43:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:43:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Mar 2026 00:43:04 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Mar 2026 00:43:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6HmFXKXOTrbQ+OJppCnFanJv6193nbrpRV/EvZ0tQZXQBfmBrCAvWIDpGW37SUuVlwKyuB9qga9oHaduuKqnnflY6GAVDH906TDq4fMp4rqt0CP++yvPCjRfF3pIisdTd2l2RTC+laDnGw4RiTeFPLDQA62iwvXTiDMb4hVqHsPKh1ztZXLKmTJxmy5XronLVDCS25ZWMPAQ02zSI8c00CxLub4fQ1oDHbc4rBBzFHtnoKY4cIreGP1YYAdz7gHMOBkQQgfuRiPvQCZruDlaSmcFKFY+PDajnGSfmG81800O5ODQG01Uth7P+FMXZHiJmlZft20lJWiKibJ7nr8iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veJNmOq3rkC5IFM/0IxtpS8KY29oC3MLlhC14t6Duag=;
 b=U7B4f9p4PaFpIKh8WvXo0QKvKyoOPMM2NNkTGJnUrPsQofMF0osasspMSZDp2hFRKz6n2mLekMwtVHp1BDBjHq+w/35xDRTD0o2d66FNExSlXfBvz8Uyj+I65Rw/GRoHmI/zpd6Ac084Nt1Om5yHvM+s8Lk7KUN6h2sjv2Rcmc3ohVCMT5Ovbi5tTrV9CiIarmc/kyLt+H/BUQ3D2nAvRPSwliZ5aKmJfMxIWwybeRSsc3gcgMo9wtHAkFywUphllWpxXyMQIusF032T2XBzyAYaK5di/SR7Rfwt0gr2xo781Zh86CjSRZJM97Lhrcv2aAFMCyranaWuEsKWbm6tNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) by
 DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.7; Thu, 26 Mar 2026 07:42:59 +0000
Received: from DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414]) by DS0PR11MB6519.namprd11.prod.outlook.com
 ([fe80::c336:8ed1:4b09:4414%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:42:59 +0000
Date: Thu, 26 Mar 2026 00:42:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v8 09/12] drm/xe/dma_buf: Block export of DONTNEED/purged
 BOs
Message-ID: <acTjgVjCza0AZDfC@gsse-cloud1.jf.intel.com>
References: <20260326055115.3422240-1-arvind.yadav@intel.com>
 <20260326055115.3422240-10-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260326055115.3422240-10-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0140.namprd04.prod.outlook.com
 (2603:10b6:303:84::25) To DS0PR11MB6519.namprd11.prod.outlook.com
 (2603:10b6:8:d1::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6519:EE_|DM3PR11MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e239d2d-7292-4d0c-febb-08de8b0b4da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: NPXmpOC/7jW06JC60AFKIshSs2zgOzTij8nkn3eYxCNZqNWxUV+F/LkdTwkAor65XoU11n3E64k4DLOT3baOLCnX150IWKmkX4DEJVVC4ro8+Y5X10m8Pj0xK2KFVMdKwSiS3qzlA0Pd/CIxfPjz+TUGlkQa0G30z9zIAHZeycDiw3Hkd+nysoxZ+vqxktpIhImbaf+EtDg4yCpu/j1okRbVsFj7BYtcgB5b/6PPWwiirT0fp+OxGc9znOxH+6eMCNQBb14dtssUGyyLn0+JAyNErxNnn+5/TXCZDfM9qBIcHcrCgOgrHDmJjqCXyetxXicvVr7SiPqW8KNDu9rnSa+2CHkPY8ClRBUsyae23zCRAa4i+mRBvbpy8OGtRwANxfXqdTzhDgvNfdxdPwbfwC5kp2vMNtDAQHFJryzkKcOQydVx4NBlhafnFUaDa3nc9XaLUdTHvrY9mr/321uUZAbiD7cQ1TBYYxehsle9rWfNadMT9+D6DQ7y+fH6RNy7MfKh0VoaAW9y1fTrm11iEKi24+V7Ge0YPAP9xj8ccLj4uPik/NaLRDhIevLoQa9vsSZmJEJGdhCFw9tYR9yXq3YU6LN6DHahtGBlkn86Z6MRbGaQck4vKSpTr/R5G72gMp69AlJdMS4a8gg7UjavOkPDgX5LCEW6HQe+jFt80QfCylkdP8qXKsW6l7dNOVBF7AIsdLK+QKSkXweFRCIAVqYM/Q6W4FsSQfKjnV2NB2E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6519.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGQyU1dRMTVvQ1BTeHlVSHpLYTh3aURDSGM1WlhTWkprcGJVK1JYWngwRWMx?=
 =?utf-8?B?djFCcDlKLytmbmhGM3JKRGdnbXBUVzRXTFZyREduZk55bzhER1BWUTQwUUJM?=
 =?utf-8?B?TzhiWXZQWEV0ckJiQnRFL0cxUFo5U2FCcFN0UVIwMHBONHFtSGRjK3JQUHhU?=
 =?utf-8?B?bDlpRDg0UkNKWVdSSE5pTFBJQk10RHJSaU1hbEpwMEhqYTVtOU54WUFSdWhl?=
 =?utf-8?B?aSs1RlJETzBDQ01FdDRCUTBDY2RucjBFbEVvN1cwampPc0JCeWk5TlJBVUpP?=
 =?utf-8?B?SHNMY00zSitzd0JkakhMaktMWUwvdEhtbVRXc0RnYlA0V0paWWJsVDA3U05t?=
 =?utf-8?B?cE5nTjhTZ2VqYnpSODZEcW51MkxVTCswV0xESmNPdFdnYjZLQ3JlN09tbFE3?=
 =?utf-8?B?ck0rYWFaVkdQeERRcnVxTjlHTm1qWUF1aDlJdGhXT0thVjRIdExRQks2UFBk?=
 =?utf-8?B?dUFmREIvSUtHUUdJcVlkNlhYMEw0aEIrZm9QU3I5OEhSUGtvZ3lQNmR5dFlM?=
 =?utf-8?B?OVM0MEJobnZmRm1QbXhDQ1JwZUVpb2ZOYnRaT1IySzMrS2pVc1N2NkQvRzRY?=
 =?utf-8?B?RzIvenFndkQzeVFsSXhobVJzaVV6WmhoMTdUY3A1NVNGZHJkQVpmR1hmY2xX?=
 =?utf-8?B?bklJejN2bTY1Tkx1MWNzY3RWY09pUHVPQ0Fyb2NkNittNVQ0R1lzNmxmVmU5?=
 =?utf-8?B?STVzUG50QlRrQ3llYmowVUZNNzFWem0zNGpsa1liYXNxc2JlU01WQ1JTaENL?=
 =?utf-8?B?VWtHQ1JLaWo1M0xWcHB4amMyOUUzanpiSUFaMnMwR1k5aHZvTVBYazFSSndl?=
 =?utf-8?B?QXZiSkQxb01jeWpSN1dtbi9WaE5oODJjM2lSTzBvVmJUWE9SWVFuOXZVYVRN?=
 =?utf-8?B?Y2hZUlhGNDk4WVhuTjFCMGFzWFBlbm4wL0dLbG9NVjBHb01sbVRrQ1V1MmQ4?=
 =?utf-8?B?QTlLb3ZuSGpieWdCT2RKUk16dzIySUFXampzUUNKaFN3dkpmVzJvVDVVUnlT?=
 =?utf-8?B?bVlzTzlRRFBRdlB3QnpiYVIrZ1dwdnZBTi9xUUwrSWN3ZDRhUERxQlBWNTkv?=
 =?utf-8?B?ejlwNGdBd3JNblRxbkUvcEFMNlZVL2wvRzhrYktkSk1UVkRpNEc4RWZhREZu?=
 =?utf-8?B?U29iSXF6Y1NXakR4RTJOSWxlTXRJNWlUZTN0SHErcmpYcW8xVzZJRWlmcldU?=
 =?utf-8?B?VDkwYVJtekdtT29XaUE3OUNwOVdva1dUYXFmVVc0ajhzaElic2plSVE1UEM1?=
 =?utf-8?B?TVFqejFjRXVTSkpQbm9zS1llMW1sUFVReHNYbWEya2tGVDNzZ3JvK0hvQzBq?=
 =?utf-8?B?V3F5cWtPeHhTelNQd0hjZ0xuWFNRWWlSYytvZDJUd0ovei9GZ0hpQ0VLV3Fq?=
 =?utf-8?B?L2FMRjI3OUN0aG85TTJVV1lkbzFWTzA0aGhhNnVzSFE2TXM4THlIQzJGMklR?=
 =?utf-8?B?UUR5NmtDRlhqeGo5b2RWRTMvNXVPTkg2eDlOQnk3ZjZLYnkrakZwWUxZeGls?=
 =?utf-8?B?ZFlIb3A1SVNaeHBhL3hsRkpqVWE5T21wUFBHNUl5czBkWThraVZTbnhFUjZ1?=
 =?utf-8?B?dHRqS1RVcUd2OWVPUDkzbnNWdTFmZUhtWTAvOXZHV1F4Z3RKVVBBREMxNU5T?=
 =?utf-8?B?MEpUQzJ6aEkrOXcxWEpNcXJqTnl2SXpBRmlqcUxJeXdaMXVIZyt0TU1Va1JF?=
 =?utf-8?B?N2J5S2NaL2xxRkFpRkRIWFpLallkU3dQUWpxcFI3U2hPYysrekI3Ryt2ZWZC?=
 =?utf-8?B?TklrRlc2MnNjaWt6Qi85alhqMjRXTFkzZ01OME40YnMzYlV1bWIxdThzdjNa?=
 =?utf-8?B?VEJzTmNZY2NPR3B3ajdsU0xzYTQ0MFRNU01kVTF4dWRQc3NBRlY2K0hQTGhE?=
 =?utf-8?B?MGpzNkZYRGtBUU5tajVtRmRwZXRWanN5QVdleHVhd1ZXQmtFWjNJcmJhNEZ3?=
 =?utf-8?B?c3NaMVF5QkxFZzRUWW55SGVlVHNqWkQ1TWlTbG52QlZsQ3BxTTc1UWFwQjcr?=
 =?utf-8?B?R2VNSkRhS1UvQThrYlNZaFlNRkcvMXlkOVkrZURDdU1sdTR1YW5WN0l5TkI2?=
 =?utf-8?B?aGsycVBTYWdjMkxFQk5YekxPRUgrZkFKMmpHQktoTXR5dStUQkxBdWtQMnJX?=
 =?utf-8?B?T2ttZXo1UWtvbGlyNGhUdXFaRlBubndXaEF2MXVRb3VrMEdxcnFFYWVmcGlz?=
 =?utf-8?B?NWtMQTFvcUpHOC9JbDZiUzIzV2xGaGdzQUlKcXBmekQwMU5GaUt5ZDBjSXRD?=
 =?utf-8?B?RDA0bzJaeXNIMnpUdm0xZ0pxWENGTUVheUR2K0N5QjJmVmJBU2U2RGQ5TjNy?=
 =?utf-8?B?aWRlTVp5ODJwc29YeXkwODdCS015dFFGbXZiYUlwNXI1V3dBRU1LaFY0QVNB?=
 =?utf-8?Q?U0L/LPTUryWP+FQ8=3D?=
X-Exchange-RoutingPolicyChecked: jb28cs7MTJdLFyhKFWya8XDnr7YO+/1kuX0oYgU5cJJXITwN3w0C7pb3cy8egkOb8FAVOsLfykvG/P39Yf205Newoyu6zvCJ6VLxZAbh/Z2iy2z4ojZhGk76OZE8u2mfaWV0ajg+nfLdjOqwFlYtnC4pjiPnS5oPZbc+6cT2kzLO8LMIAwROYT4RW0lONVZAozX1Vm5ljb2jDOd1gTQVs/M8/RbvTwwNe8CAy69bd664fob9UZ4zRn3YAPbyBu26d45l3HvNDnxkUwG3niIfkBYNeoGdsFZWPGO2iH/HDnN4tWIYaIOs8qvo+nV7+TBTysZ6EE1YlvOdL0Y7X2CEuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e239d2d-7292-4d0c-febb-08de8b0b4da1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6519.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:42:59.7572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+fCuh6rYi1uWrMcgmSv5a0YS2c2J12/lsAw2imPHTp4+JPyxTllQLJhtXN8vbT0gMrVgBkoxFgdQNlD7P8IxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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

On Thu, Mar 26, 2026 at 11:21:08AM +0530, Arvind Yadav wrote:
> Don't allow exporting BOs marked DONTNEED or PURGED as dma-bufs.
> DONTNEED BOs can have their contents discarded at any time, making
> the exported dma-buf unusable for external devices. PURGED BOs have
> no backing store and are permanently invalid.
> 
> Return -EBUSY for DONTNEED BOs (temporary purgeable state) and
> -EINVAL for purged BOs (permanent, no backing store).
> 
> The export path now checks the BO's purgeable state before creating
> the dma-buf, preventing external devices from accessing memory that
> may be purged at any time.
> 
> v6:
> - Split DONTNEED → -EBUSY and PURGED → -EINVAL for consistency
>   with the rest of the series (Thomas, Matt)
> 
> v7:
> - Use Interruptible lock. (Thomas)
> 
> v8:
> - Check xe_bo_lock() return value and propagate error. (Thomas)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_dma_buf.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index ea370cd373e9..7f9602b3363d 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -223,6 +223,26 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>  	if (bo->vm)
>  		return ERR_PTR(-EPERM);
>  
> +	/*
> +	 * Reject exporting purgeable BOs. DONTNEED BOs can be purged
> +	 * at any time, making the exported dma-buf unusable. Purged BOs
> +	 * have no backing store and are permanently invalid.
> +	 */
> +	ret = xe_bo_lock(bo, true);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	if (xe_bo_madv_is_dontneed(bo)) {
> +		ret = -EBUSY;
> +		goto out_unlock;
> +	}
> +
> +	if (xe_bo_is_purged(bo)) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}
> +	xe_bo_unlock(bo);
> +
>  	ret = ttm_bo_setup_export(&bo->ttm, &ctx);
>  	if (ret)
>  		return ERR_PTR(ret);
> @@ -232,6 +252,10 @@ struct dma_buf *xe_gem_prime_export(struct drm_gem_object *obj, int flags)
>  		buf->ops = &xe_dmabuf_ops;
>  
>  	return buf;
> +
> +out_unlock:
> +	xe_bo_unlock(bo);
> +	return ERR_PTR(ret);
>  }
>  
>  static struct drm_gem_object *
> -- 
> 2.43.0
> 
