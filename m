Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F1FCA0EF8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:47:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D1810E371;
	Thu, 21 Aug 2025 14:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dDYUTDp4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9349310E371
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755787678; x=1787323678;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=P7wXJIjiEqZA6HXrD7kx/xQDzwo2BSZYstIfcuTU1Qo=;
 b=dDYUTDp4Sz2TiiXgTX8xd5sYTtBlDYl0xDkN5tDidYt0wYrBDYWEO5P0
 BNkwvXGUI11vldL4sE8NGKxoF58WachqYLyVkMXEStdM5mBnlG6QxR8BX
 AeI8iK2x6ednLbVoy/RpI+lDf9eEqEN5LW9uS2gWh+2brYhRmwLJjAsfm
 LtFd0jkDQUr9v47LElC+7ytW2v3kgSxBrRCtQqBqGncGuC7Bj9DxaOuYi
 N6eeBflju/dHISrMxX7+wke22ptbNNY5zgPAbYLER4Wz6fvzpvzq7G7z7
 UXlqaSF83dx8v/5aMoJPlQ74imvfZAFuL4ZzNYB6ISsTyX1xvbXpPOjRj A==;
X-CSE-ConnectionGUID: uF1UuCNLQ0uy66z5YKNOxw==
X-CSE-MsgGUID: WA2MedgnTOmSmNIHB4KRuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="68785514"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="68785514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:47:57 -0700
X-CSE-ConnectionGUID: +BEyKuGZSeuFFJPqnKpZ5g==
X-CSE-MsgGUID: 5xR9hxAJT8KV38Vz+UvxWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="168340622"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:47:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:47:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 07:47:56 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.89)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 07:47:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yl8nbD7a3yCZYyAqwIIP/pzv1hMhmRWocKkFE6N4ctAT5dXfLUbQ7U3fw3gfJ3+zhq6Bcr7eoB38xL35poVSocpSG4L0hdDUv1abVOS2WkShPwChm9HtnzpRykun7TNWoJqOOtHP8L6VNzXSYJLt+Ca3PDkInFf8aNhrt+BH+wlfNK9CilaOyKXSyj2NkISRfFpLeQcnsLzoflmLfgQc2SuDsdXK7LPxNSVvMGqcd/Td6hCd6jzpjRshfecijSWiGt9C+MUsq6IPUwz6S9MOsKozOChWuUeTgYVDmDqgJQmWGcC5TVjN5mfIvCCvZQCpTw5q3oah8MwzvBmjL5Aqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjgfhgdq5bwXFdBpm4dzRhkPrAQkqWGN9wfV8byrlgI=;
 b=A8GIoPOIQglBTTmiv7QjXBw3R43f7eIPZ5JVkTwBDWli8pgwQLnEBRcmJPXw0pILj8r7dDd4s4KJE8EdDe1ewZuxOhu0g9rpUrrUx6yEp0k1JaLc8YVzeeoKpqzCIQnKAILuCGs55Glk5+LSVWjm57f1cpKf/HYlQZlcJqyfLSdfHbhuDwKC3yq2qVh2GP72I86/RUHXvpYIm2BwSNV9IHEK9XqTw2yeuMn8F4DUUccMJ2XD7OXR8IxLSlv3r+axO24aXBSaVs/Htaau3wWFVOiw7rtIHT9pWXDCz/0y9/TWzqq1vx0xJrJu5Lxx7Sf4gZB8mSqW7Wm1i41UIbv6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB8786.namprd11.prod.outlook.com (2603:10b6:208:59b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 14:47:52 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 14:47:52 +0000
Message-ID: <bd80eea1-3b30-47f0-a23d-966839a4ff4d@intel.com>
Date: Thu, 21 Aug 2025 07:47:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] drm/xe/psmi: Add GuC flag to enable PSMI
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <John.C.Harrison@Intel.com>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
 <20250818-psmi-v4-1-a330783ce1c0@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250818-psmi-v4-1-a330783ce1c0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB8786:EE_
