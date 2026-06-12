Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EBFCD98D2
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 19:16:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C9510EAF6;
	Fri, 12 Jun 2026 19:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZp/Ylhm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6746310EAF6
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781291767; x=1812827767;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fARzg2fx1JRHJsL8AP0kI6QafKGlGx7VxRtQP/8I22g=;
 b=DZp/YlhmfhrTzYiZAokz0Ony9sNHrzxDoxzNZsG8c13zz9Yygpbzj2i8
 7qMN7v39E4hHQMyndvqFN1/SChApsW3UeFiaLl+YWFr8uNvfcdzPoHLpg
 ympz7C4HjJRfW7uY8ezuDWc7wtcogDsuPdwRpTMsNzAfqbgNfcagsWVVF
 nB0C75nJprcKChWk4T+x25QIfoR/Me8wO7poU4N88vaMkRgDyoBd9Facr
 YnlVJ9xfecig+NrA1KUUROXXOPlj+rLmA7iP4IjeaqfIop13E18WwTyS9
 0M0iI/DCFeNtN4DqYT+K3Qgz2e8kpcnrhh6fNOnKu9qCagtW3784n2Dpk A==;
X-CSE-ConnectionGUID: McqxHq68Q9CrAYAg4jA2uQ==
X-CSE-MsgGUID: u4XR/UTHQ+e8VUYjxHiLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82172242"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="82172242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:16:07 -0700
X-CSE-ConnectionGUID: /NGqJXM5QueewMDAyOnm3Q==
X-CSE-MsgGUID: CwnrSQGTT+2o+u7hMZdZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="277093134"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:16:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:16:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 12:16:06 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8NjSY9O53fb9lxgDFKr9Ouh6Br4pJ58akbXGVJUG9yYbMMCRadLilwrZPiGZ3TWqS4x809vCVWQ4WVer0hP4evIHcGRXQDrm5mj5ri9hNpOZirKiZUrLUDPaxqByISYYFU9UgQmVHPUv6vvzVRXG/waZBezKGTdx1e/FDLyMVf6z3Mu2Pks5K8w1TvUJjOHHrbKrJqZH28hO56h2apa963j9rbr10RGm3Q64qeyGQ0eZQcWE8FUnodLinHK/K20McSQcWBQ6SU62TQntfT9FT1TSF9P8FLJfQFWAzN4OSGsHGIKSHYCsHi4aWjidqyLlEbFxuoyMXpHoKmsGEHnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yx9RHKORPW4Koe2OYSByMS/7v92kTCnkGVAg+UGLv50=;
 b=mr5EwAD5R2e0MUmjoJFPG+Biy5SKqH9f5gLdkelF5vCuXFBvN+mS1isyv1AClrmOVEXQKcb4fgM8B+zidw1FrF3nlNuKKHdKrXATA4qq1ClQl60JLi2fmTCcU4Ld8wqQMjVP2W7I5e77H+Zy5mHrlj0Ak9bRn9XjJngdZitaZhqLCOv58PMF8sG/kKsw3MqR7C5QcgutTc9AaJ9IAqMEeyjXRsegWwrtKwrcOI/Pl1yZPu5KWL3wwbe9JIYtbiRm0c434XJjpODbOIGWzHIfyFTEjd/K948MxxLpzgqzmFagDl0O4/+1kS6Q0WSIrxxTpUwYy9MuwNh1/jkEtOSjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 19:16:04 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:16:04 +0000
