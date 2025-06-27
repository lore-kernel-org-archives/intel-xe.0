Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5158CC7EE31
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 14:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115EB10EA1E;
	Fri, 27 Jun 2025 14:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QH1wkbNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE20C10EA1E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 14:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751035201; x=1782571201;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5qzaBn2ItpWvCx/6u8cZkVQILJRReQEJhCBgoqIlq1k=;
 b=QH1wkbNEZ/7pHz2hFX6oln1umFmQMhp3AOAnx1Lg54JnTpSpSyBQ7/u0
 8oeHR3re+yR5j3MdwjDfvPqqdhAo1KWLdmL9p28tyoWyjAeFy6UD/M8af
 7zJJkeRmQlSuSpJNERHdl/IWv/yEnZLlbnkx98V+NMPaL2iK+Ldzjlmbd
 QHotm/pYKv7mndJE9kXgDEZb3XCGt3dJUnJaz2fO/8LC68xsoLZhHhiVf
 6MbPXIv/eIeGgB2H4439hlZCOTRuqbM3dXTSjC/aisvzg+8mpFYSyelOu
 x+QkGHsfyxL5aujchiGZzH0Efkg2w34EDqQ/4GWKsBZlgkOF2wf3je2dO A==;
X-CSE-ConnectionGUID: V4lDBk9UR9aI6F4Szc4OqA==
X-CSE-MsgGUID: NzUIs4GgSNSqAFjMK6IBcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="52581694"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="52581694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:39:59 -0700
X-CSE-ConnectionGUID: 2LoQEAadTY+qaZ3U9Dguzg==
X-CSE-MsgGUID: 3A0iWVAuQ16GXjnoumjf+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="158305865"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 07:39:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 07:39:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 07:39:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 07:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JugzWvP0UepEqN7pjxlDiVIuq0IAJCeQGiph7qTgqUgn56GgJDfsOD1O7WEH7oWbJ/Tr27/6bgxlD26jliqmD0MIX/a+qHQKzh6+ilJdKwDCKPD6pKphU7CufBZljrI+X+WSAwKiYN9sIlYWYe3mguK2u/DBZnpxN5kxuXVhrM7mBqqGRfH8I5YmLqFBh9hJ2Ljacu2Rbe0wsklVxNaqCYKAXbYbDHIYQaYS35zyqghBf0Q7rd97APdBEJTGWjtPcvGUPv9T+yyPmhVXsoK0JRxLNFqVy8gt0IbdOHAJsDsXT8JPa/BWP5tL/V5K3TZzLnJW0lmu5mlbdNbYfirceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJuAd0qF1QTbE/QY0hQkrf3JRZMvfG2YbbLpSiRVZ7E=;
 b=R9WZeFFneqjTFTB95gFwUzHinawpVr9FfDyAbTpTOR1jjLqCkTEYj+B+KkNjueEWhe6FtoHjdw4/EaCN1Mq1RQJfBAMtUZruucMdOqpw1fhUOMbbJM5oguuJfZMa+Nj1WfhfsfVuUp0eOcvMTKWmE4oUIEmMflgCJPJOEf74o7lwXyCrJpYyjw8I+sVUURDUHzX5GHgDOLUfRiRr2szdWOGd9aGa820/990ppaZcEsF3Vi355/WOzFUrB+xFOT8hZ3IANHo+5RzDLrq+d56hhwC/+rSCPrWDVogDZLgmmhonD8ihT5jyMUJh/sEcEKLjkzU8OLdrbuerYFX9GnPgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 27 Jun
 2025 14:39:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Fri, 27 Jun 2025
 14:39:28 +0000
