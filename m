Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B2FC54ED1
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 21:06:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3232B10E142;
	Fri, 23 May 2025 21:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbnkJiPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D34C10E0E1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748034397; x=1779570397;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Qs7MKh3Ra76jqc967B++311pqpGKEN+rhe74tVZfK7Y=;
 b=ZbnkJiPHEueNmK6t4kzAKotkwPGT+DWRVg1nUD8icxpqUJn6HLs+EyYM
 8J8DG7i7hac/huxzdLY+3WB96VKKnHGKC4vdAlsw1Tcr1RxTOXO0xa3pH
 klpFQGO7GjjnmvzoqgQM5gUjOLZncAK5DwxK6BC9cpNxhi7LaNdrPXGE6
 CrDmhXVutjMg+QH4giQafSGlVLMnsoeXeI+iatT6RZz5oo3zYv4ORct/C
 Pj9VX//Yf8+NjDybze6Pnddo/VXnL/+9liq9oS1kSwgOF9MoB4EtoqRqZ
 g/2FkcCTZczLzweWIIc7ZR7Ugid6W8BLBXFPe4f4HlpxOhW7fc40Om9N4 Q==;
X-CSE-ConnectionGUID: dkitFdhGRJyeos4xYa9t2w==
X-CSE-MsgGUID: pu5ozYeMQUWaWAXv1xiqtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="67659463"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="67659463"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 14:06:37 -0700
X-CSE-ConnectionGUID: XHrbsV7ITi65AjyozfKb7Q==
X-CSE-MsgGUID: wsgUEdMuRJmM+fwUlfd9fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141792239"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 14:06:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 14:06:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 14:06:36 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.79)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 14:06:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7x83rrhPnEYQKe+rge3fg7nO7mcCR73M7vI9qd8nzSW1W6pIIRv4ZiPJ0pFr5JHfIa7DbnuaJYT1WICkgtH+elgPEkEdYIfRNKcyn+NVtQtdG/Lg1x6bU9aChxYL0+sM2OEax+/Sttj/AM5lZefIRoGvy/cki1rH27WXT6fwqs5SJuUj4brNqzLsQ4QKygzHA4tvhin5AqoJR5iB5kA9ig0Q3a61t/D3X7n1xruDJmb95C6vBAHwSjJ+ePkqR7H5xB8m/7gGKl7dYQzouYdTva9bNLhO5UDWhIWbyfdpNbP8UdbLHDXiWY20DVh3TwHHJ+/Namtao4NpSv5kZC+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vj3lLuUPt61N/qc+unktJ2pylNPOsaJWLyUrpYCu5Y=;
 b=U5LIlRBxqCArT50qhtMcL5rJFVHZ++Sqr+RgchI4D4NKLXZoSrB4Fx1v+gIv4bFwnc19Fhs9+onSfE6Ng7t5f2OmnoebixBCYd1tsYZA2+6wsJVIHyQZLIqZM9kKEVBRKRbIUcLNyDTjhkiV48ZJlOFztkkE4vQfS9R1nbAcudjIyBO+qfo4u0pqklvScJ3vmYiWBIpKPPWSRv9blGdDF2WvaCMkhzfbtQAcdREjNFBaP8LoU7NeoDcI5M2EgM7F0TrF0gkW+ObHigtUElnLeeqv3DYUzctGv31ekGbsSwJsvWHRu6gEFSJsDy7DdKioR1V5v+nmeCd+aPNg9nEJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB8067.namprd11.prod.outlook.com (2603:10b6:806:2e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 23 May
 2025 21:06:27 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 21:06:27 +0000
Date: Fri, 23 May 2025 14:06:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe: Add configfs to load with fewer engines
Message-ID: <aDDjS47mHJVBXHZU@unerlige-desk.amr.corp.intel.com>
References: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520-engine-mask-v2-1-46e76f935b35@intel.com>
X-ClientProxiedBy: MW4PR04CA0078.namprd04.prod.outlook.com
 (2603:10b6:303:6b::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 948b7a30-2972-4976-f36b-08dd9a3dae6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0c1R2FoU1FObnRETVp1MHJsclhuL0RhYVk3ZFJ6WXg2eUdmNWJHZ21Teksy?=
 =?utf-8?B?R2xaZ3B1TzBSTFhiRU5VaGFQRmI0SDY4N09lbDg2ZDV5RzQzM2o2TzdxakFy?=
 =?utf-8?B?N3gzUjVrci9LTk1vdlk0VXFEL09BZHFnL3h6Wnl5dlpXTERKYmQzWlRRbnR0?=
 =?utf-8?B?UVRWMjR0ZTVaMUFUYkF5RUZuaHBIK05kd2xkV3dnTXR2ZVNWY2todlg2M1lC?=
 =?utf-8?B?S0lDbmFNN24rVWVnakFCNldvMXY4OHRWUFE0czZHM213Y1VnUnRMbllZUnpw?=
 =?utf-8?B?bDExYTJzZkFsNmloUTRpSTlDUEhXT2sxRk4vU0Q1TUw5RFd2ZDhyOXQrdkY4?=
 =?utf-8?B?TUVxL2JlZGEwZnlFL2d5eUFWYjFRV1lpMWRuMEgxKzVxeHhwbCtCUmo5VHdk?=
 =?utf-8?B?OE82UjdLWU52dEJjSjRXY2N6U3RrNzB0QXpZWnh3NEI1bTQyemZrdVQ5MU5Y?=
 =?utf-8?B?YjV3eTJ1b2tFVlFZbHl5M1FHaGE2K1ZRd3RYSlBGRmJMaDhQeWFWUjBlYUdj?=
 =?utf-8?B?cGl0cWJIN1J6SlZqdlBwZjg1OG1kbDlHSUZrakw5aGwxK25JL0c1bkcwOVBa?=
 =?utf-8?B?bTRPZnZ1WXByWTR5KzNJb04xMFZldjJ0SHNFcng1RUFZVDEwY0hJcGg1eHZO?=
 =?utf-8?B?Y2xkQlpkRkFFa3pwUjNLeFdHd1BCSVljZkRsZ3lpdFZPbDFyeWJzbnU0cE9j?=
 =?utf-8?B?YjlsQVZFdWZmdUxWZ3hCUDJiOWxLMmtPemtYeGFrSkFmUzd6Vm03cm53ZWp4?=
 =?utf-8?B?Z0w1RzMyRGt5UjM1THkrRGJEUnZEWUJReElKRHE3Tkp3ajlXekZJL1pLT2RO?=
 =?utf-8?B?NjhnUkcwc2d1bmU0bTBJd2l0L2tvN3VUWTd5VHJkVjl6MkNqSkVXNmh1Z25Y?=
 =?utf-8?B?QnhvNE9kV3FWV0thcGcyYzFlenJOY2xSSmdXVkxWcGwydXBOeXhMQ3RiZVFV?=
 =?utf-8?B?am51R0JGbnE5N3VYL2o4Tzc1eEp0bTNONDVRVmNRYXZEZ3d1WmhLajdSMGhR?=
 =?utf-8?B?eDVXUWtOc0k1WGdjbktqdEgvZUxSMzBEYVFJWXc0L2J6ZXM3c200K3VTYlhz?=
 =?utf-8?B?K3V5T1JGYXlCZVVCSWs5T2tMRlZnWGtwbFNpUFdpZk1uZFR4VXZVUGJMWVB1?=
 =?utf-8?B?WGJlVjQrbkNDbWdFc1pTT1FoOEx6MFFkNkhaVDZkaTBuRDNLZXd0U1pyVTBj?=
 =?utf-8?B?UUJKWXh2VEp5SkVrMXM4NE9RQ0Nva1F4b3Vod2Z6R2RwRGZqU2Fwak8yV0pt?=
 =?utf-8?B?L1BHeko1ell4TDI5VGZndWdDVVU1ZmRaT0NOeWhwMkZTVmVHT25GeEJ3dWFY?=
 =?utf-8?B?amFaV3UwUGtkTmkzYWt0NFBvcUZWWTZzWEE1V3U2VW15RERyMEpnUWhzR2Yz?=
 =?utf-8?B?V3RZYytRd0JFcnhkRk5MMDVIT0tnOHZMbnJmNzdQNGhzN0V5blE4OXFxMEFi?=
 =?utf-8?B?d3E4N3lYaWNxYzFScllqUmEvYVpQU0RKZGN0a1Q4Vzh0N2YrWkNub0xGNmtj?=
 =?utf-8?B?Yll2NWNWU291VC9pNjU5b21NYjFqUDZzYUhDbStqZjgwa3F0Kyt1aWprUEdo?=
 =?utf-8?B?emVsaUxKWjFTY2xURWtVT0pKamNMQjFzWEZwcXFrRjdxcEV1clZXMXdaVU5O?=
 =?utf-8?B?c1pOVW4yZlRmOVZDWWNmR0o3OWlZNjFic3JQbDFqeXBZSkJ6TVlkYzNTMU1s?=
 =?utf-8?B?ZTF4OHJhendYUWwrb1Y4cEpXYkxmeS82VTVUamZZV0VmK3BTSzE1dDlQNTlE?=
 =?utf-8?B?cjRjcTVwMUJVSWdiSktJenZuT0xhbDZxbU5oN0xDdVkwdVdoL0RVTUVuSy92?=
 =?utf-8?Q?XCJcJ2AMq1bj3wyct1DYBfmUgnmGAYXfV6CoA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFJZW9RSDVMdktIWHNvakRFeUN1T1RadXBDTDQzNk1adU9iMytnRlFQSjRF?=
 =?utf-8?B?dTI4a201aFNqYkpPRjkzdmpKUTJqbkVVT2MzUExRMHAvdk1yRi85ODFPbGdl?=
 =?utf-8?B?cWpZNHpseVZKNVZwbEhFNmVqMFNMSU51VFVIRStyWk1xYi9TbVpsaWpSM1ZO?=
 =?utf-8?B?dHpOZFluWGZMaGJ5UEJhSkNpaGYxaS90eDRhNHhYYXFCWHczSUZoZ0VvYTB6?=
 =?utf-8?B?NGsydW1EcjRxZThmTGhHUnAySjFGWGd4K3VxeWY1YjhIb25CbkhxUnRqdFlM?=
 =?utf-8?B?ZkhRNHdFOUk2MStLZHdVV1lEUmhjS2xWUWxqR3hIbjl0Yi8wNjJKaFhRY25i?=
 =?utf-8?B?RnVVRU1SM3U1UTNNZnkzaDZqTC8rT25iWFpvMUpUeHZzbnRpL1k5d1pmOVVH?=
 =?utf-8?B?WnhrclhDOHFCbE5Iak5Oc2g0blBLZENVVGpoNW96b0w3M1RoUDZTeVdoS0Nu?=
 =?utf-8?B?UTJoNFlQNm9QUXNwVDJndEFFdCtQNkxmUmJsZmdiNVZvclFMMU0zWTBrWk4v?=
 =?utf-8?B?UlMzWDZSVVArdzhQUXFvdDlETWRoeTdFR0tlNTNZdGsxQjhBS0xqdG9CNnFm?=
 =?utf-8?B?OHNqazZLOGZVdy9kRlpGY1FjWkZoSFNIT0pKTWxCeDlFVlVnNmhNVGVkWkxH?=
 =?utf-8?B?emtGT2xIVkZDd09TWFJTc0FaaFZzbnhycnIvQkdjZHlYZFpwd3ZGRkdaQ0k0?=
 =?utf-8?B?eUFyRld4WExPd2FnOVd5L1NaQTQ1dkozYUVMWlNlYWpjTWNJVWN2cmpuYVli?=
 =?utf-8?B?UlY4VFJlRGpHUWxQM2xXRGJ0cTFOclBiSlhWZFJZTVBxN0xNNEEvTmRaZzZa?=
 =?utf-8?B?blJReTZQWmU0M0xpK3drVnZOTFNPUjhQaVVoK0puY3Y4OE5NbXN3Sy9SQ1NB?=
 =?utf-8?B?T0VRV2VsNGlpVUtBZW9SZlVPaHRQV2dRZllwMk52Y2o0RXVUQVBkMFc4bTI1?=
 =?utf-8?B?cGZQM1o3L29ldEZCSDlYVFJqRFNTdDBPZlVGQnIwa0pweG4xN0V1R2Y3eTg0?=
 =?utf-8?B?QWxTVTdTSkt1bXZJdjJjelVGQy9iRmsvb3J6dGlYMHp2cEZ0UkxzMlAzNnJ3?=
 =?utf-8?B?TmNqNGZtdXpYK0JkR01CTENkR24xWHBPNXZpdmhudU5FazFhK0JYTW9yRHRI?=
 =?utf-8?B?d01RdDlYQTBBTForYXFZdUl4Vm1DQjBkYmd2QzhURnJaVS9jU2dHRDJ0aERF?=
 =?utf-8?B?NE9oSkdFOGhmZXh4bkxoZjhRV1NkUm85elcrQm44MEV2d0dVWGhDQk84VGZk?=
 =?utf-8?B?ckhKb3dvZjJkNldRR3VxZ2hrOHBFNitoOHZwL253UXJBa1NWUmdWdFlsT3lq?=
 =?utf-8?B?RVlEd29oVVhrTXF1OFhJcEF6elVTaWQxOE5TU29md01PVGZaZ2ZPN1NsZThK?=
 =?utf-8?B?LzRqYUZROGFGZXNYMGFRTU9DRHZxbEJVbVgvVjZ0T2xaTkJKWVBUMmNuQS9z?=
 =?utf-8?B?N2xNdFEvaHNqd3lRd2VLa1VKZENXZlJwVzRaSlBSS0tLdG9PWG1QTW1JZjJo?=
 =?utf-8?B?c3J3NzdFUDIxL2F0Y0tsVFhGRFphV2s0Uit2NzRoaUhidUZMUmFRcTdRb09h?=
 =?utf-8?B?eEhTZ1FheUE5TFJWcUZuT0ZEZ29Gb0VJT1lMeUhGT21yRnZCc1lubUhKSkcv?=
 =?utf-8?B?QlFNcXZPMzFXOUpOR0RLb2RwbFRnN1hDNzJhNHZ6ODBmdjgveWFtVUpKSFRL?=
 =?utf-8?B?YjlQUGxTbmxLWFUxZldFZ0hmMjlWVFBrOEJ5NU9OaVdmQnNJeFJZZ1FXUnNW?=
 =?utf-8?B?OTRPMjgrdlNuZkNVSGQxMjZlbXQ5VkFaRU1YVzNqbm9GMjl5dEUzM3VTOEh3?=
 =?utf-8?B?b0VBYzB0YXZkREh5OWFLSmJzOFdIZlQ2Zy91dVZGd29zb1JuWDZ6cFh0QW02?=
 =?utf-8?B?Mnc5RFk0czR1aFNuWjJEUHlSbTI4L3RwWDVQMUxyYkdrdS9jVGJXeHdNWnZN?=
 =?utf-8?B?bTlZOHZFSzlDMHZaQllxQ25jREZUOUl4cjdFR285enIxMGhmNGtWdmcxTDFE?=
 =?utf-8?B?b3dMbGRuNzBla2JDK1dRQ1VzQVl3SXk5YUZ4akJTT2JTM0pVNUNuMytNL3dX?=
 =?utf-8?B?M2d0amJmWnUrVzdCanhpOFNIRGlidkFvMmxNOWN0cEpMbUFRcVdBV01KQVlm?=
 =?utf-8?B?LzZmWUZyelFKTCt5Mm55K2tubXNwRWxWWXR5SmFGcVgvZHRqaFRvUjhOVGVn?=
 =?utf-8?Q?cObNm6mPAFgvm+gKhmy+v78=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 948b7a30-2972-4976-f36b-08dd9a3dae6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 21:06:26.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/y3G+kpvb6UNkFcCJXUiQJ/TGUrpr8cqiYSFHg2tm3odBMWgWCBUzhTkKf+MqXRB3es+3/JmUJVLSt6O3F4Z63e1JyfoUzPXHXMCu4rbZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8067
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

On Tue, May 20, 2025 at 02:28:58PM -0700, Lucas De Marchi wrote:
>Sometimes it's useful to load the driver with a smaller set of engines
>to allow more targeted debugging, particularly on early enabling. Add a
>file in configfs that allows enable only a set of engines.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>Changes in v2:
>- Fix build with CONFIG_CONFIGFS_FS=n
>- Link to v1: https://lore.kernel.org/r/20250520-engine-mask-v1-1-ce6daf16d23b@intel.com
>---
> drivers/gpu/drm/xe/xe_configfs.c  | 133 ++++++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h  |   2 +
> drivers/gpu/drm/xe/xe_hw_engine.c |  20 ++++++
> 3 files changed, 155 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index cb9f175c89a1c..fb433503501c8 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -3,14 +3,18 @@
>  * Copyright © 2025 Intel Corporation
>  */
>
>+#include <linux/bitops.h>
> #include <linux/configfs.h>
> #include <linux/init.h>
> #include <linux/module.h>
> #include <linux/pci.h>
>+#include <linux/string.h>
>
> #include "xe_configfs.h"
> #include "xe_module.h"
>
>+#include "xe_hw_engine_types.h"
>+
> /**
>  * DOC: Xe Configfs
>  *
>@@ -48,6 +52,23 @@
>  *	# echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>  *	# echo 0000:03:00.0 > /sys/bus/pci/drivers/xe/bind  (Enters survivability mode if supported)
>  *
>+ * Allowed engine:
>+ * ---------------
>+ *
>+ * Allow only a set of engine(s) to be available - this is the equivalent of
>+ * fusing engines off in software. Examples:
>+ *
>+ * Allow only one render and one copy engines, nothing else::
>+ *
>+ *	# echo 'rcs0,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed

I would suggest engines_allowed everywhere here for readability since 
you could have more than one engine allowed.

>+ *
>+ * Allow only compute engines and first copy engine::
>+ *
>+ *	# echo 'ccs*,bcs0' > /sys/kernel/config/xe/0000:03:00.0/engine_allowed
>+ *
>+ * The requested configuration may not be supported by the platform and driver
>+ * may fail to probe - intended for debugging purposes.
>+ *
>  * Remove devices
>  * ==============
>  *
>@@ -60,6 +81,7 @@ struct xe_config_device {
> 	struct config_group group;
>
> 	bool survivability_mode;
>+	u64 engine_allowed;
>
> 	/* protects attributes */
> 	struct mutex lock;
>@@ -94,10 +116,95 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
> 	return len;
> }
>
>+static ssize_t engine_allowed_show(struct config_item *item, char *page)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+
>+	return sprintf(page, "%#llx\n", dev->engine_allowed);
>+}
>+
>+static bool lookup_engine_mask(const char *name, size_t namelen, u64 *mask)
>+{
>+	static const struct  {
>+		const char *cls;
>+		u64 mask;
>+	} map[] = {
>+		{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK },
>+		{ .cls = "bcs", .mask = XE_HW_ENGINE_BCS_MASK },
>+		{ .cls = "vcs", .mask = XE_HW_ENGINE_VCS_MASK },
>+		{ .cls = "vecs", .mask = XE_HW_ENGINE_VECS_MASK },
>+		{ .cls = "ccs", .mask = XE_HW_ENGINE_CCS_MASK },
>+	};
>+	size_t i;
>+
>+	for (i = 0; i < ARRAY_SIZE(map); i++) {
>+		size_t clslen = strlen(map[i].cls);
>+		size_t numlen = namelen - clslen;
>+		char instancestr[4];
>+		u8 instance;
>+
>+		if (namelen < clslen + 1 || strncmp(name, map[i].cls, clslen))
>+			continue;
>+
>+		if (name[clslen] == '*' && numlen == 1) {
>+			*mask = map[i].mask;
>+			return true;
>+		}
>+
>+		if (numlen > sizeof(instancestr) - 1)
>+			return false;
>+
>+		memcpy(instancestr, name + clslen, numlen);
>+		instancestr[numlen] = '\0';
>+
>+		if (!kstrtou8(instancestr, 10, &instance)) {
>+			u16 bit = __ffs64(map[i].mask) + instance;
>+			u64 val;
>+
>+			if (bit > sizeof(val) * BITS_PER_BYTE)

s/>/>=/ because right side of compare is 64

>+				return false;
>+
>+			val = BIT_ULL(bit);
>+			if ((val | map[i].mask) == map[i].mask) {
>+				*mask = val;
>+				return true;
>+			}
>+		}
>+
>+		return false;
>+	}
>+
>+	return false;
>+}
>+
>+static ssize_t engine_allowed_store(struct config_item *item, const char *page,
>+				    size_t len)
>+{
>+	struct xe_config_device *dev = to_xe_config_device(item);
>+	size_t namelen, p;
>+	u64 mask, val = 0;
>+
>+	for (p = 0; p < len; p += namelen + 1) {
>+		namelen = strcspn(page + p, ",\n");
>+		if (!lookup_engine_mask(page + p, namelen, &mask))
>+			return -EINVAL;
>+
>+		val |= mask;
>+	}
>+
>+	mutex_lock(&dev->lock);
>+	dev->engine_allowed = val;
>+	mutex_unlock(&dev->lock);
>+
>+	return len;
>+}
>+
> CONFIGFS_ATTR(, survivability_mode);
>+CONFIGFS_ATTR(, engine_allowed);
>
> static struct configfs_attribute *xe_config_device_attrs[] = {
> 	&attr_survivability_mode,
>+	&attr_engine_allowed,
> 	NULL,
> };
>
>@@ -139,6 +246,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
> 	if (!dev)
> 		return ERR_PTR(-ENOMEM);
>
>+	/* Default values */
>+	dev->engine_allowed = U64_MAX;
>+
> 	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>
> 	mutex_init(&dev->lock);
>@@ -226,6 +336,29 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
> 	config_item_put(&dev->group.cg_item);
> }
>
>+/**
>+ * xe_configfs_get_engine_allowed - get engine allowed mask from configfs
>+ * @pdev: pci device
>+ *
>+ * Find the configfs group that belongs to the pci device and return
>+ * the mask of engines allowed to be used.
>+ *
>+ * Return: engine mask with allowed engines
>+ */
>+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev)
>+{
>+	struct xe_config_device *dev = configfs_find_group(pdev);
>+	u64 engine_allowed;
>+
>+	if (!dev)
>+		return U64_MAX;
>+
>+	engine_allowed = dev->engine_allowed;
>+	config_item_put(&dev->group.cg_item);
>+
>+	return engine_allowed;
>+}
>+
> int __init xe_configfs_init(void)
> {
> 	struct config_group *root = &xe_configfs.su_group;
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>index d7d041ec26117..c80131f994a71 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -14,11 +14,13 @@ int xe_configfs_init(void);
> void xe_configfs_exit(void);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
> void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>+u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev);
> #else
> static inline int xe_configfs_init(void) { return 0; };
> static inline void xe_configfs_exit(void) {};
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; };
> static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) {};
>+static inline u64 xe_configfs_get_engine_allowed(struct pci_dev *pdev) { return U64_MAX; }
> #endif
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
>index 93241fd0a4ba3..af750ed8c0f00 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine.c
>+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>@@ -17,6 +17,7 @@
> #include "regs/xe_irq_regs.h"
> #include "xe_assert.h"
> #include "xe_bo.h"
>+#include "xe_configfs.h"
> #include "xe_device.h"
> #include "xe_execlist.h"
> #include "xe_force_wake.h"
>@@ -810,6 +811,24 @@ static void check_gsc_availability(struct xe_gt *gt)
> 	}
> }
>
>+static void check_sw_fuses(struct xe_gt *gt)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+	u64 sw_allowed = xe_configfs_get_engine_allowed(to_pci_dev(xe->drm.dev));
>+	enum xe_hw_engine_id id;
>+
>+	for (id = 0; id < XE_NUM_HW_ENGINES; ++id) {
>+		if (!(gt->info.engine_mask & BIT(id)))
>+			continue;
>+
>+		if (!(sw_allowed & BIT(id))) {
>+			gt->info.engine_mask &= ~BIT(id);
>+			drm_info(&xe->drm, "%s fused off (in sw)\n",
>+				 engine_infos[id].name);
>+		}
>+	}
>+}
>+
> int xe_hw_engines_init_early(struct xe_gt *gt)
> {
> 	int i;
>@@ -818,6 +837,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
> 	read_copy_fuses(gt);
> 	read_compute_fuses(gt);
> 	check_gsc_availability(gt);
>+	check_sw_fuses(gt);

nit: I would call it apply_sw_fuses()

Thanks,
Umesh

>
> 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT < XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
> 	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT > XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>
>
>
