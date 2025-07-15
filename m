Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19383C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 07:02:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EDF10E529;
	Tue, 15 Jul 2025 07:02:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnJ832sw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0C10E526
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 07:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752562963; x=1784098963;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=swkfvJRaegYusypjvVLaTvknwt1LetXBk97I439lqXY=;
 b=RnJ832swmRN0VSlWIPhohHRO3rOOnUtoLBgbRGCOYx54u7CIe3GiTq6D
 BGDPJhjDeEXCk5JC97vqw4O3Z0NpS5uT5dJhKqQVdfaIXoqJWdD7JSGjG
 P2jpfdkJNKzdNd4l+hXjqUASRg3VGqAKvP9Vj6KrI4wxXdwsblFPu2M7i
 JgLefR6FTgwsdDXqDjgrIVi0x1tj4imBLSIOxzaDid2mVlpzZxBzZ8fH8
 /EhZ14IReU37KqpZ8blp6cHg2OSVv9FKMkB6B5oVOm6l6+effEZEFlXW1
 jN2VGFwqNqDXVt/ucvuBLxjQCdXHzUHvt4naU77tmh0lHZRLYN7/AieiA g==;
X-CSE-ConnectionGUID: B4XCGV0WQN65WYrQ8FtilA==
X-CSE-MsgGUID: L5BnIZsQQAOQywsbR1grog==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72220833"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="72220833"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:02:42 -0700
X-CSE-ConnectionGUID: l1sJYZ47SpWvOftmwydTVQ==
X-CSE-MsgGUID: XW5zb24MSaG0OYHncAmfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161166744"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:02:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 00:02:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 00:02:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 00:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bK55g8VFl2ZFCRQYcqKAhmtg3ACwSeR41dQEY3qrKxxXp9pXsSUhK4ZHJYqvYMrxUt6p1U/nlw6bAVwbMLe/GfziFpMJ/p37xuBUZpN6CT7JKKhBXp8e2jsZuI+PlMk1FfmhyB/jkU/S3a9lSXZfiG0mpkiEoTjWdkFuAbAQHCWkBWqPqXd9jB/skLIxPiljPg9dXeFqUKMbuarjAPSTzr9/uF8X2QF0p89M/e2GWnuQIyDl2h69Qgdm2kpUXXxqbOdENnRA0cwpiq5Fvsj6P4LXAytzXEfoQlSbvt2QxsVaXiE4299fldNlG2i36GXixZBPRGt1Orwm+s0ondAJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sk3pAxYXCoSdCU6RhPGXjU7Pp/TQwCpiZPegqfA/Bz4=;
 b=iRWfAe9e7MEPAa8KwitNVvzFjL/OpW2LqcrvJUBm307GxkdnW3NX5+KuKrSgSCv2uFPyYEnZprXFMEHbmGa74ZrvWOig0BQuWQu6hw1mcmKa7cZPsi845PRmr2nn/luIf4Ey3aQN/QxAlygHu7H8Z7SdwQC780JcW5MwblpMoZD5AMOsh1Rjt+L5a40h7YOh+jgZfS/epGS8uXHJsQwAxK2VwKgdMLZ5gB+0u+DbfhY49Az4BuPYaw9HvgWGvSoqM1Xeygum5pfnETna/nrxite+4L3zsRqM/b42LJrGtmVla/4rPSH2zL/B6q/hbBvVN68MbCllKzQymZIPln/iNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by SJ5PPF2F2B659FE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 07:02:35 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%4]) with mapi id 15.20.8857.025; Tue, 15 Jul 2025
 07:02:35 +0000
Date: Tue, 15 Jul 2025 09:02:32 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/6] drm/xe/pf: Resend PF provisioning after GT reset
Message-ID: <20250715070232.qipufdchftdyyt3k@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
 <20250711193316.1920-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711193316.1920-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2PR04CA0255.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::20) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|SJ5PPF2F2B659FE:EE_