X-MS-Office365-Filtering-Correlation-Id: a22d39d2-50bd-45de-d88b-08dde0c1b4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzhPai9SN1BvU3lqR25RWTdkVFF4UWZNWDlFb0E3a3lydzRueVY5S0svNDEy?=
 =?utf-8?B?SVF1Zkc0NCtPSEJ2cVUrTmxrTm0rd1lBeEdtcFZyY3Y3SnhwQUkzWDVWNGt5?=
 =?utf-8?B?TUM3N1liS3VlQmFrSWpaMjd1YnhFMnVLRkljRG1sN01XblNWL2dRRHVIWkQ0?=
 =?utf-8?B?Y1ZsaE9hZ2dqM3NGR1IrM3JrZjhaMkdvYlFhdkFvaUVaQkluSi9DclVDeE5P?=
 =?utf-8?B?LzZzaW9hbExGVkVGZEtFUFRKWTl1eWJqUHFmMnNsUmFRejNHbGVXWDdvbzhO?=
 =?utf-8?B?bFp4akJKWmFMaWpJZFgvRE54eCswVmRseG95VlQ1bEVDUkNSMko1dnBKOTVk?=
 =?utf-8?B?c2ljSmhCeVdhTzg2RE5wSSthWXNZUDEvMCsxVEkwWU0xdHFRaVR3WWNuZDJD?=
 =?utf-8?B?UDhHbEo0UDVIUS96SGZqUzBUVkRBc3h4TlRnOW1mbERweVBmQVc2eld2VXRV?=
 =?utf-8?B?cTVRc1VwQk4rVzdKbjNNYUxHeUZ3OTBidTRmZWdORXJnemE4UHVlTUlLY0F1?=
 =?utf-8?B?OS93blgxYVY3dCtnMmV6bXpOb25zTjEwd0ErTm5HbnVyS1MvNmdtSnZSYTZo?=
 =?utf-8?B?K3BUeDdGcUdZWEJtcno2UHRYSnVqSjdUQnpibldjc21mV1p4UldsR3VrOFZn?=
 =?utf-8?B?enEzK3JHSTI5Y2MvOU1ueGpBc1VOamg3d1ZSQmRtM0Y2TkxzTmMwaWZzZndO?=
 =?utf-8?B?SzRLakJKVllVSVhnaWxHVU5kcFJ0R29teDh4Mlc3M3Y5T05jU09PNWFMV1d0?=
 =?utf-8?B?WUg3aWNwbjZlWGxOQnFQMGVkZlJzLzh3eGhRaGY3dnNSRFd0Z1QybWJXZjY3?=
 =?utf-8?B?RzVwa24ydXBuMzJpRmRiMUwzeHN1WmRYVll0ekp3Vk5WSXU1OHpjYzVyL3hQ?=
 =?utf-8?B?VDB0QXMzRGNkRTFQZEV3eER4TmtpRGN5Ymx2Rm94aUJlZG5ISkRZQ0tzT3BE?=
 =?utf-8?B?RUhzelRidlZ1N1VwTE1HQ1U5bDUrMjdGT2llRVF4b3ZvTCt2YS9HRlQ3enZD?=
 =?utf-8?B?OTZTSE1wL1ZtSVAxS0pDZmJRMGtsZ1FOOXRObkVGWHR2aFkxT2lRWlRlV3dm?=
 =?utf-8?B?SVRxVzI5djNDWlNwQTFNdkprSHlaZVBMUzNwUHEzM0hMTjF5REt0TUoxZFlV?=
 =?utf-8?B?OFhEdEVoMGZwZVBGQ3lpL0pQcEJZa2RHODI1TkVwRDJzRG1aU1RKUjdRQmlx?=
 =?utf-8?B?WDhJY3V5UkpKaGhNL1V2enJVUmM3RnhiQkxjdGQyTHBTYjB4ZTV3Ym5BK3NY?=
 =?utf-8?B?TVBmVm5DTmpic0FYaHpPZTNUZnp1aWZSaUwzeFVHT2xXWUtSYmFkWWRGdi8w?=
 =?utf-8?B?NVNlaHNjbmJhUTBUTUFpK25Bd3NRSld6VXBmM3psdEVrOVFkS094T0RpbDB3?=
 =?utf-8?B?ajdWRmtLdnBocUZ2bUFidkg2S2lndjd2bjZMcWw5TWRBb0hGZUdXbEFzc2M4?=
 =?utf-8?B?bkJQOGNSNWRRUUtsU3JQSWo4RnBvUzZCeHA5a1JWLzB3akJzR2UvVXl3YkNP?=
 =?utf-8?B?UjhTNjNiV3JkckZmZXNCSXdFQnJzSEpLRHl2ZzNSbXpSNVZhVFhLWnpOYTlO?=
 =?utf-8?B?dVltT1NPNGtjamtRUXVkVXUvTUo0WGhLYThwMDNjMGNKU1hyd21YcysyVnhB?=
 =?utf-8?B?R0ZDMHg5MWlYNmM1ejRwY1czT2Vqc1Rja2lETVByaTh0enI0TUY4REZOMHJD?=
 =?utf-8?B?OTh6K1NaRjlXeE12N0J3V2E3ellpcUVHN1JDRDFmU3NhVVpRd3lWYjRWN0hL?=
 =?utf-8?B?aVNubnIrMWhCcXhUa0lXVUZNSXZMaUl4b0czMVJieklhQXpqK0FZd0pYWSs1?=
 =?utf-8?B?QVRkY2tXMzR3MmNxYlpzV3E1N1FwOHczN09TSFdpVHcwdFRVZkxITUVSQlpU?=
 =?utf-8?B?VG1WZkt1dUxCTjVDZW1oYzdvQ0VFZ0pJMHN1anRtSUVKUkhOaTBBZ2YrRXF1?=
 =?utf-8?Q?4o2SQGnQbVM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXpGZGRFU1hmdUlzR1JleXNIQXJBNVJlRHYxY0J6bG9QL3Ric3ZJMDhqK2Jj?=
 =?utf-8?B?VHZXQjI5L29aZi83akxtU21nbXRFOFVFQk93UzlsQlVNWDcwWGpsaFJtL2tk?=
 =?utf-8?B?UWVicDBOT1ZTMUJFU1g5UUlvWlQ0L3N0aFNONnpldnFhVkltT2hsbEFycUsw?=
 =?utf-8?B?cDl6THVRRXErek9ucUtCYU11Q25iTU5ON240bU5lSUdVUEU2UmkyRkhaTnJ6?=
 =?utf-8?B?VEt1cnduZDh2dWRhSHpXaFFweEpJMk5CbkFTUHZGblB3Rlc3Slc3MlhhQ2hk?=
 =?utf-8?B?b2NZaUFqZk1sRnNSd09YeWdsMDY3YmMvVmRhVkN0Qmx0MC9wZXhnOUhTa29s?=
 =?utf-8?B?dUpBcWsxMmQ5K1dCZFc2NWJrTGZBVGpOallIU1d5YWF5cTVPeXkyY3VHbG0r?=
 =?utf-8?B?QVllMDFvSzF1OU5lbzhBc2YxNCtpWVlZZkk1WWdhUDhMNjRWeEZWSFlzSnFh?=
 =?utf-8?B?TS9lTFpUSmlnTmhmUm9DUnlyTkdPZEVFQVlsZlJIakZrcTh1UDNYTWRucEFv?=
 =?utf-8?B?bDNKb3VwWFoyOGRJRkFTMk9QL0RLd3VEOE5vaTB3TFlacmlsU25KMjFjRVlL?=
 =?utf-8?B?YmQ0UFJmS2tFMmpDVm8rZUtXZmo1cjU5WDZRQnA2em4wTFluM3owaGZzNWYx?=
 =?utf-8?B?bGdrbHN1YzN1SXNwZ29GRjVwaWJQVm1WSGFNbTVuV0J4UlkwMXcyamN2N2N4?=
 =?utf-8?B?QnIzekFCY1Jjb1ZMU0dvdkM2eEJrbjVJaUFYZkhSc3NCZFZlaCtrSjl4N2J0?=
 =?utf-8?B?YkFiM2xFKzlDSEZNL0hIYlF3NFdNSm9MM3dvWTZxZjhSVWQ2dENkS3R2Z0Qx?=
 =?utf-8?B?N3RIYXlobFgzUXArYUFITzlKS2txbm5NRlZDVVFpVnlLQmVieHRnbHV2WGkz?=
 =?utf-8?B?Z2c3aEhEbDd4QnBMQzl4N1RNelFKcXdraXJrVGhuMCs5eXNWbUhOeWRacHd0?=
 =?utf-8?B?cFNQT0lRVWQxVGpCbkE3TXZmU0wzVit2QjdVZVppaWxnem9nS0Z4WjUxUldG?=
 =?utf-8?B?KzNaVXBrU2tiNTZ5Y1FSK2NLYW8wVnZkb09JVzRaQ2E3TysxWnpzbTlwZUZQ?=
 =?utf-8?B?aTN4YlpVd3dzRzZHTXBJRzdWSlR6OUh5M2dzUTVrdnZaV0g5WnVSb1Z5VkJ3?=
 =?utf-8?B?V2k1TWgvc0NWVHpGdlJveHBWYXJPUDR3LytUYmV4dVhVS0tGM0xyUktvUWgv?=
 =?utf-8?B?R2hOSUNxcVVRTHBwdkg1WnUwdmI3UlEyRStDdlJ6bkZRbmJUU25TZFdoSCs0?=
 =?utf-8?B?QUpGR09EY2dhK1hnTnlHRUJrcWxuMUx4dTVad0w3NDUrQ3RnNTdBRDVxTlVT?=
 =?utf-8?B?MldFSisvYzdtRmZmVlV0czE5UmM2NXk1MG11ZHliVU1hSktnU0p6S1l6RGJh?=
 =?utf-8?B?Z3BOdm1oUnRaOG9Gb0dHbW1pSnU2RHZwdWVja004VmJPaitZQXdrMFl1TVlX?=
 =?utf-8?B?N25WVEJhZm5CK0FzQllrSTFubGR6TmE0Ujd5bnEwT2FGT1ZYTi8zZ2c0Qkdt?=
 =?utf-8?B?R3RNQjdkV3lsOFdIOUpWcEFrRWlOWHpRNFQ5TGJRVU5wQmtVa2MwSWhPMjRO?=
 =?utf-8?B?Y0VvOS9ZK1dTTmp2Z0YvVjdrYktYNDFiTUhGV1JqQTJreUd5djRLUVh2ejc1?=
 =?utf-8?B?QTFGamZ5ckdldjNBR2ZsM1hBNXp5SzlsMnBkYk9WaWFaY21RRlpUZGhWVWtV?=
 =?utf-8?B?ZmpEYWY5c2xsR29CeGcxRUZwM2c1RHpWZUk4YmJrcHRIdkhHZHIySlZmTm4x?=
 =?utf-8?B?T1RCNFdtQXg5c0RQWHpEZGU0MkZITG5wS1hxWUdLTmNydktuWUZXbWVEZk9m?=
 =?utf-8?B?Y2JwZGYyMFJTcWNPendneFpUNk9sencwN3VuVWZTSVNER0s3WEoxUkQ3eGRy?=
 =?utf-8?B?N09iamZTYlNrTXF6aHlmeUNDTjdDYmpOU2FGL3JiOVhGT05ObVNwL0FTZlJF?=
 =?utf-8?B?ZVZ4cC9UUGduVUxuRi80WU0zZFc3aTRFVUswWlpzelFLUG4wODlFWWNScmZU?=
 =?utf-8?B?Z3QvNVc1VnBXeVl4azhhaWZWMGptcWlIMkRmT2hOQjltTUxHN2VSN05sOG5p?=
 =?utf-8?B?UURXVCtlVmxjdkZZY3pUREpXaEg4Mit2Qk9WeTVxVHJDUEZiUVNLaUhJN3Zx?=
 =?utf-8?B?QVh0SlIyQVI3bzhYR2R4TUZQdDVrV3hmb3Z4NE8zM3JwQ290YlNxVWVFdmdy?=
 =?utf-8?B?WVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a22d39d2-50bd-45de-d88b-08dde0c1b4e7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:47:52.6845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGKp80faFz6smnlUwlSj4oUdRnH5D0tVwnV7verNdwvzYFgL1vaxEq0uIp04XFb7aLArrgNNCuqf9SVFQBUuj+xZsudDkG5sZbZM+EBlNVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8786
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


