Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B968CF9C72
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 17:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCF410E78C;
	Thu, 20 Nov 2025 17:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpPY7ADr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7097E10E78C
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 17:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763658373; x=1795194373;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oJfBzFc2aNi9JFQnQcsLgQ99VR2ABv0P6o1tA+4jngg=;
 b=fpPY7ADr3SxVJTTEmuHixRVh87uoOHuWeQmgM5Zl59js6CE8pA/EXPco
 wObeDkxx9v6cYrsfk1M/9TX8DQBpAIsz1T7U6L/LVQMcQOLhvvPsrMSvh
 ymTw7hRGDO5jLbPCkib4a62sF/io5qEYGOmvXK5z8xOVmYcgFYeFoZmD5
 O3FgDRKG+30GSTQXjzlx9pwLT/yPOI/t9HrRcvf8I1/o2jioRucVgTGEP
 gMJE99RdJPgxSb6qPz1F5SBrBr/xTuDa1HWQKfO6RJBirycSNlb1auxMW
 D85qVOB3XzWdN+YfgO+fseYVD3jRIqSeiOLjl7tlsqAKWvrd++fhSo4Iu w==;
X-CSE-ConnectionGUID: gZEsADqkT9mOlQUpgb0y1Q==
X-CSE-MsgGUID: vZ0nARXTQTq1ToZuZDOuLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65899502"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="65899502"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:06:13 -0800
X-CSE-ConnectionGUID: NbSCcvVQSoavkZydGrE8TQ==
X-CSE-MsgGUID: qb77A2tMRyyRhljmvKfd/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="191536620"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 09:06:13 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:06:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 09:06:12 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 09:06:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y59St8+aigKyTMLRIKkhp04jJn3J/Bns1rcF4tiL/ZWUj3YnVW23KpAz3YnQilGc6xflz0kffEBjYRSZfDb9vM4fsKMWLnC2ThyJX15zOpOJUo3asg/vG8oCzwjte4/kQenzTOk0tYN4r+6rge+xijixq0qYOT7PddexLLABYuj4Ig6epGbJ+kZsWbpI13EjT5FWL+kDmlGqMMOy3zKeHaT8QIXTzGyC2jwn6i+6g3fniODkTnS6FnT1DHM8YFybHdlIrGkwLEWvuY8shyqnINkyJPcRTONxXTJ/YMf/Pu+dNEgiSFc+rgWJSf2baye+GJouyXeJ4L/ffeLg8iLiMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJfBzFc2aNi9JFQnQcsLgQ99VR2ABv0P6o1tA+4jngg=;
 b=e8Gct2iFJfPYDu/T/vcMmutokBudSU+YOCiI9wH9+9RlWPRgcjVaPe+VYtQyIxh80BG5MFoSb4RPbVYSfeiRL+I34UKPwo0Cmr9gZ9row297XSsc2tqvBnp0La/WPzaLGgeulTjeniKvaKZILHyc6FzIvEm8SkJCnAiiu4wZVSsuA/VwuACbXXRyOu59BnhGQjrVCyE3GlS7P7SaR6GAEURb9AqPKwlds4V8u+/Hfwzd14SI2bDAx/CFGjKHnhFcOAoRnadSPMgi5qEg9rUmdV/0ZXmuXL9DaXoake2tWpWvg3h3ubisuMrSCU3b7zrD4hptrXgcjvI8ShaIMRw0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 17:06:09 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 17:06:09 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>
Subject: RE: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Topic: [PATCH] drm/xe: Fix freq kobject leak on sysfs_create_files
 failure
Thread-Index: AQHcVanIoKWwzmlsB0aVFmUAL6mbDLTysPMAgAAGuICACRxqoA==
Date: Thu, 20 Nov 2025 17:06:09 +0000
Message-ID: <DM4PR11MB5456BD0C7F53EA04DDC248D4EAD4A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251114205638.2184529-2-shuicheng.lin@intel.com>
 <SA3PR11MB804611CDBF833093BEDBB0DF86CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
 <SA3PR11MB80467A0A5FC550D0F8FDD87786CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
