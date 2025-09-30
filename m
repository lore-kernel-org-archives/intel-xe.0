Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851BDCCA468
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 15:22:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A4510E5F9;
	Tue, 30 Sep 2025 15:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmGpqOvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453F110E5F9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759245745; x=1790781745;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0vc1EOKHKfMqROdNF7yQV97vFy2Lsuosr73YgjgHBBE=;
 b=jmGpqOvibQMBokYhHl8ndS7VU/HNZ6h3IqIMWcIVzdj6VzIjYTRMvpgg
 BukMMQvLPiQVsZfUud94crwCPwSK/wWvpzKJUvxPzcGGqb6rFq69LuAJc
 xb1jlSgfR3p9PwVC1lGt4uSKUFIOwarTeQXt76U7H8EpI6GisWDqrt0KP
 +WPSjB4G3ynEQW02pwqnIsa9I9Xrel8J/DGqT5vPv2OZFfG8lDlVPLeXT
 TYbsNmGuP+6rKy8BqB50jVTcZryX4HpBI+ldF0+IXRsA4JLLZ/nO/6LCN
 FNJy2/PHAsLpHOyamrLKkI3o6mLVUmI6xoIf7/+ZBqd+vOmU+umz2cYQD Q==;
X-CSE-ConnectionGUID: PRAJjtYcRU+ARs2KmiBPbw==
X-CSE-MsgGUID: xUBKAGC+SRK66UO+th6x+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="64126187"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="64126187"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:22:25 -0700
X-CSE-ConnectionGUID: ApQBTEgpTpydTbsR+yrVhg==
X-CSE-MsgGUID: +PxmIJo1RByl+yxcTitqfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="178590668"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 08:22:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:22:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 08:22:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 08:22:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cw4ScfYTP6YdZU/Lv3hxzA1ciE3dtr06zl2RjnJNVpFDRwNK4i74rMoNbtGCCF+BB38UfLpif8JmVH0zHo/NSAL90AB4vMdYpgKTSdU5LFBeIWEs7L6SRl1+pVWkKCTcG2bKlJsqa2cHMW1R/OP1nOzB2oXPJiQUCKhtptYvgrn2mqWSxlmKKUHGQLWOe/0isGeHOoFynPuKU83ZUImJgJWTyGq20NGa2nDm8G9yD5taB1MA4BoBwdPshTATUHs24ae6niTRBOO9ULDRblSYh7i09fv8PsR2Qf7NdsQGDygxilA9v1yhfDG2WpocV2WrqIsOs+ig7/qyvrHBwBt78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8piJRgzBuMn24xdKU+Vs8l708ny7fQ9yXD2r3lqUiBo=;
 b=WLJRZ9XL6Zam+uvqBz69ZbqtgGplIpU9/gIjREfrqZsI0O0k118dgahWhDJMhqEY/oGcGKfwbqdhM6HN4lsX9iwHl/fyjoTF70BPBzfNFUMD0aTbbOlW1wPTPnVEyhAb+AuJKmMj+NtFVwTiYxRq2uUhHwJEAlxGVqiRzCUV/Vu99veJLbA/Mp0yCbIUJ/KfLlwQln3d0MiMleqOp77Ix0EMJh3oRDNCup5K0mnwrWpUX7ddQNdM0Wr4T8wb5FJGcImKtOlXtOr0CWPst4x26wcV8KNPAJSjtkzpU2agLmaxsZ+gruIpPg2gU8sAMjOR6ypST6Ohru9KKHqpzgSNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 15:22:20 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 15:22:20 +0000
