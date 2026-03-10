Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC0CF3C27D
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 09:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF0C10E6A7;
	Tue, 10 Mar 2026 09:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkuqSY52";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD83B10E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773136442; x=1804672442;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VwPqFBlFxxFv0KKEEmlqpNL2vZT41YJISZ5DTaHghfU=;
 b=GkuqSY52HXyawyK+6RaufOsFhz0RcLq86O77ICyfirb8qMWkvcXswbOC
 Txw2BGLXFkpVmjCMdoDmG/H6jZvOyt9MWpWfONZg1J7FqmKfG54r+808A
 ni36iwSR5Y16GuGaQqmRu5QhH/zyRu9cqoKppxOcSzck28Q0s148GKxly
 tHBMbCobWa8UE1nw8RrpB3NjFnO2V6R7QRkM3MZPXnwKWCaONXaZNNAG7
 ZZj0Jeg/6TjXXMDul8mlH7Z0fly+YoImCk1ZTsHq3JrZLh0GYAajVwrxl
 5dNO/s7psA9SWaw+DfHnbwDTZAdpHZhqYkBvrHJSbdHJgrz8y5EjK7teC w==;
X-CSE-ConnectionGUID: e6r0qvbSRd64jKfWDTOIPg==
X-CSE-MsgGUID: /znojNpRR6OHTwFgOtb2dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74293252"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74293252"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:54:02 -0700
X-CSE-ConnectionGUID: uxD2mKL2QRiKQ8+mac1Wbg==
X-CSE-MsgGUID: dI5L15ivQL+ILsTzm5A7zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="250543064"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 02:54:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:54:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 02:54:00 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 02:54:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3wVHxmQWZFmkcxEeeXQaBWYD2m+CH6M79vnmjhZQhXDxU6kVA9GanEVPE6O8gVZbN582VSIkVjHrhnit5r1+ab9A57ikpvDviGKFjontJBOtABMO4U/bSpKLisTvoRCocBg4lyDi6QGRG4W899uHO9Gj7s+K10WC3rLwOb4nCUjzzN4P27mwvKozVV1kWh/fdCtP4Au7QQBWot9Prtw03VdfsqW6MMCNzUJEyUYKzOcpVZvA0q3+3rDApA9ejDOLXIGLWZjBek2pWAmFVLZ0dY3WdDM+mONAIBPWPvNfW90G+fKfnJTIgHXy2U6U+Rxju7/oyAPZ//VpaGwS2udrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlDovMIK9AqQ3tvR3lQ/TTMOoshyXBI/IWF695WpxLs=;
 b=wViezyjUzh4zaD7cR6exUaHulErDWItivG2CWqI1xqziDAnnAtyWnJ1BHjFonVbUceYUJHYdBmKFz8DrsiS2TIrG3IKg4/krxo8R6YkWq9MjfMWRf702HAX8KTSKpIjSG5Z+InmrvEW3X+gV2AshbJqTrv1tLREoPSMeU6LG9aC5brxML/u+jYMhq3GbbwxWuXMY4FD1XmKWW4+4ZvGZoZyT7lG/pjlALwv7czDtosazrv1nIX2pWF488t4rI/TX9KxErBvOgUPDKu6kyrhBbL/xX2nCjFaI2+yOnup4dXBarfu7DIIJsBzRW/JFFY9KpxQdPn7ij75JDq+mhoxtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Tue, 10 Mar
 2026 09:53:41 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 09:53:41 +0000
Date: Tue, 10 Mar 2026 15:23:31 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 5/6] drm/xe/sysctrl: Add mailbox communication
 implementation