Date: Fri, 27 Jun 2025 16:39:26 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/7] drm/xe: Introduce xe_gt_is_main_type helper
Message-ID: <20250627143926.o46yzz4qwjbu3zx7@intel.com>
References: <20250627124916.1392-1-michal.wajdeczko@intel.com>
 <20250627124916.1392-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627124916.1392-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0246.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: da4f35f4-7fbb-4596-5400-08ddb5886bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0c1bjErc3NXa2JjaFJrOHlYZ3ZtdzlwOHYybnk2ZE9Nem05Q29mNGZ4bFJO?=
 =?utf-8?B?ajhBSUd2K0YxSDVnZU13ZEUxdUwvWHVtQlAxNWp2L0YzQU15TkZFYy9lcG1B?=
 =?utf-8?B?WUNoenZFVVhqL2I2MVBIM3Jkb2FuaWIzb1c4cU84b1hFbXZLc2ozOUp1MXVQ?=
 =?utf-8?B?bGZwL2hidDZnM3lSMUxINm9Hb2NNWnViRnRKRWQ0blVaQ1FZUGhoV0lQTVgx?=
 =?utf-8?B?Tk43WlJncm10T3c1bXpRb00zUzU5YkJMN1dRZmJ4MTFKbGdrZ25nMk1VaUlh?=
 =?utf-8?B?eTZ3VWY3d0hwaWdickVZRmRveTBxejJDOVRyMWZEQ0J2aXhEVHZZRjZiQjdT?=
 =?utf-8?B?c1ZzbDdsVDRUbEt1RDRWZHcranF1UUZncEsxVXhuOTBpYTR6b0E1SnpoeGUx?=
 =?utf-8?B?cUVSSzgzQmpiZTFWTU5tTkpkY3JOMTBZUkpLbStTZmhWdVpWWE8wb0c5NGpj?=
 =?utf-8?B?dzZldmxrMDdGZEtEaVA4MUxMYmJlZlRUTmJGcElTdktTSnp4TWhEMmIrT3FP?=
 =?utf-8?B?YndWK0hlcTduR25oM3lSdFdvbEMvWmEzUFBndjk5cW9pMk1kQlRHWGdNSmFO?=
 =?utf-8?B?MmdxSGFjK1hRZEY0Y3Z2SkhNbDhyd2R0OVZyYXhwTXd0bWxIbDlySjdBZXRx?=
 =?utf-8?B?R3pKM0ZqVkVwd1VxNGhobHVuY0dhSHdHb0E0SkJKekZUR0xyajVrZG40d0lv?=
 =?utf-8?B?MlFTWUJxS29QOUhrQUVLNytPa2EwbDR5SGlZemRjcjRqVkpCNyt6aFMramts?=
 =?utf-8?B?RGhTdE4xMFZZSElVcURzbWtTcmtiNCtrdCsyTjdlTHNkeDdtOFNwM0F5anBx?=
 =?utf-8?B?anFnOW9veW9PdjZWajBnaVRtRjlXRFN5c3lZVkRQT0JaZEhvVUZISkV5UUts?=
 =?utf-8?B?dkpTQVM1VDVSWWxDcy9iNnRRNWovbkpRV1JCeUJoRG4rY3BjMDJJeEREcjhk?=
 =?utf-8?B?bnMxcVYvdUVBcUFjZzZ2WVliUG9qZXEycnhYV0xHdmc3b2cyOWc0b2RJMHBV?=
 =?utf-8?B?enQ4My8ySUY5dnNPd2l5QVV2V1hXRGxWYU42cUFlN2xmNE84OUpDd3h2RHEz?=
 =?utf-8?B?M2xEWkpGZ241dTk4VDlaS1NoeEFYTkFYek9NazFiYVF0d3gwMVg4aUNGTUY3?=
 =?utf-8?B?N2xOVzdvUHp0b3NPNjB4YUJhWnQ2eVZIRzNYRE9QcUxqZis2YURFTEZrZG80?=
 =?utf-8?B?TGhDanZUaWYzVVVMd2dBNE1ybXYvaDBLSk1TSDl1akZONWVRa1M2bWpSZWlG?=
 =?utf-8?B?NnlBY1A4Rjl4bjZuQzlKSFcySUxmTG1LdFJ2ZW8zMVZESHkzdnZKNUx2ZTRu?=
 =?utf-8?B?MTJEb0RaVW1ZaGtDUjJXTE9zbkV5QTlGS2dNV1lOMGE3bG0vaDdzTzJyR2h1?=
 =?utf-8?B?amZGVDlSOTZZRGtHYU9TZm5LQkkvZDVCYjNUVkc4ZEZ6RHRkV0ZrYUdLVXgx?=
 =?utf-8?B?UTEvdnBDT25KU0RnS0VQc3BsZGcxQlgybzgzRTg0YlorVExzcXNPcHdDeVFz?=
 =?utf-8?B?SEJVQnhqNXpJdUo5NnFuaFJpblBrMnVnWUhNeWZuZTcxQ2dEcWdhelN4M0N5?=
 =?utf-8?B?Vk1wOGI5NkNpUWJLZ2RHN0pCUVI2bWZEWjlmMlNlK3lXbldZSWp5bG01WlAz?=
 =?utf-8?B?b21MdWlENnA3aG1wNzRyOXpYVmdiOHV6clMwOVc0c2l0NzFvVUEzRzR5WEti?=
 =?utf-8?B?MzRwQlN5UUlrcTVENzB6QkJRbjd0Sm96ejBRRGl5bk5BUW5ndUgxZEJPdEJH?=
 =?utf-8?B?N1FwWXRYdTRZRXVES0RyNFI2MDlUVWZuL1prN2JST3ZOaUw3L2dkdFVRSVBz?=
 =?utf-8?B?UGxCdUJ4SmU3akxnL1RZR0JpYnBEZmFHS3RWbUR2RS9HMDk2SDU2bjdIYU9Y?=
 =?utf-8?B?aHpkMTNhZnVlUnRzOGdIaEl4S2hmVC93WFEyWThaUDJOWEwycnA4OUk3OGw2?=
 =?utf-8?Q?TWWxWyZAYSM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzhiTVozTTU2WFlza25BQUZaYUttOFFDUGNRMVR6SUdITU5GeE5KMENNMG43?=
 =?utf-8?B?bFgzTnQzOGlrVGxrQU5XYUY3cFRJdTc2OFRqdk93Wkg0S2d4eU1sR3NuZlE5?=
 =?utf-8?B?cTlCcnpCMU9OUDhWYTN5MVpaWVZYbmx3MjdMZlMwbEIyUjBPYTFOWDBhVVBw?=
 =?utf-8?B?QUg4WDFlVmNOTUkybVNSanhSYTJ1bm5TMk54dnJxYXVmb25zTTZuV3FEbm85?=
 =?utf-8?B?clNRa2NYbm5sTXpLajQzT3ZpVE5uWkFpVXdJRzlQQ0tNRHZ2c2lqVjVLN3Fq?=
 =?utf-8?B?azNXN1M0cGxiZ3RPQlNFcEQrMFFSRVR4U1hablg5ak1GTEV5YjFndzFQY3ls?=
 =?utf-8?B?QmNlVEJ2c1NrSzdPcUFBVXA2QVk0aDVpQXkzY3VuWUNrdkFsNUd2NE14YkdV?=
 =?utf-8?B?ZmxFajRQTEEybkZPSVhlUlE0czhDWThKVmNyd0RJNDBhcG1qME9NNkoxcUxt?=
 =?utf-8?B?RXhmSHloQ0hpZ3IrUkpya1BIWnhkZzJtSUYzYUdOblVUL0VaR2FpbWc2U2xD?=
 =?utf-8?B?UE1LWjJpTG52QVhqT3hHTUtKamxEYVNOU0hUdVlqeVplT1hwQzJuNGRnZkdT?=
 =?utf-8?B?SGtTTGExdGtaVHhYM05jVXFKLzg0akFSMDFIM1dmZG9QMG5GY21uRGZIMVFv?=
 =?utf-8?B?UW5ka3kyNnpRZ2RuMTgzYlN4NFNMRXRNeFJHdVhoS3dFd1U3TGg2ME9vZ2RG?=
 =?utf-8?B?S2xmRFNONldyOHhZdlg2cHAwVkpRbFp0RkxORGRDanp4Z1ZOaEtxdE10WEhu?=
 =?utf-8?B?eTh1R1NOZFc3S0N5M0VQUXVyRjNyNHE4aXEzQkgrT3BKUDJnUldEY2RJS3Ny?=
 =?utf-8?B?K3FJQk1KSzRUTHhxOEl5UUNnOTdqclVoUjE5R1cyZXU3RERZT2VQRlZTUzZa?=
 =?utf-8?B?Ym5aNlJTdHdMZDIrUGZ6ZkNXZjBEcGZYTTl4MmtFdnkzWlRWQ0FNcEtDR1hh?=
 =?utf-8?B?MEVndCt3amRVUVNrUWMwRXJFdGMyZUs3cGVFTGNZaDVEeEozZ3lqOE93U3lC?=
 =?utf-8?B?Vko5VUdWSWY5SXVlUWFwbzd3d3A1dEhxcUN0UzNMTk9mV1g3anl0dnhyekNx?=
 =?utf-8?B?ZzhsWktjL0xPOGx2c2dNMXF1NzF4Q0h5bDdJbU5zQXhnRXlUajZ0L3hZWnU0?=
 =?utf-8?B?SGZYOWp1RnNFY0Y3VkVHTDcyMDJrQ0h0a2tHVGhuRC9UN04zajEwTGl4bkRS?=
 =?utf-8?B?emlzYUZDVWtIZkFsaEZWdUV5a0dJVm5DeXYwUGJoZzFyV0c2WXBmN0VuNnZh?=
 =?utf-8?B?ZXRwc1ZBTGVBWkxzSHNUc3dLeXFFT0dZVXVkUFk4eGRXT1F5QXpoS1lEN3Y4?=
 =?utf-8?B?aUZDQWhZOFp2K2g0OENjUGFjZzFQN3NzbjJ3bW5Hd1gxRTlnRlYyV1hSRlpQ?=
 =?utf-8?B?MjV0SXA4L3JLYldrOWVlU3BKUGxTbmVySWJ1M3dOdThJR2lkVGIwR3k1S21K?=
 =?utf-8?B?RzdwRVBMZWlseFdUTU1lSU1NWnpPTEZvbVAvODZLMmtrWFZSZmk5dFEyMGo2?=
 =?utf-8?B?WVVZbXIxTTNXL3NyeC9PL3IzR2NZZTFTbiszbmQvSzR1ZHNrVXR2ODQ3WkJ6?=
 =?utf-8?B?MUFSTXJBcUs0WnFVWjJacklDbEdmOHZHaHpIbW4xaCsrV0ZNNVNhTkNUT2xp?=
 =?utf-8?B?bHB4SkZGSStaNFlMcWNJUy9TSVdwNkZnYkVSbEZ6ZlU0Unp2emIyc3ZjTDJS?=
 =?utf-8?B?eHdoVjhNOWNJVGNpOHV1UFlWTm9KS1FEV3lKYmFrMGlDOXUvR3hVZ2FFRVA2?=
 =?utf-8?B?aUEzL2F2MkNERzJOVjNlWGJ2bnRveEVmL2NTcngxbWpkNkNIamwxMy9kYUVz?=
 =?utf-8?B?M1FiSUVIWVM2NFJqOWREUEh0ODlFU1VBRi9xNFdvcnc3aGVrWkNkUzI0QXlV?=
 =?utf-8?B?VFduSDU2d3JwMmpXQVFYRWVhd2o1YlVIek1xTHB4TWx6eC9ydmFnbjNqRWVF?=
 =?utf-8?B?UlRWUHB4N1BVKy84T29PcmJCMVpIdUdYdFhIM0Y2MkZpR3UrbWlRR2U5Ynhu?=
 =?utf-8?B?MVhBcUZCY21GemxjMjlhYkcrSElMaEFaaERwNjRRRFJqRHFweTRMZklXR3hB?=
 =?utf-8?B?M09FY0huVG52U2hKV2NwQlVrMUdIM1M3alhmTzltZGZaV2huZ25pb0VvVWs1?=
 =?utf-8?B?UU9mbWVEQkhYei9TUUtmdjNMSVNIVlZuY1Nka1B1U0c3TzFJb0VVdkNnbG5x?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da4f35f4-7fbb-4596-5400-08ddb5886bb1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 14:39:28.5574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7S/DGsRYPWf91P8xShapPX/ailuNUSI8KcRzjXgytkJRs12D8Ufd7wdGTXCMjCOgiPW6lJH3WX9HyT8ErByCnfcyD0kuVcnDQZl1TJ6sjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-cze-27 14:49:13 +0200]:
