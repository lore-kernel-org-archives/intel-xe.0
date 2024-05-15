Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A20C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 15 May 2024 18:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E9610E34F;
	Wed, 15 May 2024 18:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4NefK/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FA610E34F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 May 2024 18:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715799390; x=1747335390;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9xKVGnpXiLmcGeOQJDa/VtfTTJmpxcTftTZzqTfbNa4=;
 b=l4NefK/dGXnaf3A4vdycvwSG3VQkLGXujW5anb4vhzVN6fqE5coheYKA
 PuN9W+18/qDDxNmTZQay7UvPaEvdbWEpnUSYsyC3OlVEJiX1pITKsm7P9
 FjdjmyAgUw2yQZxK0BeYpKgxjSnHJWDOztDZlB7ey0YnMDqNijaK1Itbb
 +/oB2BQ0z7v8Kvl5QXlBVsvoE7dZQfsRhdsSKC5RHh+8/mGlPmVhQGqvd
 w+Li6ZkXzyOuFOBxvnZoDNYQuQQI8jAokqgriYYiq7Baqva4ZEiHINqV4
 NrJqmmkNsP7WAxjcxATTKRCpbOL6eN0CZlDRYDI88tUa3rPSvJrAbglyT w==;
X-CSE-ConnectionGUID: SrPkCC6tTVu6jKgGFPkztw==
X-CSE-MsgGUID: gKbcPiXSS5WYj0DOfPXTdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12035652"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="12035652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 11:56:30 -0700
X-CSE-ConnectionGUID: QRBNLmMbT8eOMkwNUJajAQ==
X-CSE-MsgGUID: oR0FOjvLSuywlxbFTqhuow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31159339"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 May 2024 11:56:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 15 May 2024 11:56:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 15 May 2024 11:56:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 15 May 2024 11:56:28 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 15 May 2024 11:56:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLn+WEcjpo+ZvTz77KbL5cLXgeCHcqC4974SbpeptDDwzmgZO/iQujojkvUFh9neIk3IxW+gwBharhoVxGb5vOb3ndDQ3v+M48F7bL69s9YCT6D06kT1dK/e5eHxOiFulLj5SzF870FaIxBdv4kBLhSR8JjibsjH54151DI+6hFKzrmbuQm6eTqv9NIKpZUjWYhA3tRB1Nih97lB5oVbBaoDAcmoxaKO54FxBuVJL2UYIyMWiFb8IAa49/Sp2ca45f0rQxMSuhJ1RK6rC183Um2djAAbEtvtxO+PqRZibrjmHDZBMJ4kp0IK8aEmBmCLQUwTIGxLDx6yooF+DgauBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HiWUA2hqIC8NgSyNx11mB8jeLbDCoinL+YVstdUiiXQ=;
 b=hdXrd2qM+QFdcA2TCVNU7QtdKPcbTm6AIf4NRbn+Xp9zBmra+hQAwWNkU2UAQvcXDXQPCoVUZP5u+jJIAzseAtMHP8IshDkmwbN1gBwePQetDa55UH7p0G8ZnDIMnLkkwH2HlyKoBvZ8IO1GPO/ZnhYoEuIwnfjZ1Gka2C6ROlTQ7z8QCLcn8g/2gktAQnssDhTh7j8OqVYRstSkoCuSOPiAxaa+Y28kzGUu3gmGi0oTCnvsNlwHvc2aojNjLRn8ehARiZK6FSz1SS6ww2Ro70cXaC01fEGIurC33q0FaBtZo2fmmnrnE7WnzxqjUSfO2gzuZc5i29rjsxauYywSlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6547.namprd11.prod.outlook.com (2603:10b6:510:211::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 18:56:25 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 18:56:25 +0000
Date: Wed, 15 May 2024 13:56:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Don't advertise support to enable VFs if not
 ready
Message-ID: <4k6mvtmm4lbucwige6qelpkdqzmomjteylwr6uuo7jgjkn7xac@blkfeuxhifjl>
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
 <aqh6x2lwhruly3g4pxjiljnbodaxidb6np6tievlxk4ivq4nbt@b3z2lzsdectv>
 <b49e6b94-ce29-43d8-af23-19366ba45578@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b49e6b94-ce29-43d8-af23-19366ba45578@intel.com>
X-ClientProxiedBy: MW4PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:303:8c::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b4d6f2-d7ca-4919-3f26-08dc7510b877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?K+YY6ZA6jkEiYS6BR3R+PuGSjm+f7h+1dBikN73payroeAszqGeH7qYkvo?=
 =?iso-8859-1?Q?CxJgy+2h77lXh16acSEGPOwOCo6EffrkkKD0WE9MGzERHSEYtFUn74yRYk?=
 =?iso-8859-1?Q?iq8TlAWZwTrOqv2e6ew8Qb/A1Qot46p2p7917EcY2NhmPCyfrOIGAmEKFU?=
 =?iso-8859-1?Q?UFEVl1FEUGSxpp06om/8WKNVjCELFmSb411oRf/l+Tpx9+iH+Vu4OhhW04?=
 =?iso-8859-1?Q?pv6+VT8A2YpHlKADMHw62A9GLKTF6tkRD4aJ2BRD7CXj62KiIEh3t2Rw9f?=
 =?iso-8859-1?Q?DC46b8EjVmIdfptXW4d7glnUFu3nAw71rO8fd7/TtpfEdkyxRO7s6xrLPV?=
 =?iso-8859-1?Q?2AUO5HMrZLjFYwZFjlLzRifBnP6Gw9UrLtwqnAUGAi/IZEYPtDAWwAzg+f?=
 =?iso-8859-1?Q?OI4VmOpEAVtNovppmPwBfNnajKgc5gjdZjKiZFcaEA1zEQzkVKaqdvlyV+?=
 =?iso-8859-1?Q?QaSJJznxnssISs/zmISboMR8SfbEsr8fM9XayU87nviCPlj/5sLdQExQ/P?=
 =?iso-8859-1?Q?Q/m4ufbi+8TOOBZ+iC4y4GTMyYFb9l4laXSwctV0hTXyIYqZ98n4I0w7ZX?=
 =?iso-8859-1?Q?uGNW0d8DJQRSgyPYmkhAz2mhxLOVacR6wO+QxV4qRv+lUWwBun6CdIiL3U?=
 =?iso-8859-1?Q?IftoznGpcJnIBybpCruyKhyWLt/R/sJ9IruqaTsd7ntDuHHVApSz/mUQfF?=
 =?iso-8859-1?Q?QQZcYLIVqsRPBLUw02FnsbVbt9v17N6HCc2XisVXKRtc7+HZd3hiWlCDBc?=
 =?iso-8859-1?Q?bOSqfmDiKn6ytSesw53cf2fi+kK/9iGcpIiNZRnyCOFLanGKz7flqoa9ga?=
 =?iso-8859-1?Q?x66+XwNTM024H3WfJd6kKO7lIXci5OPEfuzcuEm6ny/SD5Fjv3TuHpH8wj?=
 =?iso-8859-1?Q?NPjBOf2ymVs0dgXaMxiKQClIDsm+tKYiIARAFPmCGYdHmlN6935spSp7tc?=
 =?iso-8859-1?Q?MWXXLIosAg0aezR7kywd0inc4kPzsROcWsiqirJgt3JIsXHFVL6U+2bgbz?=
 =?iso-8859-1?Q?sBSdNWNjw/CWdJZjX5xYLjVtZTIL9UvosPxsYdnCbXwtVHE1FBIlTEvMqT?=
 =?iso-8859-1?Q?KfZ4cstlJNIKL470kUgRxAB4dXWWztWlpvM+BXKN3ARSr8QsQhojt9PQ/C?=
 =?iso-8859-1?Q?N2DsZocxooJSn9tigG5ANhoiCml+yumchmO8gFckq/ODCLTQYI7s3xOk5b?=
 =?iso-8859-1?Q?pBPf4K4bgJWKOtRRtrzm0ivyDgaJS2la1B+qM+EUoElLh3v+H08Pw6N0fw?=
 =?iso-8859-1?Q?XIu8uo2BUUEyhW14iPRs6z5kwLeVtV3EjhWovaO5Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AZntQMapnstWRyAUrsPU6cMxWQafcXvi/gWiKZFwIz/JXMWB374AOhlBC6?=
 =?iso-8859-1?Q?tFWwZgbHHblT5sPNlRAkrdItWWYPegWOCNK7BHk88hvxh4lYo3hM17+BOp?=
 =?iso-8859-1?Q?mTXjJQK6NZvEt1izUdwzQvnA4qvqqmZprtJ1xmMbBP6o8NRt1v5LHAWwkk?=
 =?iso-8859-1?Q?qX/3lvD9BRx/85/v8RROMdNhc7xryXD3lQSTbK/zSjjv90N0cnMvaKyFHb?=
 =?iso-8859-1?Q?De6UXGsjFr5iJ0Qllq2aGY2nm9+XiS+6B4y9BK6Va2nANauEoZHJ3sZIxd?=
 =?iso-8859-1?Q?FCraCh4/iQaNutprWlpcnJkabN5iynWIKH4yWhsA0sKx295Hc7iW66cVK1?=
 =?iso-8859-1?Q?TX0J4sCb0nd74jVpvN5Xc9o5grF8qY77QjG4HIi9FlgU/Op/Q1pj4wRBX7?=
 =?iso-8859-1?Q?w4SaQJQfpZyPubBWoIWzycyody46DewC1J8dKWJuY/G4aZRizehtaZuRWI?=
 =?iso-8859-1?Q?9W9vo8wtd9VeHF3hZLIyGRUmM18OFkr0tQQqtK3GSYq5Hh1pZl6yHB59Ho?=
 =?iso-8859-1?Q?FmnN4eMjiHezLd9klKhWJVq/PHoXhjNZyYiu3dumQIDDcZxihP5e9EgFEi?=
 =?iso-8859-1?Q?bIXtJvVf6Bqt4Axx8ijFcanyK84w9R1DnYOmzWmLj4/Z2raT+2VRA1u9vB?=
 =?iso-8859-1?Q?EBJv8vI+Xv5uXU0Q/s5puCpTVSZKYmCFPii1oP7l8FGi1zDCd0FiHHlWiI?=
 =?iso-8859-1?Q?542x4ZOD7f/tUce7vck04ubll47Ma5Qer7GIBO0W+MqCrg6p2BuvQJOkcs?=
 =?iso-8859-1?Q?0sBfQ4DOee8cWWKAPRHrpm/lTqlDkWi+Y0VM2QWy+ezZxyuj3ttl77XSFj?=
 =?iso-8859-1?Q?2HnSIMqVXWzmJHgDPK2VdZbczIxVpnV7Duv8j7RGNsT8Zh2G+PNUDa5Fd5?=
 =?iso-8859-1?Q?41l4/RBWfG7MqTmrQe+FiO3CQR3uvjRosF2uIUT9aMk+fKPLLeAByZTa0s?=
 =?iso-8859-1?Q?cs18wsCKdvqjBcZmUeL8tSiiA67XV+OtQYYhZNPNPXkghyJVxrj577AyEW?=
 =?iso-8859-1?Q?xj/z6srRfLC6Y6kjTiTAXXkba1T680U3wwQvV/jFo+VOE3rEbY/CL2391C?=
 =?iso-8859-1?Q?yEEJ6tvYYcG8gIocVzkUStbEdybY6Ug/2ojqgwVb6VMjol+bo38dYUu9sX?=
 =?iso-8859-1?Q?R59qZ6kFUFN6qRCpzEhWo8JJR33aBBTxyAclMTf2Y7eS3qYYLnJePMjFmS?=
 =?iso-8859-1?Q?zZd/U02Pxqg1QWFAfPASCcXQZOnW5UyTqGQfmyUyxbIUku8UQ7LSZdMdaT?=
 =?iso-8859-1?Q?zc2bInttJXDINC8yCdLMFDVm98pP9huxgmE9McszToxVsbKft+Ivi4byqj?=
 =?iso-8859-1?Q?uGqJXj90Usiw6BnJuzp0eQdHXQpr0ThYAbZugJ00Yvid2urW4PJNPx7vNg?=
 =?iso-8859-1?Q?9VGWGRapwMp4zjDG4A/wF+B3Dht/KmCVRL+RzhnToS6y1wOMiFzY0khDNz?=
 =?iso-8859-1?Q?xKw4Z/+5+I3toJoePbqoiYeR2Yu0XF2LmHYzxgAbRxg7P1qTxRitM2Roci?=
 =?iso-8859-1?Q?Sfw+lGkVSie3a84b8REsAdA1c7NYDXf7BL9krAXWRygjPgCmTGtOFQ0SCn?=
 =?iso-8859-1?Q?cTfT7+dHs3fOVJcW68bqAEaMhsE3lMGwfKDOHwAAoMkqAorFiRPRD/i2Sr?=
 =?iso-8859-1?Q?L+nw2DAbfiO/SV5I42NVpqgg20qfiwp7mq4SSVSAxJYh7QV/JTFZRP/A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b4d6f2-d7ca-4919-3f26-08dc7510b877
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 18:56:25.6509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5l5NYBOMhw0M1Jo6eLywcn3e6pQz/d4xF/DJNjyeH37j8hOGo+P7anL/eeZpfYXvZFyoopWHg3m9V32xMsT3spWBKZMVslLo9+hTArVfzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6547
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

On Tue, May 14, 2024 at 03:46:16PM GMT, Michal Wajdeczko wrote:
>
>
>On 14.05.2024 15:09, Lucas De Marchi wrote:
>> On Tue, May 07, 2024 at 06:57:57PM GMT, Michal Wajdeczko wrote:
>>> Even if we have not enabled SR-IOV support using the platform
>>> specific has_sriov flag, the hardware may still report SR-IOV
>>> capability and the PCI layer may wrongly advertise driver support
>>> to enable VFs.  Explicitly reset the number of supported VFs to
>>> zero to avoid confusion.
>>>
>>> Applications may read the /sys/bus/pci/devices/.../sriov_totalvfs
>>> prior to enabling VFs using the sriov_numvfs to check if such an
>>> operation is possible.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_sriov.c | 11 +++++++++++
>>> 1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c
>>> b/drivers/gpu/drm/xe/xe_sriov.c
>>> index 1c3fa84b6adb..a274a5fb1401 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>>> @@ -53,6 +53,7 @@ static bool test_is_vf(struct xe_device *xe)
>>>  */
>>> void xe_sriov_probe_early(struct xe_device *xe)
>>> {
>>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>     enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
>>>     bool has_sriov = xe->info.has_sriov;
>>>
>>> @@ -61,6 +62,16 @@ void xe_sriov_probe_early(struct xe_device *xe)
>>>             mode = XE_SRIOV_MODE_VF;
>>>         else if (xe_sriov_pf_readiness(xe))
>>>             mode = XE_SRIOV_MODE_PF;
>>> +    } else if (pci_sriov_get_totalvfs(pdev)) {
>>> +        /*
>>> +         * Even if we have not enabled SR-IOV support using the
>>> +         * platform specific has_sriov flag, the hardware may still
>>> +         * report SR-IOV capability and the PCI layer may wrongly
>>> +         * advertise driver support to enable VFs. Explicitly reset
>>> +         * the number of supported VFs to zero to avoid confusion.
>>
>> Aren't these 2 different things? The PCI layer is reporting SR-IOV
>> availability as reported by the HW, which doesn't mean the driver
>> supports it.
>
>Without support in our PF driver we can't support any VFs, even if HW is
>reporting that it can. What we do here is aligned what the PCI layer is
>expecting from the PF drivers if there is something to adjust - see [1]
>
>/sys/bus/pci/devices/.../sriov_totalvfs
>
>"This file appears when a physical PCIe device supports SR-IOV.
>Userspace applications can read this file to determine the
>maximum number of Virtual Functions (VFs) a PCIe physical
>function (PF) can support. Typically, this is the value reported
>in the PF's SR-IOV extended capability structure's TotalVFs
>element.  Drivers have the ability at probe time to reduce the
>value read from this file via the pci_sriov_set_totalvfs()
>function"


ok, makes sense. Thanks


Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>[1]
>https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/testing/sysfs-bus-pci#L289
>
>
>>
>> Lucas De Marchi
>>
>>> +         */
>>> +        drm_info(&xe->drm, "Support for SR-IOV is not available\n");
>>> +        pci_sriov_set_totalvfs(pdev, 0);
>>>     }
>>>
>>>     xe_assert(xe, !xe->sriov.__mode);
>>> -- 
>>> 2.43.0
>>>
