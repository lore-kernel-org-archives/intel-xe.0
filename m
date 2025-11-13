Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C95CD8CAF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 17:55:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5D610E10A;
	Thu, 13 Nov 2025 17:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eilsU4Y6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13D410E10A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056514; x=1794592514;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=DZi97QMOk4Dk6r63sz4QyOD7bTFz6/m+0Dvd9VTkC5w=;
 b=eilsU4Y6URdn9o7yCXmHHFvbbtzlrAg8sR3/FDA0EJDHlyw2r6LHMSGQ
 G0VWQk2tvncIlixh0dYiahg6NnI3eEDiOONYoH69O5XMbTqA3BXViLwzh
 6pUGNMz2YEYRqV34uJjTmp4JFRMuNWa94Hidt9Ja8ULFqmp1tDk9zVVS6
 GPJ5xpxduJKQQyHVkDoBWtLjeq9pZqt2bS1iHIe+Xn+E4Y6TfduTUiFLA
 oV2Gd/t9XEG/FBqW/WAXF+xPONASIq/vPyfGgEMfDJ/OuBGFSh4nLNr9Y
 p/wqgjXgRFhgu2++yL2eYy7Nk4kS+/8V+/zXpU8L3qM+s91c05/40ffSG A==;
X-CSE-ConnectionGUID: uMF8rElUTtynLZzv7FZzcA==
X-CSE-MsgGUID: xNH3edGDToSfsoRJgWpwSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65305152"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="65305152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:55:12 -0800
X-CSE-ConnectionGUID: DEiZ1W2wTeGACNDxuC3PzQ==
X-CSE-MsgGUID: 8ooBxVmDQ4um6WHUFXdKCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189205219"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 09:55:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:55:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 09:55:11 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 09:55:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPcb4CuwnCZmoTYC7XKiJgbkTuA6mLLH/ict3ehJRGw6NPAsaMys+P8u2iaImXX6IV+nsB0PxN0gGP5SqqPKnlHqfBPUlDA66RJy9WmRNhn1S1D+mt/FCNluMU+sSpnwV8IaFdCgv3gWHN06BwnnowU14EkKP12/V3eH0Rfbv7LKOjByjguRPFRN+DkgPoTNdE/P+DWcq3GQiW42zC8fOsXatiWWYTIJJb36NOFN4uv9JRMN5KbVTF4PqFinkHjCfrxx5h/Lqval0k+ImjJ5u25K93iNodEQGf/nUwYVAs/UQBDcov8awrUr4R3yhsNYeBecCVyEqtmkeRqD3gBI0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvvAhHnYOmVEhz0tmNG1lHy00xgPgp7B5g/0vY4Rowk=;
 b=S+AxaNEK2S36whaACULY9xegTpqYQvhN+uFFh33319LpVxA9o6RVe6FA4nVoLNpwHYoVAD/EoUlnxm8S7Yp/1+2Xesqlzq9c45DB0ZZp9H0/L5GI4cEiIzCxX9TNkFifkd1h6CcQWGFq+m+Mp6Z59/SMJFDrhaC5N9T6Ts2XIkaolBKy9iIkaxYb2QCMrGxGVZpF+FYAXRbqcFSUYV5kYfwq9A8YMWmq6pUSiu5S1ciP2vVsf3SLMXYmaphtniMKxQjG3wNZvme3n4cl12mNnS+YCqZtE9fmUvWhq4CXdFSEwJa79wodRKKRVJ5LyFbOHDYX/FykdFtkDG7tDyZwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 17:55:05 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 17:55:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-56-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-56-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 24/30] drm/xe/bo: Use scope-based runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 14:54:44 -0300
