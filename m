Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EBCCD6E6C
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 14:04:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2FD10E08D;
	Thu, 13 Nov 2025 14:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpDm4WSW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD6110E08D
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763042686; x=1794578686;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=rAhrlzhUjFloXq6w4AnUMG7260IJbtvMYQQJB3RJ/U4=;
 b=UpDm4WSWntd5uqr0JtJcX5tsbhj2qxY4m1SbBQfU1x3uTurSwV/ngGiE
 cGqQseQMzLHAr11Gfnm/H/6bdH9V2m/sueEVZXE+ia29liAoO86IeLNbP
 9XfJFNegYySRYSfFdIoIYy3UPxGB46/NVR7TPI63gp6sBOGnPhma1Ge8a
 ztGt0Qdcg8OElX3zh4QxkDqWdJUDO17+4LDZCOsW7CgSg/6W7608MiPMY
 WtYQ1DK2IgL7sA9X3PUm+YOQEnMpG9qEmIQjv/CY5huWuAnvD+2romT6n
 UVYUSiPo4N3PuuYBrBNQs8vlX256gvf9kA9Ay5KF624Tpli0lwItpN+tB A==;
X-CSE-ConnectionGUID: lbHLlbtQRmGJ7bM0gh4fiA==
X-CSE-MsgGUID: K/54i+LxRxKrIxG7rnyvIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75438059"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="75438059"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:04:46 -0800
X-CSE-ConnectionGUID: f+fj/B+8QUmMnviba9pU7w==
X-CSE-MsgGUID: Zd5u7cu7SmSnV69sasxfkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189325900"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 06:04:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:04:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 06:04:45 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 06:04:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZfkT0jL9g4idzUeKHKZR5jlv6zEnIXyPXwV0fWPLzpj22fr1VvkR0FE93H4MOoExapcsSL1XVnKVuClLMvfeupquk6gz/GxIToXSvt/IB0xHRogLbZvsD6LJMyNt+J8aa23a7mxddk4fXNce/kSJia+Dg5gGsA+Fzhj1ALrb4Ng5DKLMX8IZoYzuE5n2r8NlRE1mKO5u7QVXrwgrrS+84DcuqVzA41fY4FyO+yQ9nJ0X8sfjF1HvvUfbke20R4DRT0BFvsB91a2BZUNO9XMeM5UTb+rEtMR60mAhfmQGymsv8GNro2VYgvF5oMuHC8+ryEOe3UbIMUsrvpSnxk5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJ5ig6Z3IQXsosKuMBFrTnDB10wYG1V292Oc6nzUEC0=;
 b=v4HqF3ueq7fPckwzAxGRteqHwZyccGJfR+t943D3iaPU/pfpT8eS/zJfHW/LEgZGzvWWi88TiFJHVUTCDDUkXZAEj7pjDB6ztH/irXmNmyhIpWIOuEic2cAXm231hCZx+3wGfO7Tlsqbrm2UqGL4Gl6Uw/ZWDzdhWLu9gehJCXEIfvZJbCDV/WTI+27Ks8TAbbppNdaHWnZxlrdeIXhfjn+pdJ71g11mgsDOatProZz0TiDIUoThQXW//kP1z5mrvHCq/qjMpQjq+TS9/ZLhh8L+Z8IkBaYlR9T3rUmRjlFDqeAbZNNl9QNWji+qNBELh+IdLLUwyMVQ6G42t2oOfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 14:04:42 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 14:04:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-46-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-46-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 14/30] drm/xe/device: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 11:04:24 -0300
