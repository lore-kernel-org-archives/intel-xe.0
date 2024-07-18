Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4578C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 13:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C88510E817;
	Thu, 18 Jul 2024 13:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qy5O4JQq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32E910E82B
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 13:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721307749; x=1752843749;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ey9w2f8UX8Lq+Xticzc13afQsHC96g/HXfL6V9FDe6k=;
 b=Qy5O4JQq3l89ftF5ZgtzJYJ4CcFsIyzcRTvP2hH9mDkr5HqFp6eN77U7
 yOkK63amSU511jeyzbblUM2pZsQnyy+BGZezlclqHei1Y78abLIESbWav
 gxNx2SYfzGTYOnoTwRPz2zBu8HSY3ac62xI4oFeRjbtw15xAGSlyzvNJO
 Lk32kA2SsvZB8luxpzukrAT4d2YiJq6U3BvI4CcIiO2PNpf72eTFZDLzy
 hMyfIE+Qz92lJt92yt8ufrom4384bwmmklWGZDBEP9XWtYyq5EKYhlWSf
 52/V0fE+zBtK1A2jm1vi7SlztnrNYyFTqVb7OJZ0IlqssxfceSj4qBpqr A==;
X-CSE-ConnectionGUID: nAG4qNCqRSar3HRUSCHYDg==
X-CSE-MsgGUID: Ufgn4ZdsQg61gOxXFpwRtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22636314"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22636314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 06:01:25 -0700
X-CSE-ConnectionGUID: vE9/Z0KySUK1ji8Gk2LbCg==
X-CSE-MsgGUID: WqJsxXF5TLqbuivtPAOayA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="73983852"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 06:01:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 06:01:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 06:01:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 06:01:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 06:01:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPIbCAbjyruKPK8mqErCErhTCofOhpoQ2TfNR7mRLBZEVIOKLJB5jD67wv0zfLUzjARwtopFeu4VEFzszSnP2KgiNLo8pV+/pMav3Nwesgf2GVavYwyqSzmvBzazAZy4a2ceYasxBG7/FX4CXjFzsBNYkKBsUCyZLSfsIzMpYpVctda4SMEAzvZI4pVdmKUpftr7l+q77uAGLijRwfU/l0gl8dYC9ggjP88sxNggDFwNev8ZU5IRxA3bHuic9YyyOSqxjWmUq9H+dlNUMFyF6pxgL5RRDSsSBb69UyasQaUnI99v4QAEB9egM9E+Ms3nAOvHuoW9VJR8LFgtLGJL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUhw33QPDiaYl/VH7seIF4FpG7TOGy5uv1J44eUDSxQ=;
 b=HvZVLkKRfT1BILF53+tiYlGCaDhBh/9IbuA+4qmqGuY87sS54BjuJ/jUlZkQ4Rxof/FInaYIU6VF/H/Zu+2leBZlKsNCG9lgYeJpX3wu46u7vagYsj+EJECwRYtsx5Qp26N10vtwoVn6/cU8Cr8WNSgN2RayeFZQ524mrFGdOoiSahTugkCeyEboLJHzrrlyNfcrMrESYICjWUxXG8q5K3WeFDA6JDKRfh98Ra03s9RPt/j0wE9Y4Mm0S0vMhuuTnrCNPObCnrNmYT2cvq71wUAWQp3vS3tYzprgeCAcypGTiACqlJFV+OCSZCDsE9m4YBhUPrDyzjlXrqYaViQaZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6525.namprd11.prod.outlook.com (2603:10b6:8:8c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 13:01:19 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 13:01:19 +0000
Date: Thu, 18 Jul 2024 08:01:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] drm/xe: Add ref counting for xe_file
Message-ID: <lp4tdx4qyguivat3q26d7yut3nxveqeakfnc4d5epe7lklmma3@uhs6eqhizoqi>
References: <20240709002835.3372618-1-umesh.nerlige.ramappa@intel.com>
 <20240709002835.3372618-3-umesh.nerlige.ramappa@intel.com>
 <Zo2gjQmp3ISF0fbo@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zo2gjQmp3ISF0fbo@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0149.namprd04.prod.outlook.com
 (2603:10b6:303:84::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2cc563-4cc5-4344-ad03-08dca729b72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B2dzbG4uElkWLXW6iM4N+NveDBHHOlQPFTJ7kuRtiLCJgKrNTV61uM9lEiO9?=
 =?us-ascii?Q?+6Rj8V/khzVsypAqx/xSScBPnqoCsxCSZBWcHekbtzEUnoBsorY31sxvmwQL?=
 =?us-ascii?Q?Ur+U2XrgAH3YVC1zPJjLyMXuGBMADpVxeWTT+C1JIzoy9/Hro5ziBGc9fmTT?=
 =?us-ascii?Q?NdSmRCKFK9wCb7xy67XTEgnZ/61YYpGFHv4G8mPnPBdeS7NV66ymhj1FfZXa?=
 =?us-ascii?Q?aVTifoHXBUkM/a86I5O3VFm+I25vjrDLmynTWzv/7+mJbChITwKuwYWGLyo3?=
 =?us-ascii?Q?dE/cgJ1XGYfkjSxwzUqYraIjbWyywTUIJ8h5nfPhCLVE8c47la0bmKmRUsOb?=
 =?us-ascii?Q?MbdK+7aHy8XHk4gkmn5YaJgSdrTO/1tAc1wm64+2OqtTt7O2IGNJgcCHTr7H?=
 =?us-ascii?Q?MvypBXMx3GCj9AG/eGcE7wYS1m575FIyvO2WLDYpEFdOUovFjzVh3v/mu0ue?=
 =?us-ascii?Q?tEKheZUIQAPj23C2KwLWg2CkffMwttGd/pI0sL9PLxuje1/psy0tfwUYITHl?=
 =?us-ascii?Q?+3OWA04Xx0PtKG4RFOscT33VClEP9XvIFFxo1AAE8vdKRhvGDw3hw1X4O19D?=
 =?us-ascii?Q?i8OaFkUIcimfxJRIcR/b8Wwg3fYJ1uLTu4u6Uz7nkeWpbF/xZHU/lXd3wTDx?=
 =?us-ascii?Q?aOt5Qt8ttQ6DDP/nk2o1JvmeiGAmHeOfeTESbUVRuUIckpF+rmt8UnzN8EXN?=
 =?us-ascii?Q?CIxxHikc2GhfAzfjavy0N3CHBVc8qLucBKisuosyoZ+nxv5xmPahNUkla0g6?=
 =?us-ascii?Q?xEu8xC+BKhAL6Hetl0VVUe0U++u9CnRYR/BUWecru7rTtt12fvEluJihd8he?=
 =?us-ascii?Q?eRnmjRhD86RoygO8/jaWHLJm1pUjL6Rm/o6upHWXUbrNrhVmOxsZUdJ0aEQG?=
 =?us-ascii?Q?sbFXiaruIdLgww21l0ToxtekEFVsOy1dZ5DGjPfefGl98ODvBf9t61sz/KbW?=
 =?us-ascii?Q?dNBR13a2wJb3sUg5+VGuX5jSHH6HqIJIMEq5O+ln21sKFwmNezw4J7h+WY3Z?=
 =?us-ascii?Q?HE7nLnBFHIhVa5IIjFML1rm6uMcbzbS2aVyo2SDJJHkCIChRCieEzlH79ves?=
 =?us-ascii?Q?sXNOPxrssDOuyXlgwiNu9DF/qDEwhV/sBZYI1+caJmOG8nXGhrlvi2MweQP9?=
 =?us-ascii?Q?fSKUIdbsNkFqSJbRfVHi8mnhO6iQwMUQiQWSsXcsuiPg0lgPDK33sCHJGOSQ?=
 =?us-ascii?Q?dxot7jLiCf5s54xZW1K+q3gbSwvBEsM/P9xLgT7OO77rLsRqDH4P7PiWwrqf?=
 =?us-ascii?Q?i3M/wsVwYEP5oD9Ax+hhHcNfqllPTQPDKVK00rTaWTD2z6W0j1vdEKgjKhZn?=
 =?us-ascii?Q?VejRyKVY6m5D8FT1DtqXgTA2AcSFcC/HXI256V6H5VHaAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WexLdtHtV+Hf/ToIO0ZoQaUpj661KBISkAu8w46URBhynjM3G1kqWUxM86zJ?=
 =?us-ascii?Q?aF6997KTfHTO2QmXIAcniCUskXn8rD5cnGjHQAFjekWWHQdd1uZzm2V9+Vra?=
 =?us-ascii?Q?wAb4tLY1eWbCvcn43YBjBEmU/6+tORnWGILMIcydKFko3uug0yF4X2h8vK8p?=
 =?us-ascii?Q?kgws4thlKZ1HHh5IkrKOlvftwqcHAR06WBA/p2baz1HYGmDILFge5QKPtnzi?=
 =?us-ascii?Q?aQ5WqRg/KbXc5qvaPzHZM1cxOcitv90UHJWaLwH5umNOLLK5fD+uS1R8N58V?=
 =?us-ascii?Q?W8XWahdyCK+qfToVN8a8prA1CmMng7std2YBo2e0XCpWq74ezq7BwbtD/13g?=
 =?us-ascii?Q?lFu4nGSSy8VeJDos5SQIFWfBXksoLufzhdUVo2XPd4wpAO/cJ28R0CpbfFi+?=
 =?us-ascii?Q?B4afL6ZvT1UzYdOwLHtALz949rkk1/1AXozIu16II3Bos3YZ6Oz8iy3NOrm/?=
 =?us-ascii?Q?l/To+dfSywN+ffgOzXDGhbYdw9YaDvUgXWJKTFSvghrtAEbXqyHHU3ZcHw2+?=
 =?us-ascii?Q?D7X8EgWrubvf0G6yfmDXcwv/SArEwZkXajHaO495IAzS4rsBymJq2GhWp2L0?=
 =?us-ascii?Q?BS7alp5B87hG1cX+KlwK21SGgxyDJ74xmdcfvhaW0knpgbI/06gtUOXe77ld?=
 =?us-ascii?Q?NvVo+/WvNUiTUmRLpSLh2ZxXqHpgxNCcLpYQqsEmkkD9v6NJayHtJRuuST4Y?=
 =?us-ascii?Q?8v8qQrRZswDPhJMNAfSuFE9Qn4hlFa5MXxkmzFYx4HvnJ+3JGFI8CwMvoL/w?=
 =?us-ascii?Q?vJHy90JEijo7fo/L0AJOPL9tHO4AIY6kDJkUQvsfcpAKSMjyAALr8bYx+5RG?=
 =?us-ascii?Q?tz0aG1QpKniOpxmMNX/2PBHCTNNEd5sD0BkTu/py0Ass6oXW1dPQaKOm7n85?=
 =?us-ascii?Q?P6ZBvAsBfglGcUhxUEyhhnU694xH02hQ7Wb3c+2xWuYWXagoBwwPhqpbh/kR?=
 =?us-ascii?Q?V/8J5t863KPQjDzVUcpWqk0P311Bs9V8A7dL0yLsLbIsiYPxfeKWOcy+hVMn?=
 =?us-ascii?Q?33HAeR8j0zB7pnVCOicd9b8ePRTrcvx4rZtY3Fzbyme9iRMFuYSOBaWZlzxo?=
 =?us-ascii?Q?rxZmG2MkBfAeJZ+9f9Y3VBPihMRceD0L10p/dyt/0WsEYUQQtKY+GBsk+s1K?=
 =?us-ascii?Q?oyRHxqO5kStP/5i66Oeif1NuN8WxWh0bzb3Kdqx3sEOzFVy0fxNoh66qiTa/?=
 =?us-ascii?Q?avoRixXwxzEYCJDSpS2YvHD7/6NBnmloJE/GCr/OQBBiMuQkbq0IWS0AmY4c?=
 =?us-ascii?Q?TyJu9TuEWT1KZiYh5YwGXNLEz6Wv0BcthPpEOloc45BsJiOyDciw2k3BmUpF?=
 =?us-ascii?Q?xxPGF+0LF+Q+ef0k36ldpLcFKrqgYN0Xqge4u6zjAKH/SqZ9c9+2m8q1tR/J?=
 =?us-ascii?Q?SVvUFkbB8pYxa5KJDU24fIcAE/6vllnWtgTJqNjR9wrHbPxlHK0mpD3e1ApS?=
 =?us-ascii?Q?1QqeqVDC091vjzQ+EVRq+Iqzkue3jsRbDqMGjYpeiwFP5brJmf82FQcBiURH?=
 =?us-ascii?Q?GQmIaNr44Mp+hePRGz4IXeE3Rv6NuS9n9I3abjO32nV01oWqA3ZiQKNnO4Tf?=
 =?us-ascii?Q?H0QfigEP95WaknGDG+30cIhzHyDbVMHzueV5waUsgZ+HnEEIeY02XIcLac4f?=
 =?us-ascii?Q?4g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2cc563-4cc5-4344-ad03-08dca729b72e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 13:01:19.0774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGic+ph6hpPKenPZQqmtk77zyQnsBLKIEYmW4+XEaWbqYrO/W7X2H0fNcVgdxOeK9UWiwl+R0BVrEylNmTv8uurYi2At8MP1CinAq3aMx7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6525
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

On Tue, Jul 09, 2024 at 08:41:49PM GMT, Matthew Brost wrote:
>On Mon, Jul 08, 2024 at 05:28:33PM -0700, Umesh Nerlige Ramappa wrote:
>> Add ref counting for xe_file.
>>
>> v2:
>> - Add kernel doc for exported functions (Matt)
>> - Instead of xe_file_destroy, export the get/put helpers (Lucas)
>
>Won't get into this bikeshed here.

in the previous version I also pointed at other alternatives that would
allow the inlining you were talking about. Anyway, as we said we may
want to make the pattern uniform across the driver later

>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++--
>>  drivers/gpu/drm/xe/xe_device.h       |  3 +++
>>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>  3 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index c5464ad5d908..61dc0a37a4d0 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -90,11 +90,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>  	spin_unlock(&xe->clients.lock);
>>
>>  	file->driver_priv = xef;
>> +	kref_init(&xef->refcount);
>> +
>>  	return 0;
>>  }
>>
>> -static void xe_file_destroy(struct xe_file *xef)
>> +static void xe_file_destroy(struct kref *ref)
>>  {
>> +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>>  	struct xe_device *xe = xef->xe;
>>
>>  	xa_destroy(&xef->exec_queue.xa);
>> @@ -110,6 +113,30 @@ static void xe_file_destroy(struct xe_file *xef)
>>  	kfree(xef);
>>  }
>>
>> +/**
>> + * xe_file_get: Take a reference to the xe file object
>
>s/xe_file_get/xe_file_get()
>
>> + * @xef: Pointer to the xe file
>> + *
>> + * Anyone making a copy of xef must take a reference to the xe file
>
>s/'Anyone making a copy'/'Anyone with a pointer'
>
>> + * object using this call.
>
>
>Returns: xe file pointer
>
>> + */
>> +struct xe_file *xe_file_get(struct xe_file *xef)
>> +{
>> +	kref_get(&xef->refcount);
>> +	return xef;
>> +}
>> +
>> +/**
>> + * xe_file_put: Drop a reference to the xe file object
>
>s/xe_file_put/xe_file_put()
>
>With the nits fixed:
>Reviewed-by: Matthew Brost <matthew.brost@intel.com>

agreed with the comments, but the kernel-doc ones don't appear
correct... we document the functions like

/**
  * xe_file_put - Drop a reference to the xe file object
  * @ .... arguments
  *
  * ... additional doc
  *
  * Returns: ...
  */

Lucas De Marchi

>
>> + * @xef: Pointer to the xe file
>> + *
>> + * Used to drop reference to the xef object
>> + */
>> +void xe_file_put(struct xe_file *xef)
>> +{
>> +	kref_put(&xef->refcount, xe_file_destroy);
>> +}
>> +
>>  static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  {
>>  	struct xe_file *xef = file->driver_priv;
>> @@ -132,7 +159,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>  		xe_vm_close_and_put(vm);
>>  	mutex_unlock(&xef->vm.lock);
>>
>> -	xe_file_destroy(xef);
>> +	xe_file_put(xef);
>>  }
>>
>>  static const struct drm_ioctl_desc xe_ioctls[] = {
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 0a2a3e7fd402..533ccfb2567a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -171,4 +171,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>
>>  void xe_device_declare_wedged(struct xe_device *xe);
>>
>> +struct xe_file *xe_file_get(struct xe_file *xef);
>> +void xe_file_put(struct xe_file *xef);
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index f0cf9020e463..70115fb8d806 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -578,6 +578,9 @@ struct xe_file {
>>
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>> +
>> +	/** @refcount: ref count of this xe file */
>> +	struct kref refcount;
>>  };
>>
>>  #endif
>> --
>> 2.38.1
>>