In-Reply-To: <SA3PR11MB80467A0A5FC550D0F8FDD87786CAA@SA3PR11MB8046.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB4776:EE_
x-ms-office365-filtering-correlation-id: 0c87cab3-81fc-474e-e98e-08de285719d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Y1dIR3VwdzFQZmNWM0xBeW16RVhmT3NyRHhOSUY3U3VWOGl3K3ZuRXlyVmVJ?=
 =?utf-8?B?RHJvRDFSVlZ0N0pYY2dvR25OSnJPRXdiYmhWckZhd0hXSjFKcHNvVmI0N202?=
 =?utf-8?B?U29lVVlnWHZtNUwwZFcrcEl5bWhUbHZ6K3djU3dldThqb25lTlVIV0NTODdB?=
 =?utf-8?B?WDJ3QmVNZU9wZXpvTTFGdEtEeksyUkRVOVFLWFZOZ2RSRnNPTUt3VWY1ZUdN?=
 =?utf-8?B?eFRQd3k5RlJoVkJaeWdMdnlWbkp5LzdLOEg2WEJkU1JtYkIvN1pqdGdrVlJF?=
 =?utf-8?B?RnlvVXhGeGxaYzdzVzBkdGFLMUVIN3QyTEFVbWdSSVN2aDREVTBwOWRFaHNB?=
 =?utf-8?B?bjRXTjZHV0h1S3psRTNJMnF5YjF2YkZUTkJwNFp2TGxTZDJ3VnRiV000ODFl?=
 =?utf-8?B?MXNpQkkzUlVkZ2JPN0w3NXZFR2ZMWGhURXkzN3ZGZ1laVFF0M1NabS9UaVNG?=
 =?utf-8?B?YU5GNUpMbmpjM2djeWhqeGlmSmRvNXNoYmRWQ0FoL0pvckJ0RVJGNmRoSkJr?=
 =?utf-8?B?RDh3ZjQ2ZnBwUFZHYis1dlVOb2VUTXVIZzNkTC85UDgxSlNkb05Wb3dETytE?=
 =?utf-8?B?Y1VkNXIwaTFtSEM4L2Z6WThtWnVUUXlkcFg3L3o1QXg3Q3doZkxKdXJZdmd2?=
 =?utf-8?B?OFRCQVlqMWVJK3ZEdE4zYUMxVFR0VkVVMHduR2FQQUdycU5ldCtJamxWQVlC?=
 =?utf-8?B?dG12T1dlZGZLazRoYUsvdGlPRkQ2V2gvOTZKaC83S1o5dkoyaHM1MG4xYlNu?=
 =?utf-8?B?WXRmY3J6OUlPWmMxNTNBWGhHNncyYWY1enJsQmZFKzNKdmp1MDNCMDQ2Vm1n?=
 =?utf-8?B?MW8yN2dVUlNqQStrZW0rKzdTUHpOTlhrdjdBc3lWODgvQWc5UHl1Z2pkcnF4?=
 =?utf-8?B?N2o4eFFHTkVMa3pxelltVEhWZ2xsQXhmbERIcENkQ1BOUDRadHRWbTdsLzhW?=
 =?utf-8?B?Y0RsdndtUFZkZ0N6M0NoQUVTTDd4TkpPOHBGWkFPbzBWTWkwSkl0WUlwaHpx?=
 =?utf-8?B?bUcwRG95MEhYRGw3aldBaTFCMXdLVnREclpXRmZMbkNBdzRSc0Q5Z0o3R1JK?=
 =?utf-8?B?YjBUMDVJbkpBVWxTYVFIMGNxanRuYnJIc0RoZ2tyV01KWTV2QmRBbnZhbVNO?=
 =?utf-8?B?WUVjakpNQmZjL3I4WFA0a2FoNUVLOWRKUnIra1hTZDl2Z2FiUmpZTjh5Nmlx?=
 =?utf-8?B?S0dKbWxkY2dUY3ZaVE5kQm5SeWU3MjJPeXlCV2xlcDBCcmx4ZTQrSUpaOFJx?=
 =?utf-8?B?d1UySHJ0cktFR2tid1JjMm5RdVpNbk9IYkQ1YzJ0TzRIL0luYUNmd254WVVr?=
 =?utf-8?B?NFZBWU9yZDNIZ1dabEY2OHJsWWJWRDVobXhRd2FzY1BiZk1Ydm9hY3VlaklQ?=
 =?utf-8?B?TWtjR2FaZG92OXhhWlViVXVHb2ozMFlyMG5VbENjM0EvczVvWVVaQk96VFN0?=
 =?utf-8?B?cldYM3ozaG01KzhnNlJDRkFHYW16bkk2YmwxMnVpNkREa1ZTd2VGSlFia1Zy?=
 =?utf-8?B?MVFpSVkwWkZrOXgzYUUxT25kMEcycGxkQ3psOGhXY0hiWGlaZnB2bEw5Vklj?=
 =?utf-8?B?cnhIK25jOHFYN28zc1R4WGV1YjljQzM5NC9Xd29BVWgwbnBWbTQ5NENaVlF3?=
 =?utf-8?B?S0hsZW9ldXc2S2NoM2ZVeE9KZ3B3aGNRUlNLRnJudEw3bG4xbUFnWE9uMW5r?=
 =?utf-8?B?OTB4Tzl1WkpNTDNXM0FUSnNYTlErZ0l3cEoyT2duVmdibVB0aGpFT3djSWdh?=
 =?utf-8?B?ZjFDRFlvRCtuS3NNRVpNaUt1UDB2S284aEZMRVVjN3RjeE9tN1JubE5BLzZr?=
 =?utf-8?B?NU1uT3JYTDNFTTRiR010U0hHdExON3k4cUpSZ1phek1xSkxPTWo5Q1JxMHdk?=
 =?utf-8?B?ekQvcVNoUlRvMTRjV0FCcGkyZTUyeFNFSFJaTlNMTmlCSUdCdGdVdXNTekNw?=
 =?utf-8?B?d3F3cG96OWpyRmlRM05nRmZ6bUk2ZjhOYlozMlR3cXdIRHE2a1ZHc05ZZ2ZQ?=
 =?utf-8?B?ejd1bEJqdHJNSWcwamtUS0dCdHpvTmJod0lmWWdGSUNLYVNLQ2E2a2pjeHBJ?=
 =?utf-8?Q?3rIjhY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1c0ei9lcGd3NTZTSUc3bkJ6MXQ2MUN1QUN0TGJlZ2lxcFE3cVdTdStLVTJQ?=
 =?utf-8?B?S2tqZlNUekVFam5MQlhwdnRVaVRsNjhaOHBvUkwyZE5QZWhRUjN3a2QvWGN6?=
 =?utf-8?B?UThOUUMvWVk4S1ZPNmFBdUo0Nk83NlpudE9RRDYyQ3VKcDhSZnYzbU1CSWpi?=
 =?utf-8?B?bnJpMjRReFFsV1RHajNBbWtWUVVIMjVValkrUkZsN1ZJbHpKNjN0TjNnOSt6?=
 =?utf-8?B?ajR2cGpLdWNvRmVMOEZqYXF2UFZvTHJ6U3JYNzFVWkRQN0dMRWh4enNRTERm?=
 =?utf-8?B?cktWUVNZWFVLNWxhUXBpVnhNYW1MN1VxQjI1TjMvcE9PZXRzZkhlcW04Z1gx?=
 =?utf-8?B?TWR6M2JiMW5Ec1d5TkpmSHAzYlJXOWFMUUFFY0RnbGNKdDcxd2ZhbUp6WGZB?=
 =?utf-8?B?MDgrWE1GTG16OGozQnB0aExqdU9BRjBzZ0VpLy95cDBUaFRrd0d2cldTanBT?=
 =?utf-8?B?RlB6Q0M3d1RPcUxQd3p1L3NYblVuODFKYTYzaTFGaUpkMkNXMk9ySzA2WU95?=
 =?utf-8?B?TWNkRS9GRUc4Ny9YUEpCaU45SGl6NjZrbmhmaVZHUHRWRU1kU0lnWFpyalk4?=
 =?utf-8?B?NGFudEJwZGhWcFBJeWlES1R6RTRwRnNVOWw1NGplMzU5MVNmTEcxUk4wTHQv?=
 =?utf-8?B?YUpGNmczalA0aTRraEYxbzIrTXF4YlMzN0w0UGZFVmpvZjI2OEtLa2Ztem1P?=
 =?utf-8?B?RlIxdFlMWWRmU1M3SjBRcnVlazRDbzRmTSthWmxYbHBoSCtBS2hzQ3JqWGd6?=
 =?utf-8?B?YUo3YmduaVhQM252Q2FMZ2tIYVFvQUFxWmE0ZE5zd1grL0kwdjlGSTVnR1Bo?=
 =?utf-8?B?blBvcysvS1NvZmFhRlNwWFdpcnlYY3pJK0s1TFUwbkEvaVFUcDZJc0o2Y2tS?=
 =?utf-8?B?UUJIczhwYVJQTWhrcU9YbjZhM0M4RFlQclhka3poMWlnYkUrdWZmWjZZVnhJ?=
 =?utf-8?B?ZVdGUUk5NTQ4ekFqMEhHNStyNDdPVEVxREtaOFo2V0lYWGpEMm5JM0EvRVBR?=
 =?utf-8?B?RldLSEc5dHZEdjJubVRkWWUrWmJJV2ZKakFVZW1PeStoZlppaUZHcmNVeDVT?=
 =?utf-8?B?aFJ4YkJNNmVrOTl4QWxIbXBRWlRlUVVJVXVUMEdXcGJFTFdLK0x0N0EzVmRV?=
 =?utf-8?B?cDh4dmkxVVBNU1JYV1VZSmVRanZUalc0YkRIUkNVeGFrM09rbm1qQlQxZk42?=
 =?utf-8?B?Tm9vUmRNbFhraUM0VFlseUt0aGQwSlg1Q3l4d1NXUTMwUzRpdUZBdlVuUWVY?=
 =?utf-8?B?WXEzclpXbkFXVVVMT01JaEdDZmpQNjZsRTlGdS9jbUkwcks2RlpETjdCNW16?=
 =?utf-8?B?QTlyb09jZWdnSzVtSmhDNFhUY2tsMkhhMzRzODRXTHV2WkxqSFVOdjFIVmZt?=
 =?utf-8?B?bEFjS1dncVp6TE9zN0kwdDVKL2VNYVNjSFZXZ3pwZ3JiZEhEQkQzaDlDaDVW?=
 =?utf-8?B?Qk84RkdYSytCeU4waFVNbG9JQkpaMnVmdlFUbDBsLzlxN05xMkR2UkQwSmZY?=
 =?utf-8?B?ZDRpZXNrdzNtZ2JGem9MWlFIYUl4dlR6TzRCWDlOb2Uycm4vc3ZtcFI4aW15?=
 =?utf-8?B?eFRsVW1IZTlFSVlSYzRhV0NKeU9jQjlHQUlJMDlqZ2NCTHhoUDNya1FVTVBs?=
 =?utf-8?B?Qm1ZK05NVTV5WXVQd04zbDlRMWRMMnVNMmdGV2NGcHJRN0tIV1VJVW1iVFpi?=
 =?utf-8?B?bEtsNFR6cTcvWFB2c1JGOGwwSDFUekdkeTVwMzZUYzJIRmRXREdrZkthcFJ2?=
 =?utf-8?B?QXdjTG5xcGlDOXlxbmdoVHY3ZkdYa2Vtam92YjBaRU9PeEJCOCtDS0ZRdUVR?=
 =?utf-8?B?QkI3MlRseFNZclBTREFRUldzUVdUZlBsMGhsblI3UWF0MW1wMUVBUFZoN2pV?=
 =?utf-8?B?NmEzTzRweVZEK3dadmFTbU0zanFBem5vSmpNcFNGQjhmRkgrYkR0YlpxY0xm?=
 =?utf-8?B?bHpZVnlTcGJsaEVKK1Q1RXZMc1gxcHpqRlloVzY4UE8rZk9URjNYM1EzTDVI?=
 =?utf-8?B?elUrSGFmVEs2akJKT0ZxYmlZZVZkckZTWXV0Yk1LRFkwbzN0NDlPdTA2K1lz?=
 =?utf-8?B?MGx2cXcrU2QyaDAxY0dlakc1SDU1R3A0NENIcENIdE9DdXlNdE5nUzhsenN4?=
 =?utf-8?B?MUdzaFVZeVFBTDFDY2QyMUdjdGI0a0FYcmkxWmdFV0pabFF0RkEvcDl6dG9H?=
 =?utf-8?Q?rBFlDUK3sSIWBZijJWqRt7dSCYnNRmywLS1YwwTi8dYh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c87cab3-81fc-474e-e98e-08de285719d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 17:06:09.3557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fkx7dxH1cSSnp5m3MaQDClYdg4YOebfwKVWmtYRZY1yj13W5+C2erFVewsWYYzUe8P5wkTkw+Xm8TtE3KVznTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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