Message-ID: <176304266424.3698.16847403134231257527@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: 247bf24c-4c44-44e8-ed86-08de22bd97a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0EvOXVFR255UlhGWUNzeitub1hhM05BMjVnZVI5ZTFEb0ZqN3p3RjFWb3B0?=
 =?utf-8?B?aU5LWW5XREpkV1hBZDZPOVlzWXhLN05kVXpDNWVTK0RDWFNSQnV3RVJzR2c2?=
 =?utf-8?B?dUdYc21NM2I3TzhhOTRnZ2hteEUyeVZFMG1vaXpVQ0EzRDloSWJnY3RBRDIv?=
 =?utf-8?B?amhSdkhKekRaZTRSdlFVZWYwZnVyYjlJV0tLSU94Tzd5cFUyYktIdHh0TWUv?=
 =?utf-8?B?cUUzVnpJYkRObWlVVkZrZXlYZ09DNkM0N2lYQnZqU0Vsd1lFaTdCeVp3ZWYw?=
 =?utf-8?B?Q2VSUlI1V1dyU0cycmd4UlgyVjFZenR3TVowaTNLQlgvQ3NUTy9yRGMzQlZI?=
 =?utf-8?B?bjJEZmk4b2tkM2wzUDR5VGs1K2xWNWJEL0hkckxydklkbi9iNXZrKzIrdnd0?=
 =?utf-8?B?UnNWR0RNUWpEL2Q2emdSWHpveUhlMUd5NFNoUEhPNHFLYWZoZXlkOGhGVTFY?=
 =?utf-8?B?eUg0K0FVaDIvZE03RW5LK3gwWWdnbjNpS2lKVERIdEo2ZDUxN3d6ZldIaVVK?=
 =?utf-8?B?SER5NkU5elFyK1ZPNGxLWlZ0cGx6U0xLbkN5QnMrTjNGVTNGajVrTmQ0Wjdk?=
 =?utf-8?B?VGZ5TnNkQ05MemMwc1ZWR0h5dTFETUJ4a0xwcjRJL1kyM0RWZElKWTZPaFk4?=
 =?utf-8?B?eS8vbmwvWGxOeFNiS1YvaXhuUVptd0N0cUl6QVpMdUIvWk5VNlJ1RDIyRi9C?=
 =?utf-8?B?RFUrbFhlQTFWNXlLNmJQS1JiaFNZL0RwYVUvakttSnpUUGNBaFBrYUxQT3Rn?=
 =?utf-8?B?VUVkaTZuaTczZnlGWGtKREZjaXF6K3lHWDFtbnRSVE9oQXFOSVBEbGI3M21D?=
 =?utf-8?B?cVgrMkxzWWhDVklhUWJrRXB0dGd1RHF5SkllK3RheEYxbncvRE5VWndWTTE2?=
 =?utf-8?B?WGdpbnExN09zZm1nc1ZRWVFVT0xFdTVuYzhqb3h1S2syMjh6dGZ2dyt0SGw3?=
 =?utf-8?B?NlpjSjU2bFZPRi9xQXpHSWJ0YUNSMFVzRDBIbW42aHRISXp1WCtjZkRnZDdY?=
 =?utf-8?B?N3ZCN3FDZEo2WG1DQ1ZBVHI2QUMvVEV5TE5zWWRLeWJZS2pvV3V0YXZOOVln?=
 =?utf-8?B?ZHAxWDFMejYvbTl2VVNUd1JnbzRYV0VDRnBvNUNmdVcwMWovUlpxWnpOOVpK?=
 =?utf-8?B?UjkvQTBHOU9jZmRnTnR5aHR6TlVEclVZVmkxaHhwaXZKcjkxd1V1UFdQYnVC?=
 =?utf-8?B?R3lqZE5kM0hFRy9KeGpwdHBubG9VRjR2MVI4eTE0LzNDTEFmWGNCb0F2R2NG?=
 =?utf-8?B?S0xKd25MM1c5YzVaZmFYNUxyT0xkZ0JkalVYZ0piZnU2SjVPSDF5SU5TcXMx?=
 =?utf-8?B?RjMza2dQYlcwek8waE03R2FlNDE1RjVEYVM3aDJUUFRSQ3VEV2JscHp1dFJP?=
 =?utf-8?B?aFZ0SmNqeXZ3NjBWSm94dVIrMWkrYyt4RDhlcEVmVDBxUjNLejd4TllzMEd3?=
 =?utf-8?B?SEFRRjE0VXJNcWxMUWRwUmlCSmVaZjlrbHB3WXJlMEY5SGt2aVFmTnJneHVj?=
 =?utf-8?B?SnBuQjcyU1dyVnJPVHJ1RHhRNWVySU82N3I0dCtXZC9JaHlqSE5xMmJmN1Jp?=
 =?utf-8?B?QlhxUG1yRG52b2lWSXpRUE0xNHlwUUFkOU1IOS9hZlFaMjJWUFFUTW1ZVVhu?=
 =?utf-8?B?MVpIaytiMzFmOEJMR0FKcU9DUmhHNFlQNWZMcHI1ZWpkN1V5dFljOWZFVWl4?=
 =?utf-8?B?aXVhY2RjekNXWTFRTDNNUWlpdU1xVXdkU0d3aHVrdWVzZi9aT25qRndEN3p1?=
 =?utf-8?B?bW0rQWN2NmR1ZHNiSjdEN3JTVWxsRUNVdGd0U3JTT3YzcGZhTE41cndXTzhj?=
 =?utf-8?B?MXRxKzN1eEo0elJkeFNjTzRQVkFpSklPRldCTnU5RDFwSE04bnhSVzVTbjMz?=
 =?utf-8?B?WnhwN0JOc3VHZVZtQ09LcVBvQzBlVkJIQ2xtNTBUMzdBSGFGaTF1dWJldFFT?=
 =?utf-8?Q?bl/t2ffd5XyfNlHWKCBy+EB2BFLVbf2b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckVnSjBKQXNJS0NQVmc5dFV3UmdkL3E0WGhaOU9vRlhUTTI4OUlrTHp6d2lr?=
 =?utf-8?B?LzdhZGJxcXlBOTh5WHc5V3ppTmVvYlppcUNZWFgyT0taUCtqY3dEUDMzMFBC?=
 =?utf-8?B?TnhLN0JBWmJnQzFqeHp5Ri9HZm9lU2FvU2MwanhUTWpvQlZ0OFdydi9tRmtQ?=
 =?utf-8?B?SktHdEZ1Z0UveDhtcHRXQTlGd0pOK3I2cFV2V2pxQytBMURxamZLS2p4SjB0?=
 =?utf-8?B?bDBpVmZLaURSc0VvWVVNUjlsRGdMWDR6bE5rQ3VyN01yT2I3c3NnV0NZL3Mz?=
 =?utf-8?B?Wi9XQ21sVXRTUTZVSG9TR1pWQzNLVmQyZS9BVldLWHVhQ1docEppRkJ2WCt2?=
 =?utf-8?B?ZHBvSWRweDh2ZlZ0cFJBeVM3M1BLZGRidHpJTmcyVWpqMTNYbnRNY09nemN4?=
 =?utf-8?B?SG1LSHlZeHR2NVEwNU5COVh6STFnTEUzZTVCcTZTMFk2UUJNbnM0Rm9jM2g2?=
 =?utf-8?B?WEEzaWxqc3V0clNRZndmRVJpSlpLbTFNNmoybXMxOUpSY2JmcmhJRFc3WkFU?=
 =?utf-8?B?aWtYZzNSVm8vTzRBU2RIdVBYNThobVpTOFFiaGgyL3gvOWR3YjdHbzhIZDdP?=
 =?utf-8?B?SGpaR0JBSkk4V2c3V01RMHZMSGZZc2NvZktzcVg0elhVZ2oxZHY5cmlsSXFH?=
 =?utf-8?B?TUhZYmJzblg3anduWW96d2pkb1RPV3VBQ1RueTdpejJWWUlMTktENTJTL1V1?=
 =?utf-8?B?c0dwc3ZjMlJDQlc1Z2NxZEd3K0MwYjAxVE9IdjNzNEdmNTZ1bnlodEFJTDcv?=
 =?utf-8?B?UWlEM3d1ei9PdWdoMkgzSGYvU2diZlVHRlJKTnpSNHErTFlQQ3ZmSlo3dFMr?=
 =?utf-8?B?azRkckIrZHJZNHpROVB6dElQKzJ6Nm5CbGl2N0I1NXlKVzF2WUorSlZZWUM4?=
 =?utf-8?B?T2lteCs3Mk83S2JGNGtxc3BrUklOVlp0amhkQ0dQSHFuVWllUmZnVXdmYURV?=
 =?utf-8?B?YlN3a2tya1FROFVYKy9vUWlYZGFUTkg2RmsrOGdVY2trdGRQQ1llUklOWGR3?=
 =?utf-8?B?SjhjT0loU0ZkUzMreTdQQ3RieHJucWQxeUxhTlk2S013ZTNIUDJWT1ZCTCtZ?=
 =?utf-8?B?RE54ZTJIVDl3TmZQekFtM0hYWEx4RUZlb3FKczBHcGE0MC9qV2N2SytuQURU?=
 =?utf-8?B?Q29uUWtDb0J3cjFmcytrTkJpU0w4anRPZnB0Ykl6K00xanFJVDd4a0xNZksy?=
 =?utf-8?B?YlJJeUtidkJETVBxTERRTE9FM2lNeU9Zd012K1NFN0RlM2pCcjF3OXJMZWda?=
 =?utf-8?B?YWVkZFNIZXQxaUg3Z2Rud1Q4bzZyNXZnSXlHVTY3YzNzMFZHZ2VsY2JjS3hp?=
 =?utf-8?B?Nks1K1V5ak10bW1ZMHZRaXl1bFhsTnhuamlMQnhjeW5VYi92Y3VNcGxEWWNp?=
 =?utf-8?B?TERWZzJVcjYyMmdoZTFIazZoaWJqaWVLa0pwZHVYdmpFcWNkcUZmMlhsNnRK?=
 =?utf-8?B?SEVtR0xtR3FkSlJsaEM1eVB0dldvZmJpaVdVVm9MV2Q4N0hQVEVSWUo0elFW?=
 =?utf-8?B?YnZNdDBkVzlXYWlkRS9mdUMxT24zd2FjQkJoU3crSFVmOU0vdm9ZaVFPb2tW?=
 =?utf-8?B?enFyUTFmd0lacEFLY1NLWmVaNUxhYmo2ZitBZ0lvQzE0aU5GRTJobm5RS0Mx?=
 =?utf-8?B?M0Vqa2dxbG9wWFI1dE1VOVFvRWdYSXA1N29talJld1JFU3NnblRBajBycGpa?=
 =?utf-8?B?OW5mYWZZUkVUeGlOdWp0WVpmU1l3Rk0zZHpoZGNuVUErVndzUzRlZXYwWmdv?=
 =?utf-8?B?RXUyU2xGa0lDa2R2aCtWZ0tSSERUSEdWYlpoM3pLYzZUZ3NUaEFqMURZUkFj?=
 =?utf-8?B?US9HZXVDaUFSbEtjcUhSK3V6M3JCQk94Z0tBaGF4dkg2bzh3VTRqSHFjbEtC?=
 =?utf-8?B?OXh2dmJBOGFYS1hJVG1sMXJaZGZ2QXpIdkZ4MlFrYXpvT1dOcWk1WDJ6L3FH?=
 =?utf-8?B?RUFxSnNuMy8yZC9mR1E0QjEzdVpCV3l6Z3RQTnh1enk3a0N6MG5Rc212a21k?=
 =?utf-8?B?bFU0UnlIdFgwOGV6WS8yendSK2t4TGVWN1RRZ2ZBZ0lmd1gySFpqN0hCVkho?=
 =?utf-8?B?dURkbkVhdHpaa3N6MmxrcU9qVGNnc1F5MWNoeCt1T01UenVLUE1kdHZEL0tN?=
 =?utf-8?B?bVNnTVhrQnVBTk1kdDN5Rzdpb0lJS2ZPNUlvMzJaM1FaWjVhWlJoVVhiNzRT?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 247bf24c-4c44-44e8-ed86-08de22bd97a0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 14:04:42.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvipHxlQiDPRxrggpS3MRQWNwvH07BxURqS5rkQn6WMTlxwOm/Gc0mVAKtzvmj5nxz4Rj8IWhLFL2A/nsvs2QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
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

