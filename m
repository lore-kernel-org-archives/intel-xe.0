Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C18CD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 20:43:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197A8112399;
	Wed,  3 Jun 2026 20:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu7CBBQ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644FB112395
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 20:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780519397; x=1812055397;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+p7CXxOUqVbcmc0kymjKS8h1jWDS68DnP6O8Nmw0X/A=;
 b=Hu7CBBQ8qA6BmXgVf3eFqu7EGm6WwJVx0AWS1cI6wObuYY1FtSinuW4M
 YzgykSDVMe+TM7JI80+CVxJJZQhge1rym8pxP6v7sfDTt1B6bdkcYbEmZ
 2+x91BgAJ3C9TRkCnOxTpcIqqG5YafxClSc0FV7aHewTgotOpVgplBPHE
 5RqR3MrOqz/0/ZOZbIEx8mW6KsoCfiDefUNdBraz9VNtq36wKnJ7g3BzV
 6D3i++AXrsTYndK4DzLE93EfW58rRMDRG/c6ixfu50/p0mJPj/EpSmru3
 EgEK/R27rqyPUUHLsx+wSw5yBa30zXVNx2gCCZb1JqKmXNFsLRZowD3fy g==;
X-CSE-ConnectionGUID: RI8r7ilhTLuKkgonLTrLRA==
X-CSE-MsgGUID: aGqHZBJaTKOzy745lU4Eqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81372729"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81372729"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 13:43:17 -0700
X-CSE-ConnectionGUID: IWh5TprjT4+eaVIcl2lHUg==
X-CSE-MsgGUID: JptZRelHTDuzR89X1cq/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="244468063"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 13:43:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 13:43:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 13:43:15 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 13:43:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AO7M7IwdDN419RcmeKioVfmiXnHKqi28a6BHtI3fizyhJeTQnLNYcFfL5nMq1NGia9cSleeStX6W/ueQ8ZzIL9R61hOrSb0R7peDWGGotHRoRkHwYkfEtE6xvWOiE8h9aNe/UbOapl97sUBHzSdzip2FgyC2mEly0ODzNAuWgJkbgAjocLPHCSfPmb31E19hwTFkdRVr4KDtLSfi9JXZg3i5JU1r236Ql3y/LdqzkdctetTDll60ipeOMYGt0ooRUeNqOgQvGX1uJeHsB3XJu5rHzoSEvRjiOVAf7IiQLdCJt4SUGNbfnyWJK3FLiWKF1pS+Gpt+BoU7PR5tD4jGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrjDgRlYxrAIdNPl65ZimZjoynXniIivhF5+xDpZtyg=;
 b=rHjEWzATtgNOAqI81nuB1tNC1B/hYMUoED0rM6xOES0dqAjBKLhscB3rTmaYhFIyuP6KyOuUq30FwYIPL82ud9xTgYC8xTv4xovBQsHau2U/n2HNJq7Iy/pb/IljoTzVD7BIyRhTDH1kJWYpSnc/yZ+3H9VQA2Ici2vuEYrp0tolxG0HvRCglRiFbkzEwdAlz2BYt/GjiXVtyBdDLwYEWtmHlQh5sZ8Fn3ClKWsVUeeF2VXM5H9ZXE67xEBDOlO9PL2RQT/c1fcvIcIa932VgO4IBMz7SmipzFwIuXbT9OFet4LlUt4NpV09G6nhg+wTcfkdiRQzcoFQTMxF2UTSlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8)
 by DM4PR11MB5279.namprd11.prod.outlook.com (2603:10b6:5:38a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 20:43:13 +0000
Received: from SA2PR11MB4793.namprd11.prod.outlook.com
 ([fe80::6037:898c:f5e:e256]) by SA2PR11MB4793.namprd11.prod.outlook.com
 ([fe80::6037:898c:f5e:e256%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 20:43:13 +0000
Message-ID: <c1a1c8d1-ebec-464e-b804-a6d0e68bbc47@intel.com>
Date: Wed, 3 Jun 2026 13:43:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/wopcm: Move WOPCM size to platform info
To: Matt Roper <matthew.d.roper@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
References: <20260603162619.1550794-1-shuicheng.lin@intel.com>
 <ec9ff2ab-68d1-4264-af8f-c26e2298cb35@intel.com>
 <20260603192547.GD6262@mdroper-desk1.amr.corp.intel.com>
 <20260603193607.GE6262@mdroper-desk1.amr.corp.intel.com>
 <a65ce97dbfca5c1bd87c35843b705b9d84caa36d.camel@intel.com>
 <20260603194852.GF6262@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260603194852.GF6262@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0267.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::32) To SA2PR11MB4793.namprd11.prod.outlook.com
 (2603:10b6:806:fa::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4793:EE_|DM4PR11MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4c9e42-368d-4db0-ee1d-08dec1b0bacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3QE/cZitwxxNShTs5X0seWWgapFbkQC5UXMQXHY4OkYU+rnlojP+2EQmuald0RrN1Ijt8QIS47UhSAcCTcWNKL+ETM/Wwt3M3Gr55oef9z1S9yoJF2fezBX9czeK3ubS/GE0rBFcRstmhz/RSYlhkuDjPKUOsChIvdKb9x9d1/QywHNrB4G35/Qurx+f22SoRDtZKCBoIHpU8/K1Rljjy1dBpXQsI4LQIyTlOtJpMdQJKWIeV5jVhJlUVKR+TJAQs9m5h8vyRr0smaxhzxKKsxnI1/gLnDgPRoymQoQt9svNbHp0iF//JeUbBxVYbH84dFoEoWRRXXV+Pt9zbQXWnP5gD5aWQNtXd02wwcEDP/YffFaBpWwi9eMQZ2rpw0YXEAtUVi/Emd82gSlVPGKZ+u03/0IcY6Q7Bph1js4fuIFE1LrzLkQmHy8zrc0VmqncsByECy7DzCRSQj8kpI5BgrwKvwNspfefZ9cqJFZcKZMBnGWgp1AgOf+6zY758+ZI0A6eI2VavSSgRbPeE828zrB+mvJGThuqrOx+KmsHJ6hZIv8xUPnhjHepggV+ipYq1Xy1zkgi5ttWIn2g1vEvmOBC8FlYlNwYYp8oBlLzYUiao5+WwTW5OAfrFvPBu0xNNzlLV3Lgj4Ll7mNwwUqnw3ANQflEGueyxpIogVIhsOYskq0pkcDKmX4meOF+yVqIijuWmYvVRfGJ9Y6cjuNtfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4793.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFMwWGtPQ0xJM3dOL0hLQVE0WnZITjRnR0Ryb1YvNjlUcWJyMlRWa1Z0UFNT?=
 =?utf-8?B?ZXpSV3hBcGZ6ZTFIODdyanl5eUxaaWlRL2swaTRIZGtROURxdUZzV2IvM3N5?=
 =?utf-8?B?RUlXTWFQbWlWQ1psMEFNeGFLQWJqM1JYMFBWcktXUVlJd1BXUFd3cWRodmlZ?=
 =?utf-8?B?V1ZqQ1B6M1QxeHgzTUZSbFRxVUxiZlB6MzJkM3A2TytYQW9yWEtHU0x2Y3Fq?=
 =?utf-8?B?K3l5TDRrS3p6T3pqMGVtbzE4RVBHNER3R3RJZzZFUjBId0VQSFJRYTBuRGw4?=
 =?utf-8?B?Z3I1WHArcmozT0Y1c0Y0emEzRjVPWjZEZ05HVzM5N2pZd3FLSUl6aHd1VzVy?=
 =?utf-8?B?a3crdVMwWmkvR0VuZU1RS2dIdk1iajlGeXBVWTFLTVVISzVtTDF1NnNscUNk?=
 =?utf-8?B?UGdUdDJUcmhZZGdZdjBTRVV5SW9INUEzRjExQ1lnM0l0S2lEZmRDbWJIRWhJ?=
 =?utf-8?B?OWpXVVlkLy8yN0JxZk9mMm5kVzZwUGNGelpWdlVmeXdBRDh6bHE3YlZrcEhh?=
 =?utf-8?B?VDNXQ1AvUjhpU3JjSlpkQnBvekJDOGhGYzVtVTJuSDZPY251MmUwKzNHWEZ1?=
 =?utf-8?B?YmFUNUZrRzdwS2tkKzVGUXVrUWVlUHcvcURPKzJsZnpiMEU1Qm9zSVhXa2R6?=
 =?utf-8?B?RW41NzdYYUJ4YXlWQmlTWEJVYWE1L3JKaDZjOEwrR1dmWG03MzFMcFZkcHRR?=
 =?utf-8?B?Q3lIWk1WMjMvKzMwWnBHWDQwNERxSUtVa0VRVXNTU0ZqZitObTR6RHZZQ0lX?=
 =?utf-8?B?MjZGQVVhQ1EvT2RjKzBLbk9PcEplWXlka25nVWRJMVlnY1RqbXcxcU1KeGY1?=
 =?utf-8?B?cnlFSU80VlpLbXhpU3lwRG5tajdlcHltVXZ6Sk1XNi96QzU2dVpIVE5jc0tK?=
 =?utf-8?B?QzJ6Y1NWc3VjRmlUVEZBajVnTUNTV2hDY2RSazUwY3pJeDFJdHU3SnpNeTRK?=
 =?utf-8?B?Z21vTzVIL3BCeG9JcFM4TXZaN2ZDc1Nkd3pZRkhDdlMxQ0xpUmdWQWdYbVNK?=
 =?utf-8?B?eTNndzB5MTU4L0I3ZllzWnRibnNGOW9nMFFYREpLZVNpSU15RDJsOUFzWnBw?=
 =?utf-8?B?NW1yZ1NwTkkzcjQ0UnkrN25ybGNVNlJrNU9CcmtLOGpQTG5VclNhYVdYWWo1?=
 =?utf-8?B?YnVIa3VrTkhwQjhvMzF1OXg3Y0tVYW8wQXNuWHlTM3NkUExsaXI3Q2JMNmVF?=
 =?utf-8?B?RWlTeTJMZTlYVGlRZjVXNjVjOVVvWUF1MTFwcU9TWlFWM3FvZmlFT0VPalVX?=
 =?utf-8?B?UlVKRlBDN2U5bSt3WUFQUVZOS29FT0tlR2kvYTF3ZStrSDFOZk9PM0Z6cjZI?=
 =?utf-8?B?OGhsYVZkM3VXVnozK01MNVliSDgyODZaaGNRaTEzcFdtOW1YOWFuRDNoUWdz?=
 =?utf-8?B?QW80UTltMkhXTm1ISzFqTFNOd3hpSW53SDRmdExpSk1IZEk4YzZxRi9Ranoy?=
 =?utf-8?B?eGltRjNON0NHSXpaNXBCKzlnMnFScEM3ZGI5OFBnTHdrKzlRazRjZDBsVmRu?=
 =?utf-8?B?SzVFb0VqUzhxWThFNnZ4WU5nNDhEUXVIK0NIN3U5M2tOQlAxOSs0N212Rklp?=
 =?utf-8?B?aWtkSjFXeFc3cGFKU1NaVXJVTTdDdHF5UGNZVFlWNEpjVDhNQWcrWkorQ0ph?=
 =?utf-8?B?SWZ6dXpHYkRrRzdRUHA4TzFwTE83MDRjK0c2eVJxMlc2bVNhdXBrcHhpNHdS?=
 =?utf-8?B?ckRDNzJ3NllNdHdHV3ZTbEgwUi9yazF2SWFwcEQyYjh1Rjk2Z1dJdmE4eGxS?=
 =?utf-8?B?cDBESHdhd0FFQWlBbUVMVzI4UFN1dzkxcmllYzBTRXBSdnJMVjBCWERxRjJo?=
 =?utf-8?B?QlhkZ2JWOTJmeVJrOFdkcVpZdWNUa3FJazVQcXRlYUYrYUNTSzg3Y1V0K2NY?=
 =?utf-8?B?dnFjU3lUZkpTSEZPbTRTUlkzR1FWajcxR1NOZDdJRDJuV0c3K1NuSW1MbVVm?=
 =?utf-8?B?aEFIU0FSMDRxcjlYZnZvV3JINEYrTGNjc1BJN21DN2NENTl0MHAvK3gwKzBo?=
 =?utf-8?B?Z1M1Q3c5WUN5R0hUdFYyMXpMQ1JhRWNiZWJiekJnRTk0MURCUFJaM29Ga0F1?=
 =?utf-8?B?RGp3SWx0TGdkaEY2T0xQbmlMRnR3ZmxpMlkwNVRoTk53SjBORmRQOWdHdHRz?=
 =?utf-8?B?b25VSDEzWjFmcDg2VDgvdlJsN3NRRlNFMExMVkthVnkvQ1VibFhWeHM3Tlh0?=
 =?utf-8?B?d1kwNWdqeGcyblVrRTByNEo1SFZCWlhEb0JuWWE2MXE1Wm1heC9seTEremVK?=
 =?utf-8?B?UnZXdlpEaXZoWGNEQUhQdGRiYS9HWTVCOFg1cElianF0d0RUalg5TnZZTjI1?=
 =?utf-8?B?cXpaa1A5SmFCMGltTEl2MVhnclN3amZaeTYxck1xbjNDS1RmLzFQSGszdVFU?=
 =?utf-8?Q?5dM1UzSgM9aRFI90=3D?=
X-Exchange-RoutingPolicyChecked: Lf08CaCDMNG2lj3Pqrl+epYxV14P2ZqAGR6ZxSFrq9yk5TysqAyHlGWfpbSUVWJrMF6YfLSGiT/7FJou5PTReCl2dg4UD741e/c41zTsqzs0QM9vaFMskyQ47W6dWJc1psQgdKmtPMeoW6KSyvsYYiBEuuWBr8kpqjtngsC0cKHH4rcp+4zwfwCYHfpRBkciPvtL/QbBDdMg5kMrnCk3AUOVbZ7dZV8rELb/SbQ5Y8gC/fCxJvSOWNpmKKiqFYC+Tk0uzUj+nbrX2PcQXxKszXlhGEJCfaJr+dNO84aJeK3RYFL5/Mkt+Tay/3CF3tj0O+uBxAG+4SoYb3JPB7LcwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4c9e42-368d-4db0-ee1d-08dec1b0bacc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4793.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 20:43:12.7559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtJj9u2JWTqMYSRas98atGGxIC8k3KwQUGkv8SgcTPTTM/4SYFEc1/9mUhHbo8uBjgCb5JUf7duf4PYaZ6y7ES2AJ3zkIM60ukycG7i9Mzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5279
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



On 6/3/2026 12:48 PM, Matt Roper wrote:
> On Wed, Jun 03, 2026 at 12:41:46PM -0700, Summers, Stuart wrote:
>> On Wed, 2026-06-03 at 12:36 -0700, Matt Roper wrote:
>>> On Wed, Jun 03, 2026 at 12:25:49PM -0700, Matt Roper wrote:
>>>> On Wed, Jun 03, 2026 at 07:18:06PM +0200, Michal Wajdeczko wrote:
>>>>>
>>>>> On 6/3/2026 6:26 PM, Shuicheng Lin wrote:
>>>>>> Replace the per-platform ternary chain in xe_wopcm_size() with
>>>>>> a
>>>>>> field read from xe->info.wopcm_size, populated from the
>>>>>> platform
>>>>>> descriptor.
>>>>> we might want to update check_platform_desc test to catch any
>>>>> missing
>>>>> definitions of wopcm_size field in new device descriptors
>>>>>
>>>>>> Per-platform values are unchanged: SZ_4M for DGFX and MTL,
>>>>>> SZ_2M
>>>>>> for all other platforms.
>>>> Assuming the values here are the total WOPCM size (for the entire
>>>> PCI
>>>> device, not the per-GT subregion), then are these values even
>>>> correct
>>>> and being used for any of the platforms officially supported by Xe?
>>>> From
>>>> what I see on bspec 67090 it sounds like the total size should
>>>> always
>>>> either be 8MB or 16MB for all of our POR platforms?
>>>>
>>>> I think in practice we always find on modern platforms that the
>>>> BIOS has
>>>> already programmed the registers that control the GuC-managed WOPCM
>>>> subregion and locked them before the driver even starts up; in that
>>>> case
>>>> we don't use the value from xe_wopcm_size() at all and instead just
>>>> verify that the pre-programmed regions fit into the larger sizes
>>>> returned by max_wopcm_size().
>>>>
>>>> So I guess that raises the questions:
>>>>
>>>>   - Do we need both xe_wopcm_size() and max_wopcm_size(), and if so
>>>> what
>>>>     is supposed to be the difference in what they represent?  I
>>>> think
>>>>     maybe xe_wopcm_size() was trying to represent some subregion
>>>> that is
>>>>     assumed to be "safe" from collisions with other sub-areas of the
>>>>     WOPCM in cases where we needed to explicitly prorgam the GuC
>>>>     subregion.  But if that's the case, is there a way for us to
>>>> probe
>>>>     those other subregions' sizes/locations directly to avoid
>>>> collisions
>>>>     rather than just using an arbitrary small size that doesn't
>>>> match the
>>>>     total WOPCM size?
>>>>
>>>>   - Do we even need to worry about programming the GuC-managed area
>>>> of
>>>>     the WOPCM anymore on modern platforms or is that a cargo-cult
>>>> from
>>>>     i915 that just isn't relevant anymore?  If it is still relevant,
>>>> is
>>> I see on Bspec 60549 that the GUC_WOPCM_SIZE register can only be
>>> programmed by the GSC on platforms with a de-privileged GuC, so that
>>> does seem to confirm that reprogramming the GuC-specific area of the
>>> WOPCM isn't relevant to any platforms that the Xe driver officially
>>> supports (Xe2 and later), although it's possible that it might be
>>> relevant for some of the unsupported, developer-only platforms (Xe1).
>> That's true, but we do have this code there today. Should we not make
>> it a little more common in the meantime? Or we could hold this under a
>> debug configfs entry or something so it only ever gets used in that
>> case? Maybe we need a debug version of these structures in xe_pci.c?
> The motivation on this patch for moving the numbers into the device
> descriptor was to prepare for future platforms.  But it sounds like that
> will never be the case now since no current or future platforms will
> ever use these numbers.  So if we're going to put anything in the device
> descriptor it sounds like it should be the max_wopcm_size() numbers, not
> the xe_wopcm_size() numbers.
>
> For the old legacy GuC wopcm region programming (which may or may not
> even be relevant for the old Xe1 platforms), I don't know if we really
> need to touch it at all.  But if we do touch it, we should probably
> rename the misleading xe_wopcm_size() and more clearly document what the
> numbers are since they're not actually the total size.

Please note that the WOPCM size can be read from HW (see 
get_wopcm_size() in xe_ttm_stolen_mgr.c). In i915 the WOPCM size was 
initialized before we had HW access and so we used the hardcoded values 
(which work perfectly fine when the driver does the partitioning, 
because we don't have to use the actual HW programmed value as long as 
the one we're using is <= to it), and I think that got transplanted 
as-is to Xe. I believe that the best solution is to just switch to 
reading the WOPCM size from HW everywhere.

Note that there are multiple places where the WOPCM size is required
1 - During stolen init, as mentioned above
2 - During GGTT early init, because the [0, WOPCM_SIZE) range is 
inaccessible to GuC and so we can't map stuff in that range. To be more 
correct, the range that can't be accessed is [0, GUC_WOPCM_TOP), but 
with multiple GTs we have different values of TOP per-GT so it is easier 
to just use the [0, WOPCM_SIZE) range to cover everything.
3 - For calculating the GuC/HuC area partitioning, or validating the 
values found if already programmed

Regarding #3, as Matt mentioned the partitioning is done by IFWI on 
MTL+, and I'd argue that we should just trust IFWI and stop validating 
these values; as long as we're still logging them, if things go wrong at 
GuC load time due to bad partitioning we'll have the info in dmesg for 
debug. We can keep the partitioning logic restricted to legacy non-POR 
platform.

Daniele

>
>
> Matt
>
>> Thanks,
>> Stuart
>>
>>>
>>> Matt
>>>
>>>>     the GuC subregion the only one that we'd need to program in the
>>>> KMD?
>>>>
>>>> If we're moving the size(s) into the xe_device structure, then I
>>>> think
>>>> we'd expect the field to either contain the total size (which would
>>>> be
>>>> the values from max_wopcm_size rather than xe_wopcm_size) or we'd
>>>> expect
>>>> the field name + kerneldoc to very clearly explain what subset of
>>>> the
>>>> WOPCM it's actually trying to represent and what it can/should be
>>>> used
>>>> for.
>>>>
>>>> +Cc Daniele since I think he understands the WOPCM stuff a lot
>>>> better
>>>> than I do.
>>>>
>>>>
>>>> Matt
>>>>
>>>>>> This prepares for newer platforms that may need a different
>>>>>> size.
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
>>>>>> ---
>>>>>> Cc: Stuart Summers <stuart.summers@intel.com>
>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>>>>>   drivers/gpu/drm/xe/xe_pci.c          | 15 ++++++++++++++-
>>>>>>   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
>>>>>>   drivers/gpu/drm/xe/xe_wopcm.c        | 11 +----------
>>>>>>   4 files changed, 18 insertions(+), 11 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>>>>>> b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>> index 32dd2ffbc796..f44c031e3553 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>>>> @@ -139,6 +139,8 @@ struct xe_device {
>>>>>>                  u8 vm_max_level;
>>>>>>                  /** @info.va_bits: Maximum bits of a virtual
>>>>>> address */
>>>>>>                  u8 va_bits;
>>>>>> +               /** @info.wopcm_size: Size of WOPCM region for
>>>>>> this platform */
>>>>>> +               u32 wopcm_size;
>>>>>>   
>>>>>>                  /*
>>>>>>                   * Keep all flags below alphabetically sorted
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>>>>>> b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> index 3165686e3e04..6b7dd8661f64 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>>>> @@ -10,6 +10,7 @@
>>>>>>   #include <linux/module.h>
>>>>>>   #include <linux/pci.h>
>>>>>>   #include <linux/pm_runtime.h>
>>>>>> +#include <linux/sizes.h>
>>>>>>   
>>>>>>   #include <drm/drm_color_mgmt.h>
>>>>>>   #include <drm/drm_drv.h>
>>>>>> @@ -206,6 +207,7 @@ static const struct xe_device_desc tgl_desc
>>>>>> = {
>>>>>>          .require_force_probe = true,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 3,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   static const struct xe_device_desc rkl_desc = {
>>>>>> @@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc
>>>>>> = {
>>>>>>          .require_force_probe = true,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 3,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   static const u16 adls_rpls_ids[] = { INTEL_RPLS_IDS(NOP), 0 };
>>>>>> @@ -243,6 +246,7 @@ static const struct xe_device_desc
>>>>>> adl_s_desc = {
>>>>>>          },
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 3,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   static const u16 adlp_rplu_ids[] = { INTEL_RPLU_IDS(NOP), 0 };
>>>>>> @@ -265,6 +269,7 @@ static const struct xe_device_desc
>>>>>> adl_p_desc = {
>>>>>>          },
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 3,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   static const struct xe_device_desc adl_n_desc = {
>>>>>> @@ -281,10 +286,12 @@ static const struct xe_device_desc
>>>>>> adl_n_desc = {
>>>>>>          .require_force_probe = true,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 3,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   #define DGFX_FEATURES \
>>>>>> -       .is_dgfx = 1
>>>>>> +       .is_dgfx = 1, \
>>>>>> +       .wopcm_size = SZ_4M
>>>>>>   
>>>>>>   static const struct xe_device_desc dg1_desc = {
>>>>>>          .pre_gmdid_graphics_ip = &graphics_ip_xelpp,
>>>>>> @@ -378,6 +385,7 @@ static const struct xe_device_desc mtl_desc
>>>>>> = {
>>>>>>          MULTI_LRC_MASK,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 3,
>>>>>> +       .wopcm_size = SZ_4M,
>>>>>>   };
>>>>>>   
>>>>>>   static const struct xe_device_desc lnl_desc = {
>>>>>> @@ -391,6 +399,7 @@ static const struct xe_device_desc lnl_desc
>>>>>> = {
>>>>>>          .needs_scratch = true,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 4,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   static const u16 bmg_g21_ids[] = { INTEL_BMG_G21_IDS(NOP), 0
>>>>>> };
>>>>>> @@ -436,6 +445,7 @@ static const struct xe_device_desc ptl_desc
>>>>>> = {
>>>>>>          .needs_shared_vf_gt_wq = true,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 4,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   static const struct xe_device_desc nvls_desc = {
>>>>>> @@ -450,6 +460,7 @@ static const struct xe_device_desc
>>>>>> nvls_desc = {
>>>>>>          .require_force_probe = true,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 4,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   static const struct xe_device_desc cri_desc = {
>>>>>> @@ -489,6 +500,7 @@ static const struct xe_device_desc
>>>>>> nvlp_desc = {
>>>>>>          .require_force_probe = true,
>>>>>>          .va_bits = 48,
>>>>>>          .vm_max_level = 4,
>>>>>> +       .wopcm_size = SZ_2M,
>>>>>>   };
>>>>>>   
>>>>>>   #undef PLATFORM
>>>>>> @@ -757,6 +769,7 @@ static int xe_info_init_early(struct
>>>>>> xe_device *xe,
>>>>>>          xe->info.va_bits = desc->va_bits;
>>>>>>          xe->info.vm_max_level = desc->vm_max_level;
>>>>>>          xe->info.vram_flags = desc->vram_flags;
>>>>>> +       xe->info.wopcm_size = desc->wopcm_size;
>>>>>>   
>>>>>>          xe->info.is_dgfx = desc->is_dgfx;
>>>>>>          xe->info.has_cached_pt = desc->has_cached_pt;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
>>>>>> b/drivers/gpu/drm/xe/xe_pci_types.h
>>>>>> index 5b85e2c24b7b..35acb878c111 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>>>>>> @@ -34,6 +34,7 @@ struct xe_device_desc {
>>>>>>          u8 va_bits;
>>>>>>          u8 vm_max_level;
>>>>>>          u8 vram_flags;
>>>>>> +       u32 wopcm_size;
>>>>>>   
>>>>>>          u8 require_force_probe:1;
>>>>>>          u8 is_dgfx:1;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c
>>>>>> b/drivers/gpu/drm/xe/xe_wopcm.c
>>>>>> index 900daf1d1b1b..783bf37c87ef 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>>>>>> @@ -48,13 +48,6 @@
>>>>>>    * context).
>>>>>>    */
>>>>>>   
>>>>>> -/* Default WOPCM size is 2MB from Gen11, 1MB on previous
>>>>>> platforms */
>>>>>> -/* FIXME: Larger size require for 2 tile PVC, do a proper
>>>>>> probe sooner or later */
>>>>>> -#define DGFX_WOPCM_SIZE                        SZ_4M
>>>>>> -/* FIXME: Larger size require for MTL, do a proper probe
>>>>>> sooner or later */
>>>>>> -#define MTL_WOPCM_SIZE                 SZ_4M
>>>>>> -#define WOPCM_SIZE                     SZ_2M
>>>>>> -
>>>>>>   /* 16KB WOPCM (RSVD WOPCM) is reserved from HuC firmware top.
>>>>>> */
>>>>>>   #define WOPCM_RESERVED_SIZE            SZ_16K
>>>>>>   
>>>>>> @@ -179,9 +172,7 @@ static int __wopcm_init_regs(struct
>>>>>> xe_device *xe, struct xe_gt *gt,
>>>>>>   
>>>>> while around, can you add kernel-doc here?
>>>>>
>>>>>>   u32 xe_wopcm_size(struct xe_device *xe)
>>>>>>   {
>>>>>> -       return IS_DGFX(xe) ? DGFX_WOPCM_SIZE :
>>>>>> -               xe->info.platform == XE_METEORLAKE ?
>>>>>> MTL_WOPCM_SIZE :
>>>>>> -               WOPCM_SIZE;
>>>>>> +       return xe->info.wopcm_size;
>>>>>>   }
>>>>>>   
>>>>>>   static u32 max_wopcm_size(struct xe_device *xe)
>>>> -- 
>>>> Matt Roper
>>>> Graphics Software Engineer
>>>> Linux GPU Platform Enablement
>>>> Intel Corporation

