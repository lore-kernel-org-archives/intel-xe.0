Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62B0C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 21:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A51010E8E6;
	Fri,  3 Feb 2023 21:42:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDA010E8E6
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675460519; x=1706996519;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=piuXmSX2ikY+0J6jah+LozAHTWyOchmLmDVbyzcDALI=;
 b=SZwlX5TokjbKp57SUEkz4g+lTmco+aa9aFqc+NWeuECxLouqZY9lNMxz
 foMGDUjpeYjguzfDNqFk6ia1CPRHxxYkvaFV5ZVmwC7oaJJjqq6FwGE7n
 /aJ1lCPcpR+kt70/e2/Ws2vmn10Kh8qysX/UaZRaY3pNEReBYn6GVbO4I
 lfLzQY1rzuVpbGNwM0zYSw4MDS3qGWJxPNo/wSn8V3joZr+WNDYrSIUwT
 B0tMixZfr6lZ/v1g+ZWBmLLiJ9u9hb1RG998r6BR08LM78mxbSlma3lWo
 aA7b5pZf6bvG2hU3yx0jIJtNCNhN7Ceu8NTcAdicuEW3CPESfPC8bvZrG w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="308504159"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="308504159"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 13:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="643393425"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="643393425"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 03 Feb 2023 13:41:58 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 13:41:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 13:41:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 13:41:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KO6oydeDLNEeFVGN2j0G9FbaRetVovxeKW5Nh7T90fO+pb5gfUSbcpkYgXAQVB3omInT7+yvOz3Cihnv4ZTa4rQZy8wkqq4qDIRYKuWB8anpi3XsoA3vKNr7yetoFrsp8sp8XixVI7Dn0q3Z1XD9FYd97MLqKT9cPvz+zLMGXov1ff7ygvoXTNhFTxdZsH+n/F0t9JkcMCQc8sm2oUJWvSMusfUjIXKydlN+ftr1j3EFFOihHYYLmmUdSSxTBDJNVjbNQszawcqVa7l5PPPepQAlQDM+EnvegEbRvCSsWtKrY5S5JzfDEJn/voR2kbN/sD4VARuB2b5GFQ0+XXAbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhD+KCu4squmXhd6dSVM/DpsDjIKbv61lzCOVNO64Qo=;
 b=JVgkhKWyPDaO9gj86eoHpIb2ZPZ/TWoJsJrJ6PLG9l72+9ldrKszsLhoc0njlUEzW/6lCf3u7MGUOuDEW/Yy9dybgvOv02xWxOZmVHaQGACgEhDCDLmzmnLW5DLEABkRn2xEbiTl5Sgfw0RXPG7YOsrVnuxnnJVOEK1HwWRua9X/M49eMGojktWNhfMpPHQW6722NB3F59sh8Oyy/XcwxtjoC/SzzaxQhlpLvfKqrRnSkS0dkbOT8saBJvjxWGvHZRZtlf9i0DsZT4o4Bo0peif4bx+BVUZyhgEyEzTQg+5Q7o8opBM2tAG3uUJpzSltEBwJ2sCK5NeDRPsrPsg9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 21:41:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::593:877e:dd33:5b7a%7]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 21:41:56 +0000