Message-ID: <aa/qG8s2PAtXVs4g@soc-5CG1426VCC.clients.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-13-anoop.c.vijay@intel.com>
 <aa6WJHzxkUbXrqXU@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa6WJHzxkUbXrqXU@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MA5P287CA0123.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f39270-c76f-4779-3282-08de7e8ae8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: rVAdYQUBusylMh+vyIMKYf2r3SxsDTFXwIZD1XKjR7XgBp7k2ehUJDyUc2u8cArfFXaFlUvxX+P9j/5gSRnUlHk+7BkSCVzRpZPC7Ry4XQgFsvygnIxXRa+0nqQIQoNM5Me0hmHTAl/7G9VjtwrI5sxuqi2JlH4Jes2MDi1M1DlTwg1L+7J6s/ds+JWT682kTvm2WhuNJjpwjexcN6Tzed9lo8jN7k9FDxSdnfCVna+Ogq7LJfUcO3OInvSw8OE0aI0l7AC2r1OCwCBX4vYCb7fEndw4Qnv85nETWt9A6xCPDYnommO3Plldq1B2IPEkUzT6vKGgLiz2q2yfyQ4Mrh6ZA0G5OWGDbQ9hCU6Go705z0cBxVragd0tp41xiNX0Ty/29PiYwN64NCiwW2k4xA4c0RCaXvxSe+x086kzIF6lKHfYiwmsr1ncUkcZKz+ZOnpfz6B/V2LXXqFEDFTYdD7Z/CO6QCiU/jMpEtv98Wic2VVQoXUJWoMhyZ7wGv6SWR3CBba6jcjPPFFKWZirxKfHAzxwje9BTc9rnxb50fjdqBQGRAAYe46pmpHwT0iYKPYYmhoCTLmw2Bk5LB8hKdfpwtbEUg3mart2Vqlpz04kHiALhVaomTTU1lBg1Y68XIzzzkTsm8huHVebq83uv47XKsJKS6hKi+fIXHpM/fzkWwan2TwEJM5Gj4YCcv1JK9u1iNbrNsAH5T4uZe9LRKUiAdVxT5tmH1SnmLEoLVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEp6Y05HdzdtU1hEYnIxaWRMSWFrMFZrOExid21TSitmRjhnd1RTSkgwMUZ4?=
 =?utf-8?B?eUNnMFFmOXNIZ2dqdklzQ0dZQU15YWFHL2lta0YzSG85UFliODExaGJSL0FU?=
 =?utf-8?B?UUorT3RzZEhKUUVQLzJiSjdEcGJxQVo2RlByaEhEK01MQUttNXc3K3VpTzNq?=
 =?utf-8?B?NWZFOWF3b2tsOFZHWXU0NkF1ZXlxd0FFYXU2TlY2R2x0WE5tQ2N4Z1MxMnpy?=
 =?utf-8?B?aFBnYlhXMnNxNzRPeFZ4ZXkwMG9DSjByWHNnYzViVXBkS3VRcnNpQk5Ja0h1?=
 =?utf-8?B?alBNN083KzBVZkM3eXlyWnk3TzB1N2RYMERTdFpCRjAxNGhteS8wQmhsQU1o?=
 =?utf-8?B?T1pGa1ZwUEtRTHpQeUlKYXduY3RiWXJwazJPSW4vVFpLTUI2M080ZlRXelZZ?=
 =?utf-8?B?MVNiMkpYUkowNzdjZkdmT3dpQ2lDS0xDZzBmV3ZuVHJrQUIvdzNZMExnN1Bq?=
 =?utf-8?B?bnF1M1NmdHZoeDRuQ3d6ckQ2cDB2MWVTYWMvU2R1UTk5bjRpdTNzeVFiNVJ0?=
 =?utf-8?B?YmNPcW02UEhFbVRnUzVvditUam52SllUaTRuSUk0ckpWZm11cW40L0RnNGV6?=
 =?utf-8?B?RDhlQ0dnaWJKd0l6L3NHSndVdG1uYnhmR1REMlR6d3lXWTBYV2g1cXlNMHFJ?=
 =?utf-8?B?cGExb3Z4QW9ta1pGOVc2TTYwTVBTTXhxcCtpQXdKb0h5SzBXTFg0Yytxemo2?=
 =?utf-8?B?NkwxTzc0VGVkc2FiSWJ6SmhrSVZ6Q0R5aVpDbmRFaGZaZ1lpalR6TG45Wkh5?=
 =?utf-8?B?ZWNqa1dyamN5MFpMVWhzWU1qdldRRyttTzdxMVZ0SlF2ajVIeTlEV3hkRWdV?=
 =?utf-8?B?bU1neHBYRm5LODA3UXc2aHVoMmo0alhaOENBWm9FS2FIdXh2RGJDZzlnZ09V?=
 =?utf-8?B?a3BZcm9VWk5ZU0JvRFV2RWFDUEh4WUtjVVF3TXNkYU9lRSswTExZdDk0Z0cx?=
 =?utf-8?B?L1gvK2d0TmcwZkEzSG9hM3NBc3dkTkZ4b0dHU3EyVzVjNlp1RnBadU9HZ25y?=
 =?utf-8?B?UDhjR2lKTUN0TmJaa1djcGlIWGQxcnVBQklsUHRpWUNnQXh1aWxCOURtVVRi?=
 =?utf-8?B?WTJ2dEd5K053SFlkdkxOQlByblFsQTUwMTRRdzg0QTVDUnQxU0ZJZ2Rpb2d2?=
 =?utf-8?B?OW91cFBnR2xvUEYwSHJvMUdCVmRiVmZwS0hjeW83MDJJTWw1ZVFaQmlTNmhh?=
 =?utf-8?B?NEczSDU2dE9WeGpKK0VzOHlrTHNYM2pDTXEzdWsrVjJaOG9hdHFVQjlMSWxZ?=
 =?utf-8?B?OWpnT0UzTW1WOEtiaitvUVVxcUFCSTBzMUFmZmNSbVNDc3BXSE00dWJ5Tkky?=
 =?utf-8?B?ZTZpYVN1NUdydjJRblpIaVZFT1YxVjQyV3h6cnh1UG8zQUxlbloyS0VwYXVT?=
 =?utf-8?B?NnN0WUNRZFVodFpIbkVKRWVqZmNjZzRrSWhlNHBXaTl6VTZmSEM2YnlxSlc4?=
 =?utf-8?B?QXE4L3VDNWRubGRqZ1VQOTh1QitXOTQ1ZktJOWVlL2xEamp3RUFPZVhNdGhm?=
 =?utf-8?B?Nyt2WERVVWhhdVg2ZmtBR1hpaHVuMS9HWjhJUkVJSXhXbGcwZG5ORCszcmpJ?=
 =?utf-8?B?eEduUlRUM0NrOVMrZFhZdWR3T1pjOEd1cVNXaEFXeUlWRWVJNWZTaCt1NzJ2?=
 =?utf-8?B?MnBaWUo2aVVWc0ZhSHVXNHVkVVRYd3RGYWszb1lkY0dsRDZkdjBFQ09ZUzdX?=
 =?utf-8?B?SGtYZnZDM3FJc05rWGhsRTJNWWdMRmdtZWozT1lxdGYrTmxnOWF2VDl6MXZO?=
 =?utf-8?B?eTU4SHdiMkozT0VrZXAwYTI0VVd3Yjk4WmJ6R2JvTlE1bXhNaWs2NGhNY2Vr?=
 =?utf-8?B?ZVlQd2NhV294NEt3aU1hZ0JEemFha0IrR2pSeVpVRlRyZTdTTE13aTNxcWVO?=
 =?utf-8?B?RjJtVUovRG1nTU1Md210TUVOMEhGTkJnQXZpQS9OZ3lxV21mUnNXQ1BpaGRQ?=
 =?utf-8?B?c25yblZqYVdVaHpGQ0xNT0prVmZHb0NFcjlINm1rdzBTdmUzWUxJK3NYcHpR?=
 =?utf-8?B?d2ZpVE0wdlY4UnM1WFZpelQzdXRSTHZIRG5YQU9qeHpSNmtndjMxQnVXL3NK?=
 =?utf-8?B?aWFhUzQycjhwc2ZNVVk1NGJkcmhZL0xmdXJPT0JOSVl6c1Q5ZkcwdHNkSUtH?=
 =?utf-8?B?UEdIVGwxQWlsU0NoK1VNeGJwQXFreHMzdnpYWWV5ZFpKeWVmVU81ZWE3a2FV?=
 =?utf-8?B?Q0NuNUZPVnBaak8xRGRKdnR4WjhsdlNBVk9CaXpUb3I0YUEvTTh3R05xV3V2?=
 =?utf-8?B?U3gzdndVeHVDYVM2K040REhrZmlIQXpNaTJ4VmRFRzVIQml2MnpmQ2xmZUt0?=
 =?utf-8?B?Y0piSjNndzEzSzhEM09XZ3BHdW96ZlphK1QwOGVOQzRwcHhGZml4OUJUUjQx?=
 =?utf-8?Q?Tko1SvErgyLvFwdQ=3D?=