SGkgTWFpbnRhaW5lcnMsDQpKdXN0IHRvIGF2b2lkIGl0IGJlIG1pc3NlZCwgY291bGQgeW91IHBs
ZWFzZSBoZWxwIG1lIHJldmlldyBhbmQgbWVyZ2UgaXQ/DQpUaGFua3MgaW4gYWR2YW5jZSBmb3Ig
eW91ciBzdXBwb3J0Lg0KDQpCZXN0IFJlZ2FyZHMNClNodWljaGVuZw0KDQpPbiBGcmksIE5vdiAx
NCwgMjAyNSAxOjU2IFBNIFggV2FuZyB3cm90ZToNCj4gSGkgU2h1aWNoZW5nLA0KPiANCj4gVGhh
bmtzIGZvciB0aGUgZml44oCUcGF0Y2ggbG9va3MgZ29vZC4gSSBkb3VibGXigJFjaGVja2VkDQo+
IHhlX2d0X2Njc19tb2RlX3N5c2ZzX2luaXQoKSBhbmQgaXRzIGVycm9yIHBhdGhzIGFscmVhZHkg
cmVsZWFzZSB0aGUga29iamVjdCwgc28gbm8NCj4gYWRkaXRpb25hbCBjaGFuZ2UgaXMgcmVxdWly
ZWQgdGhlcmUuDQo+IA0KPiBSZXZpZXdlZC1ieTogWGluIFdhbmcgPHgud2FuZ0BpbnRlbC5jb20+
DQo+IA0KPiDigJMgWGluDQo+IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4g
RnJvbTogSW50ZWwteGUgPGludGVsLXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBP
biBCZWhhbGYgT2YNCj4gPiBXYW5nLCBYDQo+ID4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxNCwg
MjAyNSAxMzozMg0KPiA+IFRvOiBMaW4sIFNodWljaGVuZyA8c2h1aWNoZW5nLmxpbkBpbnRlbC5j
b20+Ow0KPiA+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBMaW4sIFNo
dWljaGVuZyA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUkU6IFtQQVRD
SF0gZHJtL3hlOiBGaXggZnJlcSBrb2JqZWN0IGxlYWsgb24NCj4gPiBzeXNmc19jcmVhdGVfZmls
ZXMgZmFpbHVyZQ0KPiA+DQo+ID4gQSBzaW1pbGFyIGlzc3VlIGNhbiBiZSBmb3VuZCBpbiBmdW5j
dGlvbiA6DQo+ID4geGVfZ3RfY2NzX21vZGVfc3lzZnNfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0K
PiA+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9jY3NfbW9kZS5jDQo+ID4NCj4gPiBDYW4geW91
IGZpeCBpdCBhbHNvPw0KPiA+DQo+ID4gLSBYaW4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiBGcm9tOiBJbnRlbC14ZSA8aW50ZWwteGUtYm91bmNlc0BsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+ID4gU2h1aWNoZW5nIExpbg0KPiA+ID4gU2Vu
dDogRnJpZGF5LCBOb3ZlbWJlciAxNCwgMjAyNSAxMjo1Nw0KPiA+ID4gVG86IGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4gQ2M6IExpbiwgU2h1aWNoZW5nIDxzaHVpY2hlbmcu
bGluQGludGVsLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlOiBGaXggZnJlcSBr
b2JqZWN0IGxlYWsgb24gc3lzZnNfY3JlYXRlX2ZpbGVzDQo+ID4gPiBmYWlsdXJlDQo+ID4gPg0K
PiA+ID4gRW5zdXJlIGd0LT5mcmVxIGlzIHJlbGVhc2VkIHdoZW4gc3lzZnNfY3JlYXRlX2ZpbGVz
KCkgZmFpbHMgaW4geGVfZ3RfZnJlcV9pbml0KCkuDQo+ID4gPiBXaXRob3V0IHRoaXMsIHRoZSBr
b2JqZWN0IHdvdWxkIGxlYWsuDQo+ID4gPiBBZGQga29iamVjdF9wdXQoKSBiZWZvcmUgcmV0dXJu
aW5nIHRoZSBlcnJvci4NCj4gPiA+DQo+ID4gPiBGaXhlczogZmRjODFjNDNmMGMxICgiZHJtL3hl
OiB1c2UgZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkNCj4gPiA+IGhlbHBlciIpDQo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4NCj4g
PiA+IC0tLQ0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9mcmVxLmMgfCA0ICsrKy0N
Cj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9mcmVxLmMN
Cj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X2ZyZXEuYyBpbmRleCA4NDllYTZjODZl
OGUuLmNlM2M3ODEwNDY5Zg0KPiA+ID4gMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfZnJlcS5jDQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3Rf
ZnJlcS5jDQo+ID4gPiBAQCAtMjkzLDggKzI5MywxMCBAQCBpbnQgeGVfZ3RfZnJlcV9pbml0KHN0
cnVjdCB4ZV9ndCAqZ3QpDQo+ID4gPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gPiA+DQo+ID4gPiAg
CWVyciA9IHN5c2ZzX2NyZWF0ZV9maWxlcyhndC0+ZnJlcSwgZnJlcV9hdHRycyk7DQo+ID4gPiAt
CWlmIChlcnIpDQo+ID4gPiArCWlmIChlcnIpIHsNCj4gPiA+ICsJCWtvYmplY3RfcHV0KGd0LT5m
cmVxKTsNCj4gPiA+ICAJCXJldHVybiBlcnI7DQo+ID4gPiArCX0NCj4gPiA+DQo+ID4gPiAgCWVy
ciA9IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldCh4ZS0+ZHJtLmRldiwgZnJlcV9maW5pLCBndC0+
ZnJlcSk7DQo+ID4gPiAgCWlmIChlcnIpDQo+ID4gPiAtLQ0KPiA+ID4gMi40OS4wDQoNCg==