On 8/18/2025 10:37 AM, Lucas De Marchi wrote:
> PSMI allows to capture data from the GPU useful for early
> validation. From the kernel side there isn't much to be done, just a few
> things:
>
> 	1) Toggle the feature support in GuC
> 	2) Enable some additional WAs
> 	3) Allocate buffers
>
> Here is the first step, with the next ones to follow. For now everything
> is disabled through a check in configfs that is currently hardcoded to
> disabled.
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> v2:
> - s/GUC_CTL_ENABLE_PSMI/GUC_CTL_ENABLE_PSMI_LOGGING/ to match the GuC
>    interface name (Vinay)

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_configfs.h | 2 ++
>   drivers/gpu/drm/xe/xe_guc.c      | 7 ++++++-
>   drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
>   3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index fb87640080896..c14588b86e833 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -16,12 +16,14 @@ void xe_configfs_exit(void);
>   bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>   void xe_configfs_clear_survivability_mode(struct pci_dev *pdev);
>   u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> +static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>   #else
>   static inline int xe_configfs_init(void) { return 0; }
>   static inline void xe_configfs_exit(void) { }
>   static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>   static inline void xe_configfs_clear_survivability_mode(struct pci_dev *pdev) { }
>   static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
> +static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>   #endif
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 433abc787f7b0..883f700e532a7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -16,6 +16,7 @@
>   #include "regs/xe_guc_regs.h"
>   #include "regs/xe_irq_regs.h"
>   #include "xe_bo.h"
> +#include "xe_configfs.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
> @@ -81,11 +82,15 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>   
>   static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   {
> +	struct xe_device *xe = guc_to_xe(guc);
>   	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
>   
> -	if (!guc_to_xe(guc)->info.skip_guc_pc)
> +	if (!xe->info.skip_guc_pc)
>   		flags |= GUC_CTL_ENABLE_SLPC;
>   
> +	if (xe_configfs_get_psmi_enabled(to_pci_dev(xe->drm.dev)))
> +		flags |= GUC_CTL_ENABLE_PSMI_LOGGING;
> +
>   	return flags;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index ca9f999d38d1e..400004f1838a0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -112,6 +112,7 @@ struct guc_update_exec_queue_policy {
>   #define GUC_CTL_FEATURE			2
>   #define   GUC_CTL_ENABLE_SLPC		BIT(2)
>   #define   GUC_CTL_ENABLE_LITE_RESTORE	BIT(4)
> +#define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>   #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
>   
>   #define GUC_CTL_DEBUG			3
>