Date: Fri, 3 Feb 2023 13:41:53 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230203214153.q2mruirybvykuprv@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
 <20230203201758.573775-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203201758.573775-3-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 72fbd933-4178-44f3-b40f-08db062f7885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: koRSc09bt4dJx3+bC/jLZ2oFo6Zsf/8X6uHsrgj3O03x2EO5ZOizSOJfq47YTIx+kWrkCzULwX8T0D23NhP7o7Z+8lUwkF5d7FSICaFNHgDBagr0QzfdgfQ5N86KXKo68CwEgf1YykG6G9tslO0RvWEzLdytuqaussrKPOc3HXhW/28l82TTQEDoAci2RDQ/u6Cf50WLSJAMO5qOpLWg2zhXkqCAIHPBWNX6aVPpn7wVYQAHexn32BpuEbAUGLPrjE0cd1IS5uVM0vqLjMmdyHRo/eAUVGVG7VuOwLSutu/kJ2qq5ttHVEV2sYoq+xZHdlke6YYk4FdiWcrpwszC9auA367CTwdZ8DPNJ3DoxNBcAtqNA4RggVAQcvHv4ciBHbYekl3BKLLM5YKXjaiVJYm04xkzTUiod4NkHN32gf3RKRAgSLByokhjcBu6w/1no7dEbCGkuJxe37Qr2JuOqLukaLqxMpJVXgoyr8ABaxcpoB0h/SvDjRfh/HvEYaqoHSfwpDAD8makqnDEaRV3m5E+6jK2msXE8wgTPEdk18xuQxRIzrbUg47KAiWfe5YZuraHMLlH51KtXDE0p6y21bfdzd2yMrYeeafdW1BygIKybyIPDVlC+pe9EgmbzPJiUyUwUSUFplONvCIk2+t2GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199018)(83380400001)(26005)(86362001)(6512007)(38100700002)(186003)(33716001)(9686003)(1076003)(6506007)(478600001)(316002)(66476007)(107886003)(6862004)(82960400001)(6666004)(6636002)(41300700001)(66946007)(8936002)(5660300002)(4326008)(6486002)(2906002)(8676002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEUvYkkzcGJPL2FoQ0dzY1phSGFDd2U1U1lUSlBXbjJQYXgvSEcwUzMzSXVQ?=
 =?utf-8?B?bFM0YXAzdFF0dVBLWXd5eEJOMVJUOGxRbGVNY0dVeTNCV1djdkdTbGliV09X?=
 =?utf-8?B?Mm1Mb1N3cENUMGxnN2pobkNZUThHditQU1UvSVNRd2RhU3FmL1kxM09PaUJM?=
 =?utf-8?B?Mm0zelluby9GTjBrRU5NWmYvU0x0dllnMTdVMjhiSGtWS2RsVHY4NmVUeHAy?=
 =?utf-8?B?ZTAyS2MwdXBteVVhbUV5R2FZdCtsc3ZXNEw4R0xLTTRoRWZwRUJGbUM4MUd5?=
 =?utf-8?B?enFTR25oQktZSGR1N2EzUlJPWlZGUUI0b3kvcTlVZUZrTFlJRnBrMjQwL1lx?=
 =?utf-8?B?cUprV000ZVF6Q3VoU0R0OUsxdUhyUVc2b2hmSWdZamZlQ1kzOWZuYzY2b3FS?=
 =?utf-8?B?Y1l4dFpEUkw3dUlwY2l3RDM4MG5Wbmh3a09iRWRLcmNIR3JKcGlHRHJOT0Zo?=
 =?utf-8?B?ek5KUTRXWGFqMUVZWGVYZzJMblpwYld4aXZYNGdHV3g3L0QvWHdGeDgzYWR6?=
 =?utf-8?B?Z21tcUoxYVdESXgrZ1RqTmJOOGNjNmhQZnQ1aURsaXpCZnZFZmVpZGlQWDJY?=
 =?utf-8?B?K20zdEhROUJWYjRZZnJ5UmJaY1ZOcW1mYStlZEdlZnRIbGpHZFdsWDV4L0lx?=
 =?utf-8?B?RHpvWXVneHl5Y1hHdUN5S3QwdHFLelp5aEtjM1p1aGlHZHBjZktCT0dJQ2J6?=
 =?utf-8?B?Rk5xbjFibUl0U2RteG5KUU9ja2JOekYyajNSaytlMFNSVTJEVzJ5cGUyNUJI?=
 =?utf-8?B?L2hpTVhkdmZSamZGZnVmQU5iTjZNby8zY1l4d2RMeHZmTGtTdDlhOHFiM3o2?=
 =?utf-8?B?ZGdEK1BzUGtQdjlLa1lzRTN1b3QxU2dVWWpaQ1N5Ri85N1NlZ2NCOVJOZ0tj?=
 =?utf-8?B?L2M2RzlrUlRYZ3BseFJKZWhBSTJhaElPMGR0RDBCMFZwSzNJRVpqb29PWGRZ?=
 =?utf-8?B?OEhueG9wQ0MyeVhoM3B6Z1ZFSEh3SUdtSXp5R0hQTklFMTIxYzhwRlhEWml2?=
 =?utf-8?B?czM5Z3U5Ry8yVFhxeFBWZ2RTTWw5ZStWb2FLamlHdVI0cnVIaGUwMzVyN09C?=
 =?utf-8?B?NCtUV01teTRSeEE3VXVQTk9PWTVhQWUvYVJKcUs5ak1Gc0VVWWFPOHlqc2Z3?=
 =?utf-8?B?WitLRkxER1pPTzRBdDVqRW5ZekJRU25Zd0lOUGR5M25Jd2xWUDNkRWZpU1A5?=
 =?utf-8?B?U211SHoxME51aklETG9qeFBtNWlzY0VGdUNIUlNvSDVkNnNLN0ZNZHo5UGxh?=
 =?utf-8?B?QmxNdDRRcW1iaUsxbnlsaEJXVjZ2N3RRVWtFSlo5cHhWUk00c20zelRCYjBH?=
 =?utf-8?B?dkhMVkpLaXlQWXkxV0N0Zm9VQU13NVFvbWpBVGFZTm9yT3dXRCtvZ1Q0Z2dp?=
 =?utf-8?B?VkhsR0QwQ3R1QktVTU5jZy8wVHZ6YUZQTjZleS9kSEhEUEhGdTFiQnJLNVd0?=
 =?utf-8?B?QVJzOGV1eVRML1pWOFNpamU1dGZ5SjcyQ29MWnZIanB1RTF5cVFjVHovemJD?=
 =?utf-8?B?cXZvdDBpbnBWZEQ5OVRXQ1FhOTRDdGEvalkveTYyaVA0SWZLZmI1Zm0rRVJp?=
 =?utf-8?B?Y3pySmU4WnlOUFc4L0ltc2RFQ0wwOTJwMENReWNKbnBoVGMzU0tnSHhHK0FV?=
 =?utf-8?B?cEdZNXh5WldGQVN3aE1jbHZBRWJIdmRVRjF4VlhaYnN2RTlMak9DY3BjZmQ2?=
 =?utf-8?B?Tlk0U2ZoYjYwSlhtMmRTMUpRMVdVODVBK3JrMzhzM1hVajl6YndpZGZiMUV2?=
 =?utf-8?B?LysrRk5kbUlqYy9qTkVLeDJBaWZLNGNoeENmMkM4Y3grODNsNFIzb0NMYVI2?=
 =?utf-8?B?Ymh0TUp4TzVveW5YUWRsYk15bFI4RTl2dWROVWJrRjAxTCtWZWE5VFduVHph?=
 =?utf-8?B?NFZxbENxRDRDUFJCU3Nocm9pVGtXVHdtV29ETEttUHBYZVMrQWxSbitSU09N?=
 =?utf-8?B?SlZVckI5b0EzMm0wdk9QVlVWdW9CVXNBSysxbUlaNnpXMFhSaVRkR0lOL2RI?=
 =?utf-8?B?UDh5YzlvTmZtdGkxM0tQdk85MjIwYmwyYjZ3V1hzSDg0MVI2TVBwRjBXQ1Vz?=
 =?utf-8?B?QzF4UWFvMzdxNTRkQXVPa01kWVArWUk2WGE0Zkw3M3VBbEV1OUlTZ1J6L2JS?=
 =?utf-8?B?cENVOStqSDA1NGgzUXhtK25HQnhnc0h3dXYvWUN0d1Z5bCt3cTNKR2xEUmZ1?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72fbd933-4178-44f3-b40f-08db062f7885
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 21:41:55.9877 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4jxqo0cQxg26YLXR0CcXo2pSyAeVI12VM8lKmZhrZUazFl4K5dwOLN5mFWN/3LSwkI/BI+rS0NppOxh/TT8LXCIKLhIthIqaNPxS9GnU2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe: fix XE_DISPLAY dependency on ACPI
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
Cc: intel-xe@lists.freedesktop.org,
 Philippe Lecluse <philippe.lecluse@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Feb 03, 2023 at 03:17:56PM -0500, Rodrigo Vivi wrote:
>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>Trying to run KUnit without passing arch currently fails with:
>
>$ ./tools/testing/kunit/kunit.py run  --kunitconfig drivers/gpu/drm/xe/.kunitconfig
>[10:42:07] Configuring KUnit Kernel ...
>[10:42:07] Building KUnit Kernel ...
>Populating config with:
>$ make ARCH=um O=.kunit olddefconfig
>Building with:
>$ make ARCH=um O=.kunit --jobs=8
>ERROR:root:../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_platform_mux_info’:
>../drivers/gpu/drm/xe/display/intel_acpi.c:86:15: error: implicit declaration of function ‘acpi_evaluate_dsm_typed’; did you mean ‘acpi_evaluate_dsm’? [-Werror=implicit-function-declaration]
>   86 |         pkg = acpi_evaluate_dsm_typed(dhandle, &intel_dsm_guid,
>      |               ^~~~~~~~~~~~~~~~~~~~~~~
>      |               acpi_evaluate_dsm
>../drivers/gpu/drm/xe/display/intel_acpi.c:86:13: warning: assignment to ‘union acpi_object *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>   86 |         pkg = acpi_evaluate_dsm_typed(dhandle, &intel_dsm_guid,
>      |             ^
>../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_pci_probe’:
>../drivers/gpu/drm/xe/display/intel_acpi.c:142:14: error: implicit declaration of function ‘acpi_check_dsm’; did you mean ‘acpi_check_region’? [-Werror=implicit-function-declaration]
>  142 |         if (!acpi_check_dsm(dhandle, &intel_dsm_guid, INTEL_DSM_REVISION_ID,
>      |              ^~~~~~~~~~~~~~
>      |              acpi_check_region
>../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
>../drivers/gpu/drm/xe/display/intel_acpi.c:176:6: error: redefinition of ‘intel_register_dsm_handler’
>  176 | void intel_register_dsm_handler(void)
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>In file included from ../drivers/gpu/drm/xe/display/intel_acpi.c:13:
>../drivers/gpu/drm/xe/display/intel_acpi.h:19:20: note: previous definition of ‘intel_register_dsm_handler’ with type ‘void(void)’
>   19 | static inline void intel_register_dsm_handler(void) { return; }
>      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.c:182:6: error: redefinition of ‘intel_unregister_dsm_handler’
>  182 | void intel_unregister_dsm_handler(void)
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.h:20:20: note: previous definition of ‘intel_unregister_dsm_handler’ with type ‘void(void)’
>   20 | static inline void intel_unregister_dsm_handler(void) { return; }
>      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.c:186:6: error: redefinition of ‘intel_dsm_get_bios_data_funcs_supported’
>  186 | void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915)
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.h:22:6: note: previous definition of ‘intel_dsm_get_bios_data_funcs_supported’ with type ‘void(struct xe_device *)’
>   22 | void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915) { return; }
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_dsm_get_bios_data_funcs_supported’:
>../drivers/gpu/drm/xe/display/intel_acpi.c:199:31: warning: suggest braces around empty body in an ‘if’ statement [-Wempty-body]
>  199 |                 ACPI_FREE(obj);
>      |                               ^
>../drivers/gpu/drm/xe/display/intel_acpi.c:188:25: warning: unused variable ‘pdev’ [-Wunused-variable]
>  188 |         struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>      |                         ^~~~
>../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
>../drivers/gpu/drm/xe/display/intel_acpi.c:266:6: error: redefinition of ‘intel_acpi_device_id_update’
>  266 | void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.h:24:6: note: previous definition of ‘intel_acpi_device_id_update’ with type ‘void(struct xe_device *)’
>   24 | void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.c:291:6: error: redefinition of ‘intel_acpi_assign_connector_fwnodes’
>  291 | void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.h:26:6: note: previous definition of ‘intel_acpi_assign_connector_fwnodes’ with type ‘void(struct xe_device *)’
>   26 | void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.c: In function ‘intel_acpi_assign_connector_fwnodes’:
>../drivers/gpu/drm/xe/display/intel_acpi.c:314:32: error: implicit declaration of function ‘acpi_find_child_device’; did you mean ‘acpi_match_device’? [-Werror=implicit-function-declaration]
>  314 |                         adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
>      |                                ^~~~~~~~~~~~~~~~~~~~~~
>      |                                acpi_match_device
>../drivers/gpu/drm/xe/display/intel_acpi.c:314:30: warning: assignment to ‘struct acpi_device *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>  314 |                         adev = acpi_find_child_device(ACPI_COMPANION(drm_dev->dev),
>      |                              ^
>../drivers/gpu/drm/xe/display/intel_acpi.c: At top level:
>../drivers/gpu/drm/xe/display/intel_acpi.c:336:6: error: redefinition of ‘intel_acpi_video_register’
>  336 | void intel_acpi_video_register(struct drm_i915_private *i915)
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>../drivers/gpu/drm/xe/display/intel_acpi.h:28:6: note: previous definition of ‘intel_acpi_video_register’ with type ‘void(struct xe_device *)’
>   28 | void intel_acpi_video_register(struct drm_i915_private *i915) { return; }
>      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>
>The reason is that XE_DISPLAY depends on ACPI. This issue may
>also manifest on other randconfig, so fix the dependencies.
>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Philippe Lecluse <philippe.lecluse@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/Kconfig.debug | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
>index 6726caa63acc..6f7123e90563 100644
>--- a/drivers/gpu/drm/xe/Kconfig.debug
>+++ b/drivers/gpu/drm/xe/Kconfig.debug
>@@ -99,6 +99,7 @@ config DRM_XE_USERPTR_INVAL_INJECT
> config DRM_XE_DISPLAY
> 	bool "Enable display support"
> 	depends on DRM_XE && EXPERT
>+	depends on ACPI
> 	default y
> 	help
> 	  Disable this option only if you want to compile out display support.
>-- 
>2.39.1
>