Quoting Matt Roper (2025-11-10 20:20:32-03:00)
>Convert device code to use scope-based forcewake and runtime PM.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_device.c | 33 +++++++++++----------------------
> 1 file changed, 11 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device=
.c
>index c7d373c70f0f..1197f914ef77 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -166,7 +166,7 @@ static void xe_file_close(struct drm_device *dev, stru=
ct drm_file *file)
>         struct xe_exec_queue *q;
>         unsigned long idx;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>=20
>         /*
>          * No need for exec_queue.lock here as there is no contention for=
 it
>@@ -184,8 +184,6 @@ static void xe_file_close(struct drm_device *dev, stru=
ct drm_file *file)
>                 xe_vm_close_and_put(vm);
>=20
>         xe_file_put(xef);
>-
>-        xe_pm_runtime_put(xe);
> }
>=20
> static const struct drm_ioctl_desc xe_ioctls[] =3D {
>@@ -220,10 +218,10 @@ static long xe_drm_ioctl(struct file *file, unsigned=
 int cmd, unsigned long arg)
>         if (xe_device_wedged(xe))
>                 return -ECANCELED;
>=20
>-        ret =3D xe_pm_runtime_get_ioctl(xe);
>+        ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
>+        ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
>         if (ret >=3D 0)
>                 ret =3D drm_ioctl(file, cmd, arg);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret;
> }
>@@ -238,10 +236,10 @@ static long xe_drm_compat_ioctl(struct file *file, u=
nsigned int cmd, unsigned lo
>         if (xe_device_wedged(xe))
>                 return -ECANCELED;
>=20
>-        ret =3D xe_pm_runtime_get_ioctl(xe);
>+        ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
>+        ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
>         if (ret >=3D 0)
>                 ret =3D drm_compat_ioctl(file, cmd, arg);
>-        xe_pm_runtime_put(xe);
>=20
>         return ret;
> }
>@@ -775,7 +773,6 @@ ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /=
* See xe_pci_probe() */
> static int probe_has_flat_ccs(struct xe_device *xe)
> {
>         struct xe_gt *gt;
>-        unsigned int fw_ref;
>         u32 reg;
>=20
>         /* Always enabled/disabled, no runtime check to do */
>@@ -786,8 +783,8 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>         if (!gt)
>                 return 0;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return -ETIMEDOUT;
>=20
>         reg =3D xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LO=
WER);
>@@ -797,8 +794,6 @@ static int probe_has_flat_ccs(struct xe_device *xe)
>                 drm_dbg(&xe->drm,
>                         "Flat CCS has been disabled in bios, May lead to =
performance impact");
>=20
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-
>         return 0;
> }
>=20
>@@ -1034,7 +1029,6 @@ void xe_device_wmb(struct xe_device *xe)
>  */
> static void tdf_request_sync(struct xe_device *xe)
> {
>-        unsigned int fw_ref;
>         struct xe_gt *gt;
>         u8 id;
>=20
>@@ -1042,8 +1036,8 @@ static void tdf_request_sync(struct xe_device *xe)
>                 if (xe_gt_is_media_type(gt))
>                         continue;
>=20
>-                fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-                if (!fw_ref)
>+                CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+                if (!fw_ref.domains)
>                         return;
>=20
>                 xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_=
REQUEST);
>@@ -1058,15 +1052,12 @@ static void tdf_request_sync(struct xe_device *xe)
>                 if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLU=
SH_REQUEST, 0,
>                                    150, NULL, false))
>                         xe_gt_err_once(gt, "TD flush timeout\n");
>-
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>         }
> }
>=20
> void xe_device_l2_flush(struct xe_device *xe)
> {
>         struct xe_gt *gt;
>-        unsigned int fw_ref;
>=20
>         gt =3D xe_root_mmio_gt(xe);
>         if (!gt)
>@@ -1075,8 +1066,8 @@ void xe_device_l2_flush(struct xe_device *xe)
>         if (!XE_GT_WA(gt, 16023588340))
>                 return;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        if (!fw_ref)
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        if (!fw_ref.domains)
>                 return;
>=20
>         spin_lock(&gt->global_invl_lock);
>@@ -1086,8 +1077,6 @@ void xe_device_l2_flush(struct xe_device *xe)
>                 xe_gt_err_once(gt, "Global invalidation timeout\n");
>=20
>         spin_unlock(&gt->global_invl_lock);
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> /**
>--=20
>2.51.1
>