X-MS-Office365-Filtering-Correlation-Id: b6670e5f-a518-4c69-121b-08ddc36d939f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUNTKzVhaW50cHRMQ05MQWJRN01HcFRpQyszaVVLdEZiN201bTRZb2VKZHhj?=
 =?utf-8?B?SzVTWUZLZE8xL2lKdXpKUTV4RTVSYzF6VDg5R3YyV2dFSFlRNE9oTUtqZmNH?=
 =?utf-8?B?dGJlWUZuaE9zd0pFVGxQcXVxM29HdUtsZVFFMEswWkEySldHVUJDTlgzNWdC?=
 =?utf-8?B?d2RJT1FNdmw0VHV0elU1TlJkcGxLRzJUUUV1TmdnOHVRRFFvSThFV0YxR0o0?=
 =?utf-8?B?V0UyWjYyN3AvaGw0cWhsVFRIRHlDRE9mUi9EWnQybVh5RVhMZlF5K1ZDaDlr?=
 =?utf-8?B?anhrOFFLdnV2K3ZoRy8yQVJpa3hTRjNLR1YwUk5mWkVtS25qQ3FyUERnMXJR?=
 =?utf-8?B?eG1GcWp1NGJZY0FVN3A1YjZkVXJOaXJONnBzL0xPQVlaVGVISTRzbnRFM21w?=
 =?utf-8?B?MGl0NmFPc0tnQzdYQUFhZmNRV0g0VlFpak5XNDZLaEQyZ2p4UUlpT0dyVHRK?=
 =?utf-8?B?ckFFc1hsZjFrNFFlYnNVdWMxTzlTVjgzVTRCVEhTdnMyTGN2MytFb0tlMG5K?=
 =?utf-8?B?ZFV2SVJic29xQ2tWMFo1QTFUdmk1RHZoUDUyTnB6RzJ0YWk0SkR1OWoyQXBu?=
 =?utf-8?B?YlBGaStVV1d3WGV0cXNsejkvWnJzQUVoL2tQZUd1Q3QyZVA1MHcrSnNjYnM5?=
 =?utf-8?B?MlRKaDdOeWJqMS94cWcveXFDWGpnTXZsWHlmeU5wVFN1NEIvVWFQTys3L3BJ?=
 =?utf-8?B?TVJjUTU1N052aGIvdXUrMGFDNjgxc2lUK0s4eCtpQVhqQXR4eGNNV1JYU25J?=
 =?utf-8?B?Y1IxbGRMd3dEL21wSVd6dHpHMzh2OVV0UEh6RkJXaFdyVFlJV3BmUS9tT292?=
 =?utf-8?B?N2hhZWJpK0xzNHk1VGRiZklVRnhrMTNES3ZIYlBWQThRQkdWV2FtV1FIc0dt?=
 =?utf-8?B?VHdHZzI1S3p3NG5oRFdoOTc2UXEyUlRBeU5GdWd0QXBCMGVFWFVSaEgzMExy?=
 =?utf-8?B?MVFZNmd3QlN6Z1FjaVl6bjI4RXpMMUUxbysxY2kyS3ZGLzZUWjJPaXJXbERu?=
 =?utf-8?B?VW9iRXhHSkxsQy9UUkJXRldpTzdzVUEzSWR2LzFsNGp2enBBYUpOMnFid2tS?=
 =?utf-8?B?eVg3ZHNzTkNvcVJRaFlvTnd2NVV4RHZxUThabnJBTERaeFNxaUQ4cEU0VGw0?=
 =?utf-8?B?TDVtdnByUEhnOWF3aWVmZ1JFQnRMejdFUEhlWVd2QkYzNWFYWXRwdlh5RWFY?=
 =?utf-8?B?a1VhY3V6RGNwUnpWOXNvVTQvNTQ4L243TG54Ly9ZMTd3dnptcE8yTjk3cDk5?=
 =?utf-8?B?VEIzdGJSc21VS1RsUFBEMkpVNm5iVFgwd3dvMEFudWFqWkhtamJJd1BJamtn?=
 =?utf-8?B?a0U3ZnpsdDljbWlXR25jQUxNekZUNnNWblNOMEhsWVpUaUR5TDhCRFpaOWhX?=
 =?utf-8?B?Y21qM1U4MU9PQXl0UDMyQzZlMzU1T2FKSmRZU1VsMTZCSUlSL2ErMk9MbnNt?=
 =?utf-8?B?ZzhpOXJZbmpLRXNNcnIrQXZoNE10ejVBVERXcldZbFZ3dmpHU2p1cDdXRkwv?=
 =?utf-8?B?UHdXYWNqcEMxVTViOExXNHFIc3JDTitCZjJzYytCa2FvTFBLd0drTFQ3M0lt?=
 =?utf-8?B?MHNHU0VEa1Rkc3VjRHZnVFpxWnEvSXBBTHZQZnQ4SEQwSzF1aWI2bjNYTTFH?=
 =?utf-8?B?cnFNcjVHVjR2aGZ1N3kxcDFVdjFIMnZEcmtiY2F6c3RpdjRjNW9JZC9Ocko2?=
 =?utf-8?B?M3JyS21lMDltVG55Q2tRSmwrYStkTGN3aUFqNU1NVzRFTGxQRkxHU2ZlbUNm?=
 =?utf-8?B?M1pYc05IS3VOMkVHalVYTVNGQnN5QXNuZFNTZURUSEtHMjR2TlAzOG8xbU40?=
 =?utf-8?B?RXkra3F2cGFXODkwWWVyRCtUT0JERkVISDk4TEVLbUVId3MrV3p5RVhVZnVi?=
 =?utf-8?B?VTNOSTc5VWVrUnFJZVlReDF0V082eXJnTUlHSjA5MFpkUlNCRm9WVlFLRzlH?=
 =?utf-8?Q?HFunNsHEzDM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODMxY0VXNWdVdHJ3YUFJQTl4dm9QNnZwa0lsSzc2QndqTHRubm9mT1E3Wk9r?=
 =?utf-8?B?QjVFTTllWTI0ODk1ajJuZUhibzM3V2dlbDFWNHVGQS9CT3hVb2tJa21YS09u?=
 =?utf-8?B?SDAvOTFSQjJLV09ERUdIN2Jsa2pqbE9QZFBsb0lHMThUYnlwWmxKUURBMTR4?=
 =?utf-8?B?QUZFSVNXNWtZSHFnV2xEUVZxemQ4dFhqUVV1VHdCYk5mdFIxeDdhc2lkd0VU?=
 =?utf-8?B?V0dFdDB5V3F6ZXcyZk5ZMy9WcmNMQzNsVTR3UW9zTjNkNm9MYlFoZHFjOXVW?=
 =?utf-8?B?OW92MVFSaWZ2bXJSZWNTdUx3aWVxaVR3OWtkcUw3UjlEN3hXZXN5YWtyaFNY?=
 =?utf-8?B?YWovL3dHS1dDT1g1ZU14K1NmUldJT2pjQW5PQ3hlUmE2dTNsdWYwdGtZcjBP?=
 =?utf-8?B?M3oxOEFzTVgwY01NdFlRTlBZSkV2MUU2OUtQeHB1ZXdOaUxHTFp6STlEVkht?=
 =?utf-8?B?dk1DaTRKU1FJdVQ3WDE3d0dON3piMUhkL3dadkRWZXIzVHRBNnpqMnhYeXVo?=
 =?utf-8?B?bjFxdzVuc2Z6ZlZWM0dtdHRxbW9Mb21aU05xd0ZEY0lGV2hPZ1lGUTB1dGRa?=
 =?utf-8?B?N3UyUFpGRkJxTW9zaG1ZM1JGbWpMcDlaSUZxTnVSWkgvQkhlSmpZajlKUzVS?=
 =?utf-8?B?OW14K1lmT3l4ekx4Si9JSm9uU0Y4bSs5dnpYbGdCV3lOV2RIRkhGa3BIM1Y5?=
 =?utf-8?B?T21RQ1Z3cllNRWxvdEE3ZmJZd3kxQ1hZM3hIdEpoVGVISDlzNjgyOEJLWS9k?=
 =?utf-8?B?VlAzbDZZd29EUGF3UnlvbXFRYU1uQkpucEttZ3ZvSHBxRDNLaWtiSHBabTNG?=
 =?utf-8?B?cWNYNjVyVU84MEMwVEpqa2doK1pBMENOeGN5ZEVDZVN0alNDbTI2N0hiTTMw?=
 =?utf-8?B?NVBNcktNQnBxRDRsL2VlYlZzUXdFdXd0UDluRG4xOFBJUHdIUld4dXg1MW96?=
 =?utf-8?B?N2oyTUQyd3NERnBOb01MVklQOCszMjNPclMwdDAxaHFtYlVUYmJLa01QWFh6?=
 =?utf-8?B?ZEhneVYzUGtNaDNCL2I5V3NUNjVKeVo4UHVJemthWDFrcDBZYzRjTmFTQldN?=
 =?utf-8?B?c0gvTnJQRnVTOFpiZlc2bEpvMTBtV1lPUTM0Q3gvYm5ZZk0xaTlGSFg5aWtG?=
 =?utf-8?B?YUFWbHdYR3JhTFNzZTBNWG1sREM3Unl1N3Roa2NRK2tVWUVkTUFJQ2FCRGJ2?=
 =?utf-8?B?NmRhVjdkb0QyZThMMU9RZ2VEV2JuendyN0RUdVlwRVNGUWd4MzM4QzA4VGY5?=
 =?utf-8?B?WlFKYXRkSHBSWlc3dzd0aXVROHBudkg0bEtLMEF1blpvVkQ0Yi9UcHU4c0hT?=
 =?utf-8?B?RGw0dTZOdmhmWnNBNE1lMUg2L2VCdFREQXlCOTlIL2taNVJuRStUOTRxV1Bs?=
 =?utf-8?B?cThNamwwMlQrblZLKysvenE0WTBpTTAwMXN0YjRyK3V0L3BRTEdoejh1NVNx?=
 =?utf-8?B?R3JCVDhUOE1hdFMvWUZFZXVtbHl6NG16N2tld1diSnBjd1U3cnMxTlNOKzBW?=
 =?utf-8?B?cXJmT2svT25nVjZXR3pHWnIxQnBYaGM4MEJiRWpOaGJTblByT290YWVlVkN6?=
 =?utf-8?B?RWtHTW9CUW54U25ZemNyNmlMMEhDRkNWN3pjQmZyVjVLSVdOcHgyN1NrV1p0?=
 =?utf-8?B?YUEwbVd6amJSOThueXZiMS9sS2hTalBnVTAxeGFDUzlmeno3MGh2N3R3OWlF?=
 =?utf-8?B?MjVOS3RyTEV4cW1yYXMrYnQwQWw2alVXREduam1UQ3VGcW5qcTNZQmNkci9P?=
 =?utf-8?B?bi8rN3Jhdk1kQkVlSldnRktFbktiY01vODh6bkM5Sk9ZQW5SOHBPUTFTaHBP?=
 =?utf-8?B?TUl6ZkxGMHg3T0o2c2NnMzZOb0pFNWtsVC9VdzI2c3FKVklNWjh1SHNuYWpv?=
 =?utf-8?B?dzhzN2RNZkxhUXR0Njh3SENKYlJYWkxnbFQ2b2xkbXZGTjNEbllmdlI4VENk?=
 =?utf-8?B?Qzdycm1Qc0RuYVBnNFIzbytWanZxMENINStwUS9CL3lPRTFHanUyKzJpMXox?=
 =?utf-8?B?QldsNVdCTWtnVms0VEZMb204RStWMVlmSEc3N2JQWUhjSWtzWU5KeGhRaGQx?=
 =?utf-8?B?YVJJa3lMdHk3emREak82K1ZEYk5FOFlvKzRWMVVpVkZMakZ2cFN4SlRSa2ZC?=
 =?utf-8?B?eENhL0ZQeFpvTlFoQTBJTWtyeHZsaWh0dk5aVW44UlpxQjRRRXJxdUY4WFNo?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6670e5f-a518-4c69-121b-08ddc36d939f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:02:35.3671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWJ8bqIgxtj/fnPPVUrk0zGyCyLMV03exufp//vL1eb+5Nr+rBIrsRC+SuQDxZVpnZWuHe4ZqROC900ZHHCyDXF9PjAGesXEsmbYAbNjjtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F2B659FE
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-lip-11 21:33:12 +0200]:
> If we reload the GuC due to suspend/resume or GT reset then we
> have to resend not only any VFs provisioning data, but also PF
> configuration, like scheduling parameters (EQ, PT), as otherwise
> GuC will continue to use default values.
> 
> Fixes: 411220808cee ("drm/xe/pf: Restart VFs provisioning after GT reset")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index d0cf1d80be07..e84fd44c6598 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -2366,6 +2366,21 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  	return err;
>  }
>  
> +static int pf_push_self_config(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = pf_push_full_vf_config(gt, PFID);
> +	if (err) {
> +		xe_gt_sriov_err(gt, "Failed to push self configuration (%pe)\n",
> +				ERR_PTR(err));
> +		return err;
> +	}
> +
> +	xe_gt_sriov_dbg_verbose(gt, "self configuration completed\n");
> +	return 0;
> +}
> +
>  static void fini_config(void *arg)
>  {
>  	struct xe_gt *gt = arg;
> @@ -2389,9 +2404,17 @@ static void fini_config(void *arg)
>  int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>  
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	err = pf_push_self_config(gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
> +	if (err)
> +		return err;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, fini_config, gt);
>  }
>  
> @@ -2409,6 +2432,10 @@ void xe_gt_sriov_pf_config_restart(struct xe_gt *gt)
>  	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(gt_to_xe(gt));
>  	unsigned int fail = 0, skip = 0;
>  
> +	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	pf_push_self_config(gt);
> +	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
> +
>  	for (n = 1; n <= total_vfs; n++) {
>  		if (xe_gt_sriov_pf_config_is_empty(gt, n))
>  			skip++;

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