X-Exchange-RoutingPolicyChecked: UxZpq8yB70C/H7w/g0ZNaucl6mArl8wRi42VAqq6sstjVFu7BAwpbRFtyT+OTCWLbVUEqn0AXNxfRunjhaW005LBVH6ozJk+iXiZB+TjKN9Tq81DEJxTQfVt463Ov+7KgtgJ/yo3LxGAUzLqJrctSq1oSMfIVVQ3pucrn+vJkS2gzo05uhlCSJwfYUp3DaWqgmaC8QT54uHAm1UavGPKVDA7KX4QM+TgO1YrbE29ietPYoNr/axzRXnpTZGJx5BmozV5tNkCVlMq6KyeceqIh6oemwAmtX240jMWBZQDpq8hqf7BZ/0T8E9Q+KC5mLXBg0yp0XUkGnm3IKdAvSlU8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f39270-c76f-4779-3282-08de7e8ae8db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:53:41.2186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZ349URYjiMjr5ct72Wmv+Xgg+ZG9tifel4QU1EOC4M0A0Tc995cN3JpXlrZDl7jPmGjUBq5ml7MJ9qCCFq+iajS06NI57o5WVVttHLanZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
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

On Mon, Mar 09, 2026 at 03:13:00PM +0530, Umesh Nerlige Ramappa wrote:
>On Mon, Mar 02, 2026 at 12:10:07AM -0800, Anoop, Vijay wrote:
>>From: Anoop Vijay <anoop.c.vijay@intel.com>
>>
>>Adding mailbox communication layer for System Controller
>>interaction. The mailbox interface enables sending commands and
>>receiving responses from embedded System Controller.
>>
>>Key features:
>>- Command/response protocol handling
>>- Timeout and error management
>>- Uses MKHI protocol headers defined in ABI
>>
>>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>>---
>>v4: (Matt, Mike)
>>- Refactor MMIO access to use domain-specific accessor
>>- Add input validation and buffer overflow protection
>>- Add bounds checking for multi-frame operations
>>- Fix potential NULL pointer dereference
>>
>>v5: (Umesh, Riana)
>>- Reset phase bit to 0 on error conditions
>>- Refactor mailbox receive path
>>- Updated xe_err messages for consistency
>>
>>v6: (Matt)
>>- Use SYSCTRL_MB_CTRL_MKHI_CMD macro instead of FIELD_PREP
>>
>>v8 (Matt, Michal):
>>- Reordered patches for logical flow
>>- Static functions renamed with short prefix
>>- Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
>>- Added frame length validation and command overflow protection
>>- Use REG_FIELD_PREP for hardware registers
>>- Changed error format to %pe
>>- Removed unnecessary NULL checks and explicit zeros
>>- Fixed kernel-doc syntax
>>---
>>drivers/gpu/drm/xe/Makefile             |   1 +
>>drivers/gpu/drm/xe/xe_sysctrl.c         |   2 +
>>drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 364 ++++++++++++++++++++++++
>>3 files changed, 367 insertions(+)
>>create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>
>>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>index 07e028fa50e8..1890bbd1b28d 100644
>>--- a/drivers/gpu/drm/xe/Makefile
>>+++ b/drivers/gpu/drm/xe/Makefile
>>@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
>>	xe_survivability_mode.o \
>>	xe_sync.o \
>>	xe_sysctrl.o \
>>+	xe_sysctrl_mailbox.o \
>>	xe_tile.o \
>>	xe_tile_sysfs.o \
>>	xe_tlb_inval.o \
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>>index 2751fe25a6ff..365f73ef680d 100644
>>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>>@@ -78,5 +78,7 @@ int xe_sysctrl_init(struct xe_device *xe)
>>	if (ret)
>>		return ret;
>>
>>+	xe_sysctrl_mailbox_init(sc);
>>+
>>	return 0;
>>}
>>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>new file mode 100644
>>index 000000000000..0e154b6dcdc7
>>--- /dev/null
>>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>>@@ -0,0 +1,364 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2026 Intel Corporation
>>+ */
>>+
>>+#include <linux/bitfield.h>
>>+#include <linux/cleanup.h>
>>+#include <linux/container_of.h>
>>+#include <linux/errno.h>
>>+#include <linux/minmax.h>
>>+#include <linux/mutex.h>
>>+#include <linux/slab.h>
>>+#include <linux/string.h>
>>+#include <linux/types.h>
>>+
>>+#include "regs/xe_sysctrl_regs.h"
>>+#include "xe_device.h"
>>+#include "xe_device_types.h"
>>+#include "xe_mmio.h"
>>+#include "xe_pm.h"
>>+#include "xe_printk.h"
>>+#include "xe_sysctrl.h"
>>+#include "xe_sysctrl_mailbox.h"
>>+#include "xe_sysctrl_mailbox_types.h"
>>+#include "xe_sysctrl_types.h"
>>+
>>+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
>>+	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>>+
>>+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
>>+	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>>+
>>+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
>>+	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>>+
>>+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
>>+	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>>+
>>+static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>>+				   unsigned int timeout_ms)
>>+{
>>+	int ret;
>>+
>>+	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>+				 timeout_ms * 1000, NULL, false);
>>+
>>+	return ret == 0;
>>+}
>>+
>>+static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>>+				 unsigned int timeout_ms)
>>+{
>>+	int ret;
>>+
>>+	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>>+			     timeout_ms * 1000, NULL, false);
>>+
>>+	return ret == 0;
>>+}
>>+
>>+static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>>+			       size_t len)
>>+{
>>+	static const struct xe_reg regs[] = {
>>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>>+	};
>>+	struct xe_device *xe = sc_to_xe(sc);
>>+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>>+	u32 i;
>>+
>>+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
>>+
>>+	memcpy(val, frame, len);
>>+
>>+	for (i = 0; i < dw; i++)
>>+		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>>+
>>+	return 0;
>>+}
>>+
>>+static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
>>+			      size_t len)
>>+{
>>+	static const struct xe_reg regs[] = {
>>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>>+	};
>>+	struct xe_device *xe = sc_to_xe(sc);
>>+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>>+	u32 i;
>>+
>>+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
>>+
>>+	for (i = 0; i < dw; i++)
>>+		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>>+
>>+	memcpy(frame, val, len);
>>+
>>+	return 0;
>>+}
>>+
>>+static void sysctrl_clear_response(struct xe_sysctrl *sc)
>>+{
>>+	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
>>+}
>>+
>>+static int sysctrl_prepare_command(struct xe_device *xe,
>>+				   u8 group_id, u8 command,
>>+				   const void *data_in, size_t data_in_len,
>>+				   u8 **mbox_cmd, size_t *cmd_size)
>>+{
>>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>>+	size_t size;
>>+	u8 *buffer;
>>+
>>+	xe_assert(xe, command <= MKHI_HDR_COMMAND_MAX);
>>+
>>+	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
>>+		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>>+		return -EINVAL;
>>+	}
>>+
>>+	size = sizeof(*mkhi_hdr) + data_in_len;
>>+
>>+	buffer = kmalloc(size, GFP_KERNEL);
>>+	if (!buffer)
>>+		return -ENOMEM;
>>+
>>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>>+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
>>+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command));
>>+
>>+	if (data_in && data_in_len)
>>+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>>+
>>+	*mbox_cmd = buffer;
>>+	*cmd_size = size;
>>+
>>+	return 0;
>>+}
>>+
>>+static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>+			       const u8 *mbox_cmd,
>>+			       size_t cmd_size, unsigned int timeout_ms)
>>+{
>>+	struct xe_device *xe = sc_to_xe(sc);
>>+	u32 ctrl_reg, total_frames, frame;
>>+	size_t bytes_sent, frame_size;
>>+
>>+	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>+
>>+	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>>+		return -EBUSY;
>>+	}
>>+
>>+	sc->phase_bit ^= 1;
>>+	bytes_sent = 0;
>>+
>>+	for (frame = 0; frame < total_frames; frame++) {
>>+		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>>+
>>+		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>>+			sc->phase_bit = 0;
>>+			return -EIO;
>>+		}
>>+
>>+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
>>+			   REG_FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>>+			   REG_FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>>+			   SYSCTRL_MB_CTRL_MKHI_CMD |
>>+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>>+
>>+		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>+
>>+		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>>+			sc->phase_bit = 0;
>>+			return -ETIMEDOUT;
>>+		}
>>+
>>+		bytes_sent += frame_size;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>>+				 size_t frame_size, unsigned int timeout_ms,
>>+				 bool *done)
>>+{
>>+	u32 curr_frame, total_frames, ctrl_reg;
>>+	struct xe_device *xe = sc_to_xe(sc);
>>+	int ret;
>>+
>>+	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>>+		xe_err(xe, "sysctrl: Response frame timeout\n");
>>+		return -ETIMEDOUT;
>>+	}
>>+
>>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>>+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg);
>>+	curr_frame = FIELD_GET(MKHI_FRAME_CURRENT_MASK, ctrl_reg);
>>+
>>+	ret = sysctrl_read_frame(sc, out, frame_size);
>>+	if (ret)
>>+		return ret;
>>+
>>+	sysctrl_clear_response(sc);
>>+
>>+	if (curr_frame == total_frames)
>>+		*done = true;
>>+
>>+	return 0;
>>+}
>>+
>>+static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>>+				  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>>+				  void *data_out, size_t data_out_len,
>>+				  size_t *rdata_len, unsigned int timeout_ms)
>>+{
>>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>>+	struct xe_device *xe = sc_to_xe(sc);
>>+	size_t remain = sizeof(*mkhi_hdr) + data_out_len;
>>+
>
>Extra line here ^ must be deleted.
>
>>+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
>>+	size_t frame_size;
>>+	bool done = false;
>>+	int ret = 0;
>>+	u8 *out;
>>+
>>+	if (!buffer)
>>+		return -ENOMEM;
>>+
>>+	out = buffer;
>>+	while (!done && remain) {
>>+		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
>>+
>>+		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
>>+					    &done);
>>+		if (ret)
>>+			return ret;
>>+
>>+		remain -= frame_size;
>>+		out += frame_size;
>>+	}
>>+
>>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>>+
>>+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(mkhi_hdr) ||
>>+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
>>+	    XE_SYSCTRL_MKHI_HDR_COMMAND(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
>>+		xe_err(xe, "sysctrl: Response header mismatch\n");
>>+		return -EPROTO;
>>+	}
>>+
>>+	if (XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr) != 0) {
>>+		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>>+		       XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr));
>>+		return -EIO;
>>+	}
>>+
>>+	memcpy(data_out, mkhi_hdr + 1, data_out_len);
>>+	*rdata_len = out - buffer - sizeof(*mkhi_hdr);
>>+
>>+	return 0;
>>+}
>>+
>>+static int sysctrl_send_command(struct xe_sysctrl *sc,
>>+				const u8 *mbox_cmd, size_t cmd_size,
>>+				void *data_out, size_t data_out_len,
>>+				size_t *rdata_len, unsigned int timeout_ms)
>>+{
>>+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>>+	size_t received;
>>+	int ret;
>>+
>>+	ret = sysctrl_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
>>+	if (ret)
>>+		return ret;
>>+
>>+	if (!data_out || !rdata_len)
>>+		return 0;
>>+
>>+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
>>+
>>+	ret = sysctrl_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
>>+				     &received, timeout_ms);
>>+	if (ret)
>>+		return ret;
>>+
>>+	*rdata_len = received;
>>+
>>+	return 0;
>>+}
>>+
>>+/**
>>+ * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>>+ * @sc: System controller structure
>>+ *
>>+ * Initialize system controller mailbox interface for communication.
>>+ */
>>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>>+{
>>+	u32 ctrl_reg;
>>+
>>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>>+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>>+}
>>+
>>+/**
>>+ * xe_sysctrl_send_command() - Send command to System Controller via mailbox
>>+ * @sc: System Controller instance
>>+ * @cmd: Pointer to xe_sysctrl_mailbox_command structure
>>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>>+ *
>>+ * Send a command to the System Controller using MKHI protocol. Handles
>>+ * command preparation, fragmentation, transmission, and response reception.
>>+ *
>>+ * Return: 0 on success, negative error code on failure
>>+ */
>>+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>+			    struct xe_sysctrl_mailbox_command *cmd,
>>+			    size_t *rdata_len)
>>+{
>>+	struct xe_device *xe = sc_to_xe(sc);
>>+	u8 group_id, command_code;
>>+	u8 *mbox_cmd = NULL;
>>+	size_t cmd_size = 0;
>>+	int ret = 0;
>>+
>>+	xe_assert(xe, xe->info.has_sysctrl);
>>+	xe_assert(xe, !cmd->data_in || cmd->data_in_len);
>>+	xe_assert(xe, !cmd->data_out || cmd->data_out_len);
>
>Is it possible for both data_in and data_out to the NULL? If not, then 
>you at least need another assert.
>
>	xe_assert(xe, cmd->data_in || cmd->data_out);

With the above addressed,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Umesh
>>+
>>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>>+
>>+	might_sleep();
>>+
>>+	ret = sysctrl_prepare_command(xe, group_id, command_code,
>>+				      cmd->data_in, cmd->data_in_len,
>>+				      &mbox_cmd, &cmd_size);
>>+	if (ret) {
>>+		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
>>+		return ret;
>>+	}
>>+
>>+	guard(xe_pm_runtime)(xe);
>>+
>>+	guard(mutex)(&sc->cmd_lock);
>>+
>>+	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
>>+				   cmd->data_out, cmd->data_out_len, rdata_len,
>>+				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>>+	if (ret)
>>+		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>>+
>>+	kfree(mbox_cmd);
>>+
>>+	return ret;
>>+}
>>-- 
>>2.43.0
>>