> Instead of checking for not being a media type GT provide a small
> helper to explicitly express our intentions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bb.c                  |  2 +-
>  drivers/gpu/drm/xe/xe_force_wake.c          |  2 +-
>  drivers/gpu/drm/xe/xe_gt.c                  | 12 ++++-----
>  drivers/gpu/drm/xe/xe_gt.h                  |  5 ++++
>  drivers/gpu/drm/xe/xe_gt_idle.c             |  2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 30 ++++++++++-----------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c |  4 +--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |  6 ++---
>  drivers/gpu/drm/xe/xe_irq.c                 |  4 +--
>  drivers/gpu/drm/xe/xe_oa.c                  |  6 ++---
>  10 files changed, 39 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 9570672fce33..5ce0e26822f2 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -19,7 +19,7 @@ static int bb_prefetch(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (GRAPHICS_VERx100(xe) >= 1250 && !xe_gt_is_media_type(gt))
> +	if (GRAPHICS_VERx100(xe) >= 1250 && xe_gt_is_main_type(gt))
>  		/*
>  		 * RCS and CCS require 1K, although other engines would be
>  		 * okay with 512.
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 8a5cba22b586..c59a9b330697 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -64,7 +64,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  {
>  	int i, j;
>  
> -	if (!xe_gt_is_media_type(gt))
> +	if (xe_gt_is_main_type(gt))
>  		init_domain(fw, XE_FW_DOMAIN_ID_RENDER,
>  			    FORCEWAKE_RENDER,
>  			    FORCEWAKE_ACK_RENDER);
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 9752a38c0162..387535748aa9 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -112,7 +112,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>  	if (!fw_ref)
>  		return;
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>  		reg |= CG_DIS_CNTLBUS;
>  		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
> @@ -442,7 +442,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>  	if (!fw_ref)
>  		return -ETIMEDOUT;
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
>  		if (err)
>  			goto err_force_wake;
> @@ -518,7 +518,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  	if (err)
>  		goto err_force_wake;
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		/*
>  		 * USM has its only SA pool to non-block behind user operations
>  		 */
> @@ -534,7 +534,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  		}
>  	}
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		struct xe_tile *tile = gt_to_tile(gt);
>  
>  		tile->migrate = xe_migrate_init(tile);
> @@ -554,7 +554,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>  		xe_gt_apply_ccs_mode(gt);
>  	}
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
>  		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>  
>  	if (IS_SRIOV_PF(gt_to_xe(gt))) {
> @@ -784,7 +784,7 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_is_main_type(gt))
>  		xe_lmtt_init_hw(&gt_to_tile(gt)->sriov.pf.lmtt);
>  
>  	if (IS_SRIOV_PF(gt_to_xe(gt)))
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 187fa6490eaf..b9591e8a5634 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -107,6 +107,11 @@ static inline bool xe_gt_has_indirect_ring_state(struct xe_gt *gt)
>  	       xe_device_uc_enabled(gt_to_xe(gt));
>  }
>  
> +static inline bool xe_gt_is_main_type(struct xe_gt *gt)
> +{
> +	return gt->info.type == XE_GT_TYPE_MAIN;
> +}
> +
>  static inline bool xe_gt_is_media_type(struct xe_gt *gt)
>  {
>  	return gt->info.type == XE_GT_TYPE_MEDIA;
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index c11206410a4d..ffb210216aa9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -121,7 +121,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
>  	if (vcs_mask || vecs_mask)
>  		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
>  
> -	if (!xe_gt_is_media_type(gt))
> +	if (xe_gt_is_main_type(gt))
>  		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
>  
>  	if (xe->info.platform != XE_DG1) {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 3556c41c041b..6f51c09b0451 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -376,7 +376,7 @@ static u64 pf_get_spare_ggtt(struct xe_gt *gt)
>  {
>  	u64 spare;
>  
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> @@ -388,7 +388,7 @@ static u64 pf_get_spare_ggtt(struct xe_gt *gt)
>  
>  static int pf_set_spare_ggtt(struct xe_gt *gt, u64 size)
>  {
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
> @@ -443,7 +443,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	int err;
>  
>  	xe_gt_assert(gt, vfid);
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  
>  	size = round_up(size, alignment);
> @@ -492,7 +492,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  	struct xe_ggtt_node *node = config->ggtt_region;
>  
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
>  }
>  
> @@ -560,7 +560,7 @@ int xe_gt_sriov_pf_config_set_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size
>  {
>  	int err;
>  
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	if (vfid)
> @@ -622,7 +622,7 @@ int xe_gt_sriov_pf_config_bulk_set_ggtt(struct xe_gt *gt, unsigned int vfid,
>  	int err = 0;
>  
>  	xe_gt_assert(gt, vfid);
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
>  	if (!num_vfs)
>  		return 0;
> @@ -693,7 +693,7 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, num_vfs);
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>  	fair = pf_estimate_fair_ggtt(gt, num_vfs);
> @@ -1406,7 +1406,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
>  static void pf_release_vf_config_lmem(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
>  	xe_gt_assert(gt, IS_DGFX(gt_to_xe(gt)));
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>  
>  	if (config->lmem_obj) {
> @@ -1425,7 +1425,7 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
>  
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, IS_DGFX(xe));
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
>  	size = round_up(size, pf_get_lmem_alignment(gt));
>  
> @@ -1552,7 +1552,7 @@ int xe_gt_sriov_pf_config_bulk_set_lmem(struct xe_gt *gt, unsigned int vfid,
>  	int err = 0;
>  
>  	xe_gt_assert(gt, vfid);
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
>  	if (!num_vfs)
>  		return 0;
> @@ -1629,7 +1629,7 @@ int xe_gt_sriov_pf_config_set_fair_lmem(struct xe_gt *gt, unsigned int vfid,
>  
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, num_vfs);
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
>  	if (!xe_device_has_lmtt(gt_to_xe(gt)))
>  		return 0;
> @@ -1663,7 +1663,7 @@ int xe_gt_sriov_pf_config_set_fair(struct xe_gt *gt, unsigned int vfid,
>  	xe_gt_assert(gt, vfid);
>  	xe_gt_assert(gt, num_vfs);
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		err = xe_gt_sriov_pf_config_set_fair_ggtt(gt, vfid, num_vfs);
>  		result = result ?: err;
>  		err = xe_gt_sriov_pf_config_set_fair_lmem(gt, vfid, num_vfs);
> @@ -1991,7 +1991,7 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
>  	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		pf_release_vf_config_ggtt(gt, config);
>  		if (IS_DGFX(xe)) {
>  			pf_release_vf_config_lmem(gt, config);
> @@ -2082,7 +2082,7 @@ static int pf_sanitize_vf_resources(struct xe_gt *gt, u32 vfid, long timeout)
>  	 * Only GGTT and LMEM requires to be cleared by the PF.
>  	 * GuC doorbell IDs and context IDs do not need any clearing.
>  	 */
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		pf_sanitize_ggtt(config->ggtt_region, vfid);
>  		if (IS_DGFX(xe))
>  			err = pf_sanitize_lmem(tile, config->lmem_obj, timeout);
> @@ -2149,7 +2149,7 @@ static int pf_validate_vf_config(struct xe_gt *gt, unsigned int vfid)
>  {
>  	struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
>  	struct xe_device *xe = gt_to_xe(gt);
> -	bool is_primary = !xe_gt_is_media_type(gt);
> +	bool is_primary = xe_gt_is_main_type(gt);
>  	bool valid_ggtt, valid_ctxs, valid_dbs;
>  	bool valid_any, valid_all;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 13970d5a2867..9b7772928d62 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -305,7 +305,7 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
>  	xe_gt_assert(gt, gt == extract_gt(parent));
>  	xe_gt_assert(gt, vfid == extract_vfid(parent));
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>  					   0644, parent, parent, &ggtt_fops);
>  		if (xe_device_has_lmtt(gt_to_xe(gt)))
> @@ -554,7 +554,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	pfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		drm_debugfs_create_files(pf_ggtt_info,
>  					 ARRAY_SIZE(pf_ggtt_info),
>  					 pfdentry, minor);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 9b2fc9db55b8..09dc19177a7d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -552,7 +552,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> -	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
> +	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
>  		err = vf_get_lmem_info(gt);
>  		if (unlikely(err))
>  			return err;
> @@ -649,7 +649,7 @@ s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	xe_gt_assert(gt, xe_gt_is_main_type(gt));
>  
>  	return config->ggtt_shift;
>  }
> @@ -1037,7 +1037,7 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
>  
>  	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
>  
> -	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
> +	if (IS_DGFX(xe) && xe_gt_is_main_type(gt)) {
>  		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
>  		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 1e6540ce9914..14bbc6aae40c 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -160,7 +160,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  	dmask = irqs << 16 | irqs;
>  	smask = irqs << 16;
>  
> -	if (!xe_gt_is_media_type(gt)) {
> +	if (xe_gt_is_main_type(gt)) {
>  		/* Enable interrupts for each engine class */
>  		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
>  		if (ccs_mask)
> @@ -260,7 +260,7 @@ gt_engine_identity(struct xe_device *xe,
>  static void
>  gt_other_irq_handler(struct xe_gt *gt, const u8 instance, const u16 iir)
>  {
> -	if (instance == OTHER_GUC_INSTANCE && !xe_gt_is_media_type(gt))
> +	if (instance == OTHER_GUC_INSTANCE && xe_gt_is_main_type(gt))
>  		return xe_guc_irq_handler(&gt->uc.guc, iir);
>  	if (instance == OTHER_MEDIA_GUC_INSTANCE && xe_gt_is_media_type(gt))
>  		return xe_guc_irq_handler(&gt->uc.guc, iir);
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 4829ed46a8b4..02dd8ddbbab3 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2493,7 +2493,7 @@ int xe_oa_register(struct xe_device *xe)
>  
>  static u32 num_oa_units_per_gt(struct xe_gt *gt)
>  {
> -	if (!xe_gt_is_media_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
> +	if (xe_gt_is_main_type(gt) || GRAPHICS_VER(gt_to_xe(gt)) < 20)
>  		return 1;
>  	else if (!IS_DGFX(gt_to_xe(gt)))
>  		return XE_OAM_UNIT_SCMI_0 + 1; /* SAG + SCMI_0 */
> @@ -2506,7 +2506,7 @@ static u32 __hwe_oam_unit(struct xe_hw_engine *hwe)
>  	if (GRAPHICS_VERx100(gt_to_xe(hwe->gt)) < 1270)
>  		return XE_OA_UNIT_INVALID;
>  
> -	xe_gt_WARN_ON(hwe->gt, !xe_gt_is_media_type(hwe->gt));
> +	xe_gt_WARN_ON(hwe->gt, xe_gt_is_main_type(hwe->gt));
>  
>  	if (GRAPHICS_VER(gt_to_xe(hwe->gt)) < 20)
>  		return 0;
> @@ -2589,7 +2589,7 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
>  	for (i = 0; i < num_units; i++) {
>  		struct xe_oa_unit *u = &gt->oa.oa_unit[i];
>  
> -		if (!xe_gt_is_media_type(gt)) {
> +		if (xe_gt_is_main_type(gt)) {
>  			u->regs = __oag_regs();
>  			u->type = DRM_XE_OA_UNIT_TYPE_OAG;
>  		} else {
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