Message-ID: <4f562a82-930c-4a06-85ce-2d88c885d65f@intel.com>
Date: Tue, 30 Sep 2025 17:22:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/36] Revert "drm/xe/vf: Rebase exec queue parallel
 commands during migration recovery"
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-4-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929025542.1486303-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0226.eurprd08.prod.outlook.com
 (2603:10a6:802:15::35) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ0PR11MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ce076a-493a-4fd2-e4fe-08de003525be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTUxalRYNXBub082YmpKT2RMYURGbUh5b3BhQzB4VzVtRVE5NElGNVR0cWo1?=
 =?utf-8?B?anozQ3krNzlaY1Iwb2FWRHM5ZU1YcjVZY2xTQWlmM1lTcDFWK0dsL0hTL2Fk?=
 =?utf-8?B?R3BKLy9SMlhYc042N0J3TEIxMmQ2WmVsallJWWg3NXd4UlA3OVk0SG5WcDhs?=
 =?utf-8?B?dFJDRSs0aENuNDVraW1jdi9KTzVneVRVaThDSDRZRHo4eEhqbkNBZ0xmbjI2?=
 =?utf-8?B?TVhFRG5TdmtMekdvMWFsc1NCZ0txd3pZZU5VajZjRlFtV1NndkVWQVlmTXlR?=
 =?utf-8?B?cnZ1RXdaSmxsSVBkL1UrZktuRXptdm1aVSs5Sml1Q1o5M2M5UnN5Ujd4SzJ4?=
 =?utf-8?B?UmF5WFlpK3dicHR5Nnp4ZTY0ZE9vNnptaVVHeWdEMnRmS0RWTFovTTFBcng3?=
 =?utf-8?B?VXlNcFgwd3NSOEdvci9OamdrbWIzdFNPcGNkVDRjcFFGVHA2QXM0WlFmMGpE?=
 =?utf-8?B?bHBRN2lhdGtjNGVhZmZXUEsycEl3SVc3Zk9mcGlzT09KU1A4RElzdkh5WUJH?=
 =?utf-8?B?bm9qWDZweW9EeDY0Tmg4VXJDd29VY3dqOFZ4VGtZbityZXYzTW9qdThHcUFn?=
 =?utf-8?B?OGJYcDRiS3NWVkxBYTkydEFFZjJ0MGJSR1NZT2NsMkg4dXROa25CU1FDZUZJ?=
 =?utf-8?B?UWRTSDU5L21ONmIvV1lxZXdDb1hNVmNDdFFLZENITllzTG5RaFA1OWE4eTFX?=
 =?utf-8?B?azlKbFNCTmJQNWhaQjdVU1A5RTJseGVIQ1MxMnZqZExGdjVvZTF3NDUrUFRS?=
 =?utf-8?B?MWd1YkhuVnNDdmEraDA1S0NPSW1SaVYxSmwyZUk1SGZxdkVyRXdQK0dnejFP?=
 =?utf-8?B?dXhEUU5Oc3lqR2dacjZHamRtazZaalVCeXN2WHY4aGdxbnNRRHdsVTZTWHVE?=
 =?utf-8?B?NkYzZ1ZtYWkwTDRaekxlMEhKV1gvMUNueDM3UTNUNVZMbDJPWGxVTWRPSFZJ?=
 =?utf-8?B?VjBzQmhPMFAxUC9sQ3JBQzJLK3dQckVYbkdnMXFLQUV6N3pnMWNrM1VLYUxk?=
 =?utf-8?B?RjA2RmdzSWdGcFhqYWEzQXc0SENIdmZIV2l3K1FzeWNiV0Z1VUF6VndZM1pY?=
 =?utf-8?B?eUJ3RWw0b05NRXhsQmQ2U2cwZmZWS3NMYkJuQ2ptMmFQUk9ieElheURaYi9E?=
 =?utf-8?B?NG5VR25od0ZRNVpBdXlzbmQ0QW5mWk1SWkhzL0pDY0RHY3NsV0w5WnhXdDgz?=
 =?utf-8?B?b0h2dDlMY3c4Wlp4WXJhWmdZY1JMSEhBNURVeGYzTnFIM1VzU2FNanJFN3hC?=
 =?utf-8?B?WnZ2ZHpHUkVuYWMva0NVdVc5ZEFDSlh3dHhIWHRZa09NbnBweUZHUDFRR0F4?=
 =?utf-8?B?bC92Nmw0eVN3OTMvRFNaelA3dnJlVjhlU2grOUhvaURXTG10Z1dyN0RPaGIw?=
 =?utf-8?B?YU5QTnFPbjZmOWZMQ2JybHhTaS81WWtGK0lZaktMV0JrcVc3Y2cydi9SSHVX?=
 =?utf-8?B?citiK2Q2S29aVGRZR3NJUFRXZllyc3o2YzNwcUovUC8yTTJWZm1Eb0xOaXh6?=
 =?utf-8?B?RDYrVzMzQkY1NnVOVkF2NXRyV2FyeGZmM01FVzFpODNxdE9qamdpTEJoRGp6?=
 =?utf-8?B?cGlzZmJURi9tUFNmYmpodDdBcTVRMEJZVks1OS9XNTcvNUFHWUQ2a1hLVzdt?=
 =?utf-8?B?dlp1eEpmZHpqWDJ0T2owTmVJMnh2QmR0djZWRFZERHA5bGU4dHlZOGVXNHBw?=
 =?utf-8?B?VTg0YXJKTFFOWUs5ODBybXRweVRNUDhPTG56cUlVN2FYV2xydVUwbVVPaEJN?=
 =?utf-8?B?MTh2TFp1WGZqcVN5bjRUa2xYaDU3cEtiWkJWL2tLdGdtY09SMFVyVFp0WTJt?=
 =?utf-8?B?MFlvQ1pCY3htUkNSTzd6ZzZocHJ5bUhObVRNakREOW9PZ3Fvd2QydEpYYWpy?=
 =?utf-8?B?VjNLQzBUR3JySW9LOHMyam52WGtPRXdsRC9TNHFOUUxicG1PYnFSTXE0ZGE1?=
 =?utf-8?Q?FwIop1EWahJcUNaBOopoH1Xdw0nwA9yk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzl2RVJIaXVqNFJGSnYzWGhURVN4d012MVJuaGx6UWlpMkdRb2x1cDhPOHFT?=
 =?utf-8?B?eU5QZ1pyQnZpT25wUHAzdnR5VTBmbFZTazBlRmIxMHVZRHZkNlZtS0JUTVpG?=
 =?utf-8?B?dVpoVDJUK056VzlYQ3dkY2FjSVV3K3oreVRPME5WL0k4bEY3VVFBcGR5cjJz?=
 =?utf-8?B?T1Q4OHRtd0gwcFZWVE9mK3M2VGpRcGVLYUNJZFY3NzZqZ0FndXZDcTVxN2Rm?=
 =?utf-8?B?a1kwa01wQkVJSXNhc1RPT1RnUGZXTUxiQWtqZFFDYUM0Zm9oVDdaakR3UHZO?=
 =?utf-8?B?bnU3TGViTkJjK05KNGg2dGUrS0pYQkVya3JkTndOVDhsVGgyU3FQaWdXeVh0?=
 =?utf-8?B?YUo0Ym9hUzRUZ0oydFBxa1lwVEoyamg0TzN6aFdtT2xBd0hDcXgyWHFnQ0tG?=
 =?utf-8?B?dXVpRS9MWmNTK0dzS1p2RmtSek5yM1FzbVZ5WkQrQ2VnaHRrOHJ1ZjVucGlF?=
 =?utf-8?B?TC9MR09HS2JxU0RzWEY0TGlZODhIL2twVWJ2ZnR4cHRxLy85TXhQVVlpMVUw?=
 =?utf-8?B?SHV3b21aUnJnS2R6b2k0Y3hGcmRJZTRTU1FzYmdWa2Y4dFYxeXUxWmQzN0hV?=
 =?utf-8?B?eVp1OWJyUHN4NzlzSmhPNmRiWnRSYytXazBUWDdFdHlZVGpSZTBqaWFSOHZT?=
 =?utf-8?B?Qk5LUG53MHhTUnlWdHNuTVZ5L21wWWIyQlM0WEZqcS9oYjlnSmdDbHN1OCtm?=
 =?utf-8?B?WDBYRHN6d2hYVEgxRFVLd0J1TThYb0luNzJWL3gzeEYvYmd3b0xHUFRtaXFB?=
 =?utf-8?B?UFlTOFZ5VUdCR01jdnR5bElwcUQ2TWJJZy8wdlhOVGdtcnlkZTJlR0R5UXJk?=
 =?utf-8?B?eTlEa0x3NXFhR3hqSFVlRWwvMGVzREcyTkk4QTlud2gzbkVDNTdjM3U5K1dJ?=
 =?utf-8?B?REc4TE1mRmVxRFBOWFlwUVZ4Zk5JVlF5QW9vVkFqMFRIZXV1bTBKRjJGNG1u?=
 =?utf-8?B?NFI1cXVIU21icnlXc3g1R2F6bnl3aHBQT1p6azlxaW4wZHlMWHhxUXU2SmYv?=
 =?utf-8?B?djE2amk5NVVhelQyaGJuK2dGOGR3WlY2eW1YQzAva0pYV1pSUWE5Nm5sbXBF?=
 =?utf-8?B?azkwZng3bGdHbkJwWHZkOFpsa3IzbkdSR3pZRE9MdDUzREtMcVU3MG1mZzAv?=
 =?utf-8?B?S3owOVRBUEI3Rm9NQnJsNnFiZ2RRaks0aVpsQzRSQjdlM0kyaGE4ak1zSjhL?=
 =?utf-8?B?ZDQxMkowejBqeWxhVlB4aDVKSWdTR21hRU00YTNlZFIrSFF2L2Y3ZGxhb1pj?=
 =?utf-8?B?ckYrYm1idXNINDUzQSsxTU9MVUlrazZ1bDNUL3FxTFRGeGd0WFFIaTIzaTVY?=
 =?utf-8?B?dE5tLzFZNGhjV3orNlMvKzN5WmpwK2d1TTJ5NWJNOG1sSmlOVDViRWhMMjNE?=
 =?utf-8?B?eUZ5NWF5RFBRK2VaV0x1WmRUL3ZRS0VhMUxJKzJGUWwrQnlSZzdleFN4Mms3?=
 =?utf-8?B?VEVlUlJvL0FXdDZybkd0SzZjOUlPSDMvZkxMNEhiRUVLWlVScm9BcEdlTDFR?=
 =?utf-8?B?bzZXL21Ibldram81WVY0QWJIVjYwL2U0S0tHSDA1MXpVV2I2UFV0dVFwK2xa?=
 =?utf-8?B?aERqWTVicHBzWWFtdEVpS1pZaHpJdVQ2OWNJNlZTdU01RVZURXVwS0x3aEYz?=
 =?utf-8?B?YU9EeW54WDJqWnAwQ2lyMFc5T2pGWm85aGpXZTI0YVdmRGxnbTNUdGZTU1cz?=
 =?utf-8?B?aTdSVGJRek5ScGh0NkxYZ1JqMFhidWU0a0l3dkREL3hFTENvZkU3OFZTbWJZ?=
 =?utf-8?B?SWpGMHFoVHkvdXg3b2Rsb1hWTU1PaW0raGZJTHZPSWFuMEJCTzhidTMzeWpE?=
 =?utf-8?B?aE5mREFUclpZRi9kRmtCcldWSTBRMjVJMjVNZnlML2QyQmhDcXhlM0YvWG5M?=
 =?utf-8?B?akhzMHROS2lVUkNSRmZRZHlNNWlRYWRVeHVqSHF3VmN1SzIvU2ZwYzErOTl1?=
 =?utf-8?B?Zm1IVDlldk9zMktBelFjMy9hUFdMeDFBY0k4YUVVZ2N3WE5sSGZmQVRBSnk4?=
 =?utf-8?B?Wmhnc2hHQUF3c2JjVWZsa0p2YmszVnhLZXR4YTIxQ0Z2d3hLOWlzWE9wZXBN?=
 =?utf-8?B?UjNFSytudWk0Qk43VmlqWWNFYzVheWFkUUx1TFR6R1VrWGlhUk1tRlNNd1NW?=
 =?utf-8?B?NDNWdk54dGZzWE5YN2FTTkc4Q1NBbkpJSnNBK2RSUkhwZXZUNEdGSFFXOEVs?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ce076a-493a-4fd2-e4fe-08de003525be
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 15:22:20.3664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zdiqzs4JuMkA1XVFHM6lMlDWbw1mkTdgsFezu7S0c+CbcMbXR+Kk0N57m8M1vdYSUH+0sPFJ++o6Ai2braiwXR1e8b4mss7bATqJ+hikTsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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