Date: Fri, 12 Jun 2026 12:15:59 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/9] drm/xe/rtp: Keep track of non-OA nonpriv slots
Message-ID: <aixa7+GyBKv7T9/c@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608223624.3711760-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:303:b5::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fae63c1-73c7-4d33-e484-08dec8b70c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: sO17wwcZg5kG+ks8JQ6s06M+aFgkiMOKOnaLn4J7soYMemcrIyXMIX5Eiu0bfEuTltNDr+BuOVeo4B7GAIQ66TatU7Kr/1CNJOmYYX0K1QflnjNwYYb+p+eG88jLy0fAkSSonHm21Zk3Xk6UZ+7fB4m9LKE2qj8U0/2E984Hpw03MYD+eKYTphpBa6Fdf+PVJM3RwJsojf/LggZuv1EnxWRUmAMIihE7P9EO2pDDdCi5XLwOh10eqyYvdL/Ne3inVG/kHGZadJSSdAfWqXwxsVYYRo5zo0tt0kqWBF+dLCmuLVfHJci16t6kq/aAAdrd4hwZkMUYCaCD+Meyr4V5x9XV+YePysrkiYpND4JYG0Yym9midR8WuzEZlAQJxyvxJaSdfPgWQCQYqHgAVB33BAcwAYCfVrAP8th16wskn9vXphb6oKOp5wm0g+jgwszANNSG/7eAEj6HFDfH0VsskHHkxgB+w++0+jSYMGCT2vXzcBMXgroa9/I0yYloNv8sdsPJ3v/vLpsNM58uv3xcn28HRul5Ju3Au0Yf3NNMCkdjPot3i5bqh/407Y92qcMjwxoPfVkHkz/uuYPkILj8phSyuHm3NgBgBCkO4G8+b8T3oZS5HnDx+4T41qHQ27x2rDvSrePVqrIqpfprf5I3rqx/6SqiGmHrettqh12uSAsgKdv+ws+38dTG6entbuES
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ayt5ZU5xYmU2M2dYVXNzSUh4aTR3Y3lQdXYzU0J4NmZobzR5SFo4bUNNR2l4?=
 =?utf-8?B?YUxvdktGNHV0MmpRbUNQTFFYYTBCVUR2eGxld0djQSs5WU1qdmhZK1BwOVN4?=
 =?utf-8?B?TW12S1hmdEdDRiswWmczYkU5c0ttOVp6a0RHR3l0QlJXUHcyUE9SZGNoK2NW?=
 =?utf-8?B?WVJKME5YZ2dkNVZzc0EvZHZ6d2Y1QkVjWCtpQnNYNGlDc2VId25ITTlRaFZl?=
 =?utf-8?B?b1NTM2I4RXJOY3FSMjNhMG44YlJUUFVGWjJyY2xRTU5oMFpKRHorTGptM09D?=
 =?utf-8?B?SVRUMHl1K3ZiUnRObWpiY2lQYUViU205bTZ6RHdPYnpRZFkwWER2RXFrYVEr?=
 =?utf-8?B?WThOZjdnWEoxMFFzL2syUXFkWklDY3dsMVJieEJCaDgzY24yTjlnV25MRmI5?=
 =?utf-8?B?WE9kS3IvMTlNS0NZOXRlaHU1amxmYnV6cXlIa3lOaFdSYWxaelJSaXlrRGk2?=
 =?utf-8?B?WXFiV0I2SjlobW0zYVNyNGYwM0RqK2pUVnRuV252NUFaalQ0S1pFWEJMWURl?=
 =?utf-8?B?QW1lZXJsd2VNcUR1c0g0d0tMRDJiaXNxWGY5TDNiZmF3ajVQejBmN1BYNzBj?=
 =?utf-8?B?MjRFQjJEUy9UT3k1RU54V1FsVmkwNElHWGFZUDRlQ2Zxc2p1cWVnbnZQRXVT?=
 =?utf-8?B?RkR0b0I1WDVkM2NDVFhwWXhvOEdZSDYyQjNVWHlRWVduQjBaQXF3NzlvUGt4?=
 =?utf-8?B?TDJrNUpJc0pLYUFXZ2tacGVDZkk2c0lUdmpENFRtWnl3OTdlRWVrRFFZNkth?=
 =?utf-8?B?VmFhZHZIbjNxdVp6QWJRNkVkTlkzVUc0Smw0YzB2YjlmeGloMzZjT3VBUE9J?=
 =?utf-8?B?TC9tUmlETG5yOXErL09Ga2svdFA4Qm5KaW50YnQ5UUNHbFp5eVFwdWlCZ0s1?=
 =?utf-8?B?bTRyYkJReWVMZnhrQmRhbkdNbGFqVU1tN2FzbzR2eDBpaThGM0xMZXZ6VEw5?=
 =?utf-8?B?WDZGVGMvWDk1VGJkYkVONm9McmJVMXFsR3E5MitwdEgvb1BYMkFPQ0oxdUtI?=
 =?utf-8?B?Mkc1cjNtUHNrUFRHY0RqWExjWDV6VUdvZ05sQ3poYStudGlZSHdKR3BGMWF1?=
 =?utf-8?B?WElmbGpCKzRhcU5GaTliQXJJTjRmejVTSU42RGFNYzZDdno0aDdNT3JVYWJs?=
 =?utf-8?B?Z2xjSy9WcDJpNDV4T0lUUmxPc1lFL1p4UGxha2FPeEpYcFpoTnBNRG9RSGJS?=
 =?utf-8?B?d2JydG05Vk9OYXdJSWpNNXRwOWthSUFzZ0xUQ1BrdDdENVoyZFBYaFpjUXIr?=
 =?utf-8?B?VmRFUUMrK0QwcVJaYlVDY2o4bUxrbWI4cVdVT0piY0FaakZZZWkvWkxoQmhC?=
 =?utf-8?B?N3E1bktTd1NoTU8vdTg5czJ2SDdYM2xERzlzOURHQ3pSMVRScmRvS3MyejEy?=
 =?utf-8?B?YWNybmtFYWtIckQrUTlLWFlyNWRpSG9YYmpkM1l6MWtlRXdwaG1xQmRYU3I2?=
 =?utf-8?B?M1JZZW8zT1BEeTR4OUJqZ05XcDBtZFdlWk1TbS90WExQZHprM1BRRDFJVytR?=
 =?utf-8?B?aE1qVUxXUlh0UXlmQnRaVUMzdlFjMU9jb3dqQ0l4WTQyRisxZkUzbDcyWFNM?=
 =?utf-8?B?TzAweG1NYkNsNzZ1UEkrbGRSN2hyRktqSnI2a212bXNucE5KNU1Da1RHYkFY?=
 =?utf-8?B?V3dpMFpaay9FbXFwU0lSbjR3SnN3dk44WGs0S2Y1RjB5R2szU1Z2QTY4SHJx?=
 =?utf-8?B?US9hbmQrYWtjVU9lV3hHTUZrMW5PWE5rYjRrQUI2a2xTakNqcllQN3o1bzZ5?=
 =?utf-8?B?SHlSWGw0aFNXYU02NFk2U3hmZGQ2Yy9QbFd5cFg2V3h4MlFOb3kzSnhaeWdU?=
 =?utf-8?B?bmpHUXhMa2wrV21hMWdRL01KRkZ3Wk1nWmhTZUtzTjNCYmVCdUhReDB2U0Zh?=
 =?utf-8?B?MG5OMDZiUzlKTTZpUUtIWENmM1ljaStWaGh0THRRUmZyVTNNSTZFVEFHNEdn?=
 =?utf-8?B?VU1qbWppc2F2VUhHOXUvcDVPNW9MQkxRM3duckdBVnM0U3pia2ZLa0hBcmV4?=
 =?utf-8?B?b2cwbmF1THpxZmdFR0dKb3RDWHp3Y0g4NUIzWUs3QXU4N0IvbENERjVQWE00?=
 =?utf-8?B?b0RzaFNrY2g5WW4rWXIvekg1SjlXaUltVTdmVnN2c2w2OFdyQjl1ZG1BZFdy?=
 =?utf-8?B?L0NOK0hBbmtGa2VKWS8xV25hT1ZaaURTdjA5MGJldVV6VHl3RlllMkhjVWhm?=
 =?utf-8?B?bmZRaHZaZUtFdEhSZnF4NCsrSkJDSUxRSkJmampmVC9vUUZYVytDbnF2d3JJ?=
 =?utf-8?B?NkF0ZldoVXgvUnZDY2UrSHhWRnB0aUxJOXRscDE2enVOMjdhM0RMemh6TDBD?=
 =?utf-8?B?b1hRRjl0T0FmN2FjdkNQeUZWeDBBV0JsUm5kWmZzWDl2TklLaEthd0JFeVNh?=
 =?utf-8?Q?rjvmYw4txJztgNuA=3D?=