Message-ID: <176305648462.3698.6333388613895245762@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0339.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7054:EE_
X-MS-Office365-Filtering-Correlation-Id: 835a187b-15ca-4e35-4e71-08de22ddc716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjV5a2ZPS2NXNEtxQ01lWTBLcTZrbC9TRUVsNnZ4RzdrWHpVOTFORFFQYkcz?=
 =?utf-8?B?S3Y5c0tlcVRrdldZSkdiSkwyL0tMeGE3QjBCbDFVVllJKzduMjd6ZlFtZU45?=
 =?utf-8?B?QVBzejhqMnFTVDB5ZEc3RE0yN250dFFVUTFIZXI2T1FMYTY0R1V3bWJQeVg4?=
 =?utf-8?B?YWlxVDNuMWphTEloWnp4TlZPY096ZVNtenhCSUE0MGlxc2tVMHBIcXpuRlVj?=
 =?utf-8?B?MUJMNEtMVS95VTg1TmNZdGlwVUdiRTBWYnFBTFpMYmFRa2tkWkZlMGYxNFcx?=
 =?utf-8?B?d2lhTEMzT0ZzRkw5Y3RMcXFtdTJvSmV3RTk5am5VS3U3QW41WHUzTkY2SHJ1?=
 =?utf-8?B?V1pCaTBjZlJ2R3laeFRJQTIyWGVIejltaTlOSGtZd2Z1TGFXMUVTOG42RVRr?=
 =?utf-8?B?Z2x0Ykt4bjdMWDRaeG9QMktNQVpQZVJJOVNRSTRkRGVBeUlKTExkbDJQYjI0?=
 =?utf-8?B?WVNnQ0Y0SERrSkNQVEpZQkwvdURBVHRXTUIvcHI5Ty9qWks1cHJ0UnY0bGJN?=
 =?utf-8?B?OWVLNU16RGtTcmkvcDRHcTlRV0cxUS9XdTgvMUw0ajQzRVpOUStuZHdoY2pp?=
 =?utf-8?B?d2hUYmEvaElJZFFnTHVJMyt5S29MMStJN1hReldtT3dQWDgybEF1L2VLY05P?=
 =?utf-8?B?M2RTMUt0YytXR2Y4L215M21jRjltc1J4RG90akVQU21wNUx6ZTFBeGdpNnRz?=
 =?utf-8?B?M00yNmx5RmcwZ1ZNSHZlR0dkcFBnQStsV3c5OURDcms2bkNoY2xUSGdjVm9q?=
 =?utf-8?B?UGVHR2hNMGE0WFN1TFZxVDNhT0pNbXlsSVVkcEtWVHZ1Qk14b1Z2SHYzOTdX?=
 =?utf-8?B?RFpibWN4bjJCMGVuWXk2STVBTSt1Yy9PSVNtejVQV0hTMjlsMnVoZjNkQ1lw?=
 =?utf-8?B?VmV4YXZ5TXBnM2FOVGRBMkJEWmxzVmFkVUNwK0VyZ3JWN0psYmlwQTNybEFp?=
 =?utf-8?B?Vk5DVHArNVB6Tzh4YTdGbldodmFXWGMwNS9COG5oNnlGTit5K0drSUJhQUJZ?=
 =?utf-8?B?eUZpSGRMaXJEQko2enp6enVLb3VFSXFIQUk0ZmJLUUQ0UktDVmFoNjU1YmE0?=
 =?utf-8?B?enI0bDZLTXZ2QWgzT0Rud0lXRmhKRnZ1SHdYZitSV0xTaXhINk5zSXdVajND?=
 =?utf-8?B?WEpxalJ5aitxOXJLODVDK0RWY1BkOFNHYU51QmhVd0hiZm8yejhHQnEwQTZ4?=
 =?utf-8?B?NXlMWENxREhNMzUzclRVblBYZXoyRFhrcS95SFBueTdjbExnWGFtVFA3cWxC?=
 =?utf-8?B?enVTc1VnTHo0bmd6a2x1YlF5VE5MdWlNejdyN2N0UjdkUDQyY1VMOVh2QnlX?=
 =?utf-8?B?ZWdwUE1Ta3VuTERLaWJyWjRBMC9lbm9sWHJ6QUZ4Um9xOUdaK1lvMm8zOUxM?=
 =?utf-8?B?b1YxUkJNUitEcEtQTDlSbnlEM3FYcWVEMjc5NXNaY0xTMTNubFh3SlcwQWE1?=
 =?utf-8?B?TTVVaHR3UmM5TkNLMmFyMUkwL0ErcVZVai9OUFpDUHMyV2lPM3FKdk90MmZM?=
 =?utf-8?B?a00yMVExZitGOGxRaXByZ2Q1N3JiNGhMSnhDa2h2d1E0ZSt6clVVNVdkdkE3?=
 =?utf-8?B?NTU5NUlERjZmVXFDc0Z1RVB6WHZpSHVKZERmV0FWZlE1TVJyMmY5ajJKQ2Vh?=
 =?utf-8?B?aEw3VFF1aUhNU1l1UkQwOTlRSkYreW9EVDBvMmVUelFqSE4yLy9mSktidjBh?=
 =?utf-8?B?akdzcEdqaFJRbzM1TDNidmFIZFhoSU1tUTFqTCtESW84b2tJMVliQzIyWVB5?=
 =?utf-8?B?QzdxNEQ4QzdxR3F4YnozZWpVYWpXY2daTXVCQTcrV0N6UlYweHRKVk00VjNO?=
 =?utf-8?B?a3RSelVEY3kwcTdqbEdnZ0ltM2FxVGNLN0M0eUx6MC9LREptVHlDU2V1NWNv?=
 =?utf-8?B?RDBseVNPQWVteUhMdUpPckZ4Vk05cEx0MU1iempYTXBCbUdzMEcvVzVmYXZu?=
 =?utf-8?Q?e5tQJCw89GFMPeOmStKcy18m6sv777AP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjdlQXJEQUNjK09waGVWTndZMjhwRE5TRUhDeG1PWTgvdnovRXBoQ2JEVzQz?=
 =?utf-8?B?eE1tb3ZiemZMZ2d3WUp2SXl4S21oTkZTaFF2eXo5RkhPeTdPV2pKUi9OK1Iy?=
 =?utf-8?B?QW83eitoUDlmbXIrTU1qT2gydHpPaVJvUE1kTitkNjhtMyswaTFieHQ4MkZP?=
 =?utf-8?B?VWRYVnM4TVI5MEJ5Y2EvdVN0ZTE2SU1rRTljRGhXUTFVNGRYOXUrL01SUjYw?=
 =?utf-8?B?ZHUyK2w0NFFFdURVR3hkRFdBTE9XM2JFditpQitkUE9NUGFBNDVGRmJRWmY1?=
 =?utf-8?B?RnkrRUJtTmtBNnUvVE4xMnoxSXNuMlN2dldyc3dkcGhEM010RTJPdjRMbldD?=
 =?utf-8?B?b1ZJbHloY3ZYc2Zma0hwN3JGYU5nbmNEeDZOZStITDVrVzNIaTBENWxGQWMz?=
 =?utf-8?B?NU5IWWsvQlJRRy9RSnJVbWtpRHhjKzAyTTJFTjNPWkxkSjVxdWNWeFAzTmIv?=
 =?utf-8?B?cUt4bWExOXBwb3oxVURBd2dzMDk3bExBamFKVWsvU2xidDZqZUhXeTEwVExt?=
 =?utf-8?B?dlhmODJxSkgwNTBSZVNTQVpDbmw3T0VUaXpCblp6QWM3TTR5ZXdVVURCZjVj?=
 =?utf-8?B?ZUR2UklCRzlkRGdlUFVHMVVMN0Y2amdSR2pSTjZvZ2hUMEhkb09nM3lQbS9V?=
 =?utf-8?B?eFY0SFVyclNDbmNyN0hsd05Pbm9qYlBnOEVvbFJhTnludmN0bUExZWZNVVlz?=
 =?utf-8?B?WTdhcFdoYVFwTFVRZFNzY2ovN1UrOUhhYVd6a3A4MCsyUjBWRnFVaFNiYlJY?=
 =?utf-8?B?TnJqcjViZjlONDM3cUVmWGR3NEo5ZXJILzZKM3pxcUJsVmJsTXA5TXUwU2RI?=
 =?utf-8?B?MjVPVHcycFNHZ3FTTkp0VmttSEZMUFJrVzQ5ME9aUU01bS91VmUyZG5MSE9z?=
 =?utf-8?B?TjFuazF2N21tOGtIUXJsT0prY083bFk5Qzl0Q1Y1L25NUFUrQk5LRERRSTcx?=
 =?utf-8?B?emN6azg1SlN2bHhwWTFmcmtMNndoV0lHaFVPVWswODdqMUF3NGpWbTlYaG9F?=
 =?utf-8?B?RlRJYk85Uk4rUmZlVFZ6UmVURkUzOE9RTzgyMGF6anl1UEFaY0w1VUZnNE1i?=
 =?utf-8?B?di9kTFpUNlNMbExCVEJwT1diNWVDSEhxdVlCQ2JhQmVLQlBFcGhZY1N1Z01D?=
 =?utf-8?B?Z21jaWJHMGJBRk03YWJpRFdxSXViRndtY291bk5JQUFmaVVjUWdYZzlwZHRH?=
 =?utf-8?B?UTZwZGFJKy8xbzBMeldKZlVnZndUSXczcGlMdllPYUIwRnhxRXlpMmZGd1Rs?=
 =?utf-8?B?ZUs2SVphVExXNm42QW9FVG95SUZsbk81WmtSTnkrS2xUS0NsRmlwZFJxMG5h?=
 =?utf-8?B?QXJzR2g5KzljeElNNi8zVHEvaXllYXljRlZZSlBtMVpaYnlmc29JRE1iMURW?=
 =?utf-8?B?RERROXhxWTFxRHpsd0xxaE03WlhFNW5LOHAxVzZTbUxoWVBuZEQxMjVwUDBp?=
 =?utf-8?B?SDY5MjV2NGhFalA2Q2RrNzg2UUJLWGdvTldndlcyOXNBbXpmU252UlQrbnJV?=
 =?utf-8?B?dkc3bkhFaWc2MEx4UVVmeDJQRmxBbEhXdkY5ZnJ3NFZPc3JvNzlWMGx6TGJQ?=
 =?utf-8?B?cG0wNDBrUzBnOVErNlFxOVZjaVlrK3dlcnBacG5CVnh1OVoxaFFjQkRBbkNY?=
 =?utf-8?B?NEt2cTZPT2JYZUgwN2UreFJiSGNaTDlmMG5yQy9MeXMrZVh1N2tXRUZ4emZN?=
 =?utf-8?B?SVFqTEVES01CTlVXOStOMzVEemhBQ1hYRDhVdnFBRE9CVU1Jam5vK1ZUNGFD?=
 =?utf-8?B?dlFqL0lkYU5BOWtCajJYYmJyaXBjR3d6VDFiR1p0eTNCdGV5dkdxa3ZjOXF2?=
 =?utf-8?B?RHZZSC9pT3ZrMW9wM3Zhc1N4aW5Db1YvYjd4T0NyZ05LLzBlWnZvc2twZjlX?=
 =?utf-8?B?TjZTZ0psOTM1bG5wTWpCYTVjMXdWVTEzRit0VGNqbXZ2L0k1TmsrdFhKcHJP?=
 =?utf-8?B?clpweUsvMlF6VU9PQ1lTb2R3SWxMV0RHWjdCTXBlNklhSzJ0eEZaSU5zMjd1?=
 =?utf-8?B?a0dxOGY1RGNBSklCSTVWT0NibStMMG9uUGlpcGxvUHRrZGJFNE1ianp5QlV0?=
 =?utf-8?B?OVhnbE00MjZvN2I5azZ5cTh0dlJnVlRFbkVpdlQ4TnZxd0h1UThHdXFNWlZI?=
 =?utf-8?B?cENLQnpXTmVFVTVMcWhYa1ZDYVBySDRhQVNORG4rSDVCaGpmYkZpR3BpamdF?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 835a187b-15ca-4e35-4e71-08de22ddc716
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:55:05.7595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUcVufo8rG5MdlwgnRSAkyJ2/PJcQKNVZo17gv7WUTcCUScv197lCSGy+AU3XMyryJRVcRjewJsGE8sHkcoknw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7054
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

Quoting Matt Roper (2025-11-10 20:20:42-03:00)
>Use scope-based runtime power management in the BO code for consistency
>with other parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_bo.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>index b0bd31d14bb9..03d81664706a 100644
>--- a/drivers/gpu/drm/xe/xe_bo.c
>+++ b/drivers/gpu/drm/xe/xe_bo.c
>@@ -2035,9 +2035,8 @@ static int xe_bo_vm_access(struct vm_area_struct *vm=
a, unsigned long addr,
>         struct xe_device *xe =3D xe_bo_device(bo);
>         int ret;
>=20
>-        xe_pm_runtime_get(xe);
>+        guard(xe_pm_runtime)(xe);
>         ret =3D ttm_bo_vm_access(vma, addr, buf, len, write);
>-        xe_pm_runtime_put(xe);

We can drop the ret variable and return ttm_bo_vm_access(vma, addr, buf,
len, write) directly.  With that addressed,

  Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>=20
>         return ret;
> }
>--=20
>2.51.1
>