On 9/29/2025 4:55 AM, Matthew Brost wrote:
> This reverts commit ba180a362128cb71d16c3f0ce6645448011d2607.
> 
> Due to change in the VF migration recovery design this code
> is not needed any more.
> 
> v3:
>  - Add commit message (Michal / Lucas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  8 ----
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 54 ------------------------
>  2 files changed, 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index 31090c69dfbe..47756e4674a1 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -196,14 +196,6 @@ enum xe_guc_register_context_multi_lrc_param_offsets {
>  	XE_GUC_REGISTER_CONTEXT_MULTI_LRC_MSG_MIN_LEN = 11,
>  };
>  
> -enum xe_guc_context_wq_item_offsets {
> -	XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN = 0,
> -	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
> -	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS,
> -	XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID,
> -	XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL,
> -};
> -
>  enum xe_guc_report_status {
>  	XE_GUC_REPORT_STATUS_UNKNOWN = 0x0,
>  	XE_GUC_REPORT_STATUS_ACKED = 0x1,
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 53024eb5670b..3ac0950f55be 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -735,18 +735,12 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	if (wq_wait_for_space(q, wqi_size))
>  		return;
>  
> -	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN);
>  	wqi[i++] = FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_MULTI_LRC) |
>  		FIELD_PREP(WQ_LEN_MASK, len_dw);
> -	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW);
>  	wqi[i++] = xe_lrc_descriptor(q->lrc[0]);
> -	xe_gt_assert(guc_to_gt(guc), i ==
> -		     XE_GUC_CONTEXT_WQ_EL_INFO_DATA_2_GUCCTX_RINGTAIL_FREEZEPOCS);
>  	wqi[i++] = FIELD_PREP(WQ_GUC_ID_MASK, q->guc->id) |
>  		FIELD_PREP(WQ_RING_TAIL_MASK, q->lrc[0]->ring.tail / sizeof(u64));
> -	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_INFO_DATA_3_WI_FENCE_ID);
>  	wqi[i++] = 0;
> -	xe_gt_assert(guc_to_gt(guc), i == XE_GUC_CONTEXT_WQ_EL_CHILD_LIST_DATA_4_RINGTAIL);
>  	for (j = 1; j < q->width; ++j) {
>  		struct xe_lrc *lrc = q->lrc[j];
>  
> @@ -767,50 +761,6 @@ static void wq_item_append(struct xe_exec_queue *q)
>  	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
>  }
>  
> -static int wq_items_rebase(struct xe_exec_queue *q)
> -{
> -	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct xe_device *xe = guc_to_xe(guc);
> -	struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> -	int i = q->guc->wqi_head;
> -
> -	/* the ring starts after a header struct */
> -	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch, wq[0]));
> -
> -	while ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
> -		u32 len_dw, type, val;
> -
> -		if (drm_WARN_ON_ONCE(&xe->drm, i < 0 || i > 2 * WQ_SIZE))
> -			break;
> -
> -		val = xe_map_rd_ring_u32(xe, &map, i / sizeof(u32) +
> -					 XE_GUC_CONTEXT_WQ_HEADER_DATA_0_TYPE_LEN,
> -					 WQ_SIZE / sizeof(u32));
> -		len_dw = FIELD_GET(WQ_LEN_MASK, val);
> -		type = FIELD_GET(WQ_TYPE_MASK, val);
> -
> -		if (drm_WARN_ON_ONCE(&xe->drm, len_dw >= WQ_SIZE / sizeof(u32)))
> -			break;
> -
> -		if (type == WQ_TYPE_MULTI_LRC) {
> -			val = xe_lrc_descriptor(q->lrc[0]);
> -			xe_map_wr_ring_u32(xe, &map, i / sizeof(u32) +
> -					   XE_GUC_CONTEXT_WQ_EL_INFO_DATA_1_CTX_DESC_LOW,
> -					   WQ_SIZE / sizeof(u32), val);
> -		} else if (drm_WARN_ON_ONCE(&xe->drm, type != WQ_TYPE_NOOP)) {
> -			break;
> -		}
> -
> -		i += (len_dw + 1) * sizeof(u32);
> -	}
> -
> -	if ((i % WQ_SIZE) != (q->guc->wqi_tail % WQ_SIZE)) {
> -		xe_gt_err(q->gt, "Exec queue fixups incomplete - wqi parse failed\n");
> -		return -EBADMSG;
> -	}
> -	return 0;
> -}
> -
>  #define RESUME_PENDING	~0x0ull
>  static void submit_exec_queue(struct xe_exec_queue *q)
>  {
> @@ -2669,10 +2619,6 @@ int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
>  		err = xe_exec_queue_contexts_hwsp_rebase(q, scratch);
>  		if (err)
>  			break;
> -		if (xe_exec_queue_is_parallel(q))
> -			err = wq_items_rebase(q);
> -		if (err)
> -			break;
>  	}
>  	mutex_unlock(&guc->submission_state.lock);
>  