X-Exchange-RoutingPolicyChecked: q4NURRdSsES0kur1Q5MiNjy6eQhET7y3FYhWY3MmPtvv1DtImHEKfYEHyv9MqtdvgNvtaXSqvDyp1SvbDl54MPrMCKvVl6kePvsPeG/kMmSxKO/pPCZIz8D1u/ziEGUspfYb7Q5M3t75rtATh0jS1KwgAyUj44nnsDczc9ROlmO1vwEPo2mzTwBf1bvGbnaUhh4jqi6nNVgCxt6h0Csjkq2KoOVo3Bml0lYERqoOGEak0vINMcbghRuYtM2mEJVptUEybyBSJzaMDTzRCvbqCTmfO+qT43wrxrt4KY7UEWhP/3ShRmYn50cQ+c9gGhld84UATzTB78epT9RgpH6MMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fae63c1-73c7-4d33-e484-08dec8b70c18
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:16:04.2699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5ugiYcQS05sZWGOfElp9yuWOVzewV/loG4BRdW7kHZiELRrqEP0bliu5OBD/dInZvW8ImSKeR4OBGEF9b0B9gDQtTkyHZv+bvBK1viRb4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
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

On Mon, Jun 08, 2026 at 03:36:18PM -0700, Ashutosh Dixit wrote:
>In order to dynamically whitelist/dewhitelist OA registers on OA stream
>open/close, we need to keep track of nonpriv slots occupied by non-OA
>register whitelists.
>
>v2: Introduce hwe->nonpriv_slot (Umesh)
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++++
> drivers/gpu/drm/xe/xe_reg_whitelist.c   | 8 ++++++--
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>index 84c097da9b6f2..11fa6d5f2f680 100644
>--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>@@ -138,6 +138,10 @@ struct xe_hw_engine {
> 	 * @oa_sr: oa nonpriv whitelist registers, changed on oa stream open/close
> 	 */
> 	struct xe_reg_sr oa_sr;
>+	/**
>+	 * @nonpriv_slot: Next available nonpriv slot
>+	 */
>+	u32 nonpriv_slot;
> 	/**
> 	 * @reg_lrc: LRC workaround registers
> 	 */
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 6d642c2f6fd76..571a8e6909422 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -161,7 +161,7 @@ static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
> 	},
> );
>
>-static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> {
> 	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> 	struct xe_reg_sr_entry *entry;
>@@ -193,6 +193,9 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>
> 		slot++;
> 	}
>+
>+	hwe->nonpriv_slot = slot;
>+	return slot;

I was imaginign this function will not return anything once nonpriv_slot 
is part of hwe.

> }
>
> /**
>@@ -206,9 +209,10 @@ static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> {
> 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>+	int first_oa_slot;
>
> 	xe_rtp_process_to_sr(&ctx, &register_whitelist, &hwe->reg_whitelist, false);
>-	whitelist_apply_to_hwe(hwe);
>+	first_oa_slot = whitelist_apply_to_hwe(hwe);

No need to store first_oa_slot. You can just use hwe->nonpriv_slot.

Umesh
>
> 	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
> }
>-- 
>2.54.0
>
