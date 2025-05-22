Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5CEC54E90
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 18:08:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE75C10E106;
	Thu, 22 May 2025 18:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HimwA6yU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633A110E106
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747937300; x=1779473300;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=n9HMhQERX9h3xh/fK5XHpTDOWy95UbWSEUk+5VTtWl0=;
 b=HimwA6yUGxTB5RqkLJw1inituO3QJsHrEVhj+AIvbbPuI+54LI07tyQF
 m7Q7BLtaFq7v6rgJtQAF0ZG0MuMnqX6+MiiIjTCWb5cGvWcJOazNTTkl5
 O8WxxGpLLBAn2jsxXUlcPn+J62p7VAFM3xzN3dXI5N4ZCOGlmdvUuJK6k
 oVJyUL/waagQjt1VUPlah0LfVBDjLpxqsFRLsv/zh4++MEtFyBOskAzOD
 8/hb8HzqudTbhXj+JOd81Bi2BlmUKoRiM9D4oISPeoiRTn8W+/eGSDnON
 iQp4h3fl343skY97gaN3lp1i+5Itl16HHCbcnpynjCmPuqOrcXCvP5W7J w==;
X-CSE-ConnectionGUID: 6/S0ta7nTOqeH+5RWKasLw==
X-CSE-MsgGUID: B6vFx+h0TtKIVtXLCpJCgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49233005"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="49233005"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 11:08:20 -0700
X-CSE-ConnectionGUID: RILNAYD/SNuyIs2EtOVbKw==
X-CSE-MsgGUID: 3/nuUu4hQYSHO2m3XMWwjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; d="scan'208";a="141239942"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 11:08:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 11:08:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 11:08:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.70) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 11:08:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNK795fcq4WxlYX1V9wYd3pCdv1r5yaY/axmd2Id58+45oKolkmdEzuHXUFr4HGcmUCIGrUZRdDzOAU3Yjsjq+8L33sEA88fIwCN5ArsQQDPzOdz2TRqsF65zh45Sz8mmjeEPdNCwdDiOO0/bLKHDqvsC7GrYDEoxVC/CIHY6oWaStlSG7E36nEv/Zp/hQdv7UWICjUt9SvYL184bufJpUyZcGv184PbfoEOVI2dgJUCnmIZHCWj16axqZzRBpK+SEU1MMXL/nP47Ao8aI/0soANVhALhepMsRpg7T24qhuiXBa1RXaL5YFlPj80nXgWMmzJZu5oF0W+OXjiLc4+9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6T2aHhyMBnZ8NJB622gq6nfvOZ+fK8i4f8BvBumnD38=;
 b=dVvBnfOko6DrGfV8vd03qBB0JXmuuDHIIDe/hVRboZN3+7LRvk+SoNJy4oLlhdRELV10bavHGnBWFo4X2s/Y1afLt4vXFDvoORaFpv4CrFIRec3xziZs61z6ChnYcQaIlUZeI9wMCJAb6Edigeg+Zydi4dD1edbOprh1g5uaRSaElWFPH+4422if2t2lyYZGi9m3VghL3ie3EVoy8EFWg/LYX02L1R7qqXxj9Sm3A4y/eRhpp2WcIy3G1tp5pcVa80WbXJxzotjKMraks1xnelAKrt9TboDVWV4pJAdRJMlo1TZCXzd/ZW+LAPcKommkuLsZ3Oc/Zl8Zwk3w2N91vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH3PR11MB7345.namprd11.prod.outlook.com (2603:10b6:610:14a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 18:08:15 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%6]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:08:14 +0000
Date: Thu, 22 May 2025 11:08:12 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Have LRC hold VM reference
Message-ID: <aC9oDKNXmPUL3Oa0@nvishwa1-DESK>
References: <20250522012252.2175683-2-niranjana.vishwanathapura@intel.com>
 <e92ca274b72000720f976ce10b5c3de77ac1439f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e92ca274b72000720f976ce10b5c3de77ac1439f.camel@intel.com>
X-ClientProxiedBy: BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18)
 To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH3PR11MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: b67b7ad2-fb6d-4d24-869f-08dd995b9f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1bXhPgLjv8hI5wJpYiITqYuPikoMRoCcGvJCyeyFyCmO3dkR9MHq/I15nL?=
 =?iso-8859-1?Q?cG9LV1RZ7W/VuF1oEMlADnUJuzH+bS6LQrByA1m0qvXXoCDrgYRBiYeg8z?=
 =?iso-8859-1?Q?AaTeir+nK3jyWywH8KZ8bUc8n0TmmakOLa2eZJwWV1ko3bxrLPsx2wA/Qx?=
 =?iso-8859-1?Q?xPzakOyNXKwShE6zgNlu2JEOko6efJ6St4JDAnq6Yi4ZW90adIX+TknfHH?=
 =?iso-8859-1?Q?OTnQvyZ38VOjg2mIyz0GNvvd3aO6r+xewYgYUceJCI53SW3diVwsGYX9a6?=
 =?iso-8859-1?Q?TuUYzxxG3zqTiTe2B5ZRKfkj0mQ3499WDjT5yK0ngllW1uJrKsja4J2890?=
 =?iso-8859-1?Q?3/NRNfGYYr+vW7B/lINC9+kVDQfC6SmMNuSGvW0GWm6LhS4L3Ul+/PSLmw?=
 =?iso-8859-1?Q?VEScrHfNznUXsiuRltAEbufTAkqd9xrJ6uZ9LyU22C1An/WfYqlRzAPbwF?=
 =?iso-8859-1?Q?NvupZV+nqh1J+/SC2CfthZtW0xZmFnZV9pA8DTTolPtbxLepnI9I5sBGZD?=
 =?iso-8859-1?Q?D0zscZ6hzU7v12Kjb6rjJ4DbJQev5WCVw55PHMXBdyEOCqZ5pzX3d+sKlZ?=
 =?iso-8859-1?Q?VT4ps0HHLVRKyI+PHJMHPyQdjtQ5Mk8vQPqPZQ8JFYv+QTF/unuKsMZy68?=
 =?iso-8859-1?Q?44zHIrZ4SB2bjc4Fem/ORHceWYR/DR6yzSWl2zxJ4wM9p8FlCeYo/g+OEC?=
 =?iso-8859-1?Q?2bUKzJ4v+GmIF4fAH3Vbfj5lVEBCQpe3WVuvZP0a7ysNTAqRI9VYaxCCda?=
 =?iso-8859-1?Q?ZKf2RHShVfpduszr4M2Isb6AI/CHL99y7FpYq3D3CI+F5WLmBxv4kHlh4h?=
 =?iso-8859-1?Q?dkU/0VxH6ccK3VXxNviw8WbZYemnw6z6o/mQQtdRfd6pJa3jZR2P3bUsaG?=
 =?iso-8859-1?Q?DrNG+UAaSa1BoZRk6gFut/kueBspP4mW5dBAYGMaxwampSt+yUfgXHiTqm?=
 =?iso-8859-1?Q?evfLSZYJxD3ayKp3UZ6obf474sRv/oJWx+EF2Hjmx330mQgxsCgaXEVW/0?=
 =?iso-8859-1?Q?LgzGKo7xU703GmlhMFQNvVrd0K3aOQyfhi+98WlfM9Dde6mnRy5V+2opr/?=
 =?iso-8859-1?Q?aZNuJWGqYbt609Qb8OCFAiUKyypUkd55jhkqG/Ps/ZHpzIZL4tQ89fVFTC?=
 =?iso-8859-1?Q?KcLzyQM2cd5jzrVI5YMJLOVPCAoavKAJ0oOUfMd1DxUIsNCjs0y39+vD3Y?=
 =?iso-8859-1?Q?WJGayZkHRtocqGX8PcQzmfZ3G81o/Ndd9Qu99bIcuKa8VSYbohfMTKJw/y?=
 =?iso-8859-1?Q?gQHnibZpOJOt3vwjnJbh6SjYKiMQzI1CO83ohxVlPWtuxOcLaRGCCIoKFI?=
 =?iso-8859-1?Q?IoePF/hVp6Ne+zu62i9K8whQdaku3qmAD+McnehLYsiiByptMkgaLMJsah?=
 =?iso-8859-1?Q?Z+PWBx1OH5TUvBcz3FrP/+0fshe5hQeY3hbN5ygTGIQ87Pf6KzDzSluvio?=
 =?iso-8859-1?Q?AwLCPBgcO3kLMgmaWrqY9Dtx9QvTqxjvbG3nN7Y3ZhFyUUBpsCokQgGUPS?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dav8OLxnhki6+I0mJVl6g/4k8D5S3UGblLh/48rBs2+d9qRK5F4Fag/Mok?=
 =?iso-8859-1?Q?i8czNq2XOXbUMtPqCrov21zQGP2r4qA33Dtn7NMv9sQb95A6AYvOXjXLK5?=
 =?iso-8859-1?Q?5HXXpkiiKe8kHEvOzByC0vg/4/vLgflna0Wvk5mUqZrPMblUnEUHbeo3pl?=
 =?iso-8859-1?Q?8vKH09/EKDxok/Ok+wtyI3Rvo0g2R9vi1wI7HQaYgCTEfedNjwMmd2C762?=
 =?iso-8859-1?Q?0NmW8u3VoblDZDdBHN3OA2rJGwpXpXkXzGyCEJK3uXmz3h2QIh0lUVbWWd?=
 =?iso-8859-1?Q?1xkV9MWsFK1edW4dThoVX3ywfIgCp31aSlo3P4OKrB+C4whbA2cwtBp+C5?=
 =?iso-8859-1?Q?jdRmFDe6bBV9N9NrodHHc/ezDFmbyYoIH5A/TKGs5a4sOj6Eak1zqKcrET?=
 =?iso-8859-1?Q?76oovp1z4YFxrScA6S1YwV86jLgZBLVf+OvbArPXaFLaH16m77j+lx2FzS?=
 =?iso-8859-1?Q?6ENmTQdwQFVJT1FnZ2kEhSjL4XTkiRDBa5EPkd6PlLl6AXjrxgO6o0fGEp?=
 =?iso-8859-1?Q?KqiatGwQt3ztTMTgAVpGBG9U4euisDEbYIpyQMfp66rsWKzZB9X+aZ6YB0?=
 =?iso-8859-1?Q?K3Lcwjr2c4Y2+8awK78GoHGSf9BYjmlom2t4VmH8SrdgI0rfOFxTjh4cSp?=
 =?iso-8859-1?Q?Pz2IFcQnLrn5UWWCjjWh1m7RPcKrlBdbNVPwBTPYUXLSrRWDSHLUdUmZzF?=
 =?iso-8859-1?Q?zdI45yvKjRmMz9+4qxB+h3zWBA8TMHiwIiQWu0FKq6NP60u6AOSdcSg8+X?=
 =?iso-8859-1?Q?dF9qjw/5s7D0GSyt8tBWTwmi0HT4QlTg3ow5ptGPt1tFdY4Sc55tXNZL78?=
 =?iso-8859-1?Q?wUQS2OBCdenWkwzkub60+NAjyChNYUstdXgW2v29Yy4K8xF7mFGv9OHsfm?=
 =?iso-8859-1?Q?TI5Botpre9z6NsynjwTiIZt0kOJSH8CX0JJ0LrS1hE6I+lpv0oTDZiBIIn?=
 =?iso-8859-1?Q?z8lDDOyn9obKocyHkn/vszGjTk8tlBUeOXYfC9K9ozw5yGJLVCO25nuMx2?=
 =?iso-8859-1?Q?PKsexi9g21WTaexH16/VeBnXI+GfKUNKI3Gisjzf9V7EjWOzgSl0pTFwKr?=
 =?iso-8859-1?Q?GrNdvxgmyR8dqJAMUeq52jrH+vlS9/R/3cQPOZ8CKDnYA/WfyJHJU6WGqU?=
 =?iso-8859-1?Q?fgrsFSu+ixEGJn9i95IcA25xZYscSgbc5sXHeD8Ovh53m/T8Vl60onkc0K?=
 =?iso-8859-1?Q?G13gM5nFUSdEKGs+hwPWdsmishbUrCay83UmsG4e6ef27JZe9/7rWbY6B5?=
 =?iso-8859-1?Q?zkdNTyyEqqoMkXJ+QJaUWJNDP6qz2oxQLujnn+BdgzHRc4CipUZchpgGo5?=
 =?iso-8859-1?Q?AYG3V3dtiK+xV8UdOmqS5mCayeUpCL7SxEtfkx9NM8Gvd/ovGBRih0Z2p8?=
 =?iso-8859-1?Q?rUfTjdPmCD3wuvmktURgPH2pz8PGmEli5tIsvgiEdnMuzfN76Rz6ZGKRjY?=
 =?iso-8859-1?Q?dJO/QJ0DUPAUzdYIl25vkFfIQJ9zVRzzLwx25ELMPBhYtpi7aollhw/ebo?=
 =?iso-8859-1?Q?Vku8FodSTZNgqLc3tgyrH8osUBpyILgCOUHZel1aPBwZ4RCuUcVP+9Erx8?=
 =?iso-8859-1?Q?9LTLqhMWwbACCoD+zl82iOdK6BFUleoxVYrBDEpwYmeuC0A1mpTnWARmt0?=
 =?iso-8859-1?Q?SAccUEgxc5S2MFDktTDStr9+9tpmbpGkHep/SH1UCnvSDB/H3PWufy+BmV?=
 =?iso-8859-1?Q?McWA9fsXnX0AXVR2mEY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b67b7ad2-fb6d-4d24-869f-08dd995b9f1d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:08:14.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ci7G8bqwusCR1+it4zFZ8ihfMTWEdWR/HODpIKWE+iPhPQVkzdrAMGOWGoRfsNJoy+YYRcKMuC0ngqrip++xpM14/48ZZfJ1oqIrXveCaMUsgxYMBjGJ8KmWGF5odoTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7345
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

On Thu, May 22, 2025 at 11:02:47AM -0700, Summers, Stuart wrote:
>On Wed, 2025-05-21 at 18:22 -0700, Niranjana Vishwanathapura wrote:
>> LRC's BO uses VM's dma_resv object. Have LRC hold
>> VM reference.
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>
>This covers the case where the VM is closed out from under the LRC and
>the LRC BO tries to access the now unreferenced object, so:
>Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>

Thanks.

>But longer term it would be nice to decouple this in a way that allows
>these two to be referenced/dereferenced independently.
>

They can be referenced/dereference independently now also.
But LRC has a dependency on VM here. So, it should hold VM reference.
Earlier LRC and exec_queue were tied together and exec_queue was
ensuring VM reference is held. But now LRC is decoupled from exec_queue.
So, now LRC must ensure VM reference is held.

Niranjana

>Thanks,
>Stuart
>
>> ---
>>  drivers/gpu/drm/xe/xe_lrc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c
>> b/drivers/gpu/drm/xe/xe_lrc.c
>> index 61a2e87990a9..efdf4ef35b35 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -908,12 +908,17 @@ static void xe_lrc_set_ppgtt(struct xe_lrc
>> *lrc, struct xe_vm *vm)
>>  
>>  static void xe_lrc_finish(struct xe_lrc *lrc)
>>  {
>> +       struct xe_vm *vm = lrc->bo->vm;
>> +
>>         xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>>         xe_bo_lock(lrc->bo, false);
>>         xe_bo_unpin(lrc->bo);
>>         xe_bo_unlock(lrc->bo);
>>         xe_bo_put(lrc->bo);
>>         xe_bo_unpin_map_no_vm(lrc->bb_per_ctx_bo);
>> +
>> +       if (vm)
>> +               xe_vm_put(vm);
>>  }
>>  
>>  /*
>> @@ -1013,6 +1018,10 @@ static int xe_lrc_init(struct xe_lrc *lrc,
>> struct xe_hw_engine *hwe,
>>         if (IS_ERR(lrc->bo))
>>                 return PTR_ERR(lrc->bo);
>>  
>> +       /* The lrc->bo uses VM's dma_resv object, take VM reference
>> */
>> +       if (vm)
>> +               xe_vm_get(vm);
>> +
>>         lrc->bb_per_ctx_bo = xe_bo_create_pin_map(xe, tile, NULL,
>> SZ_4K,
>>                                                   ttm_bo_type_kernel,
>>                                                   bo_flags);
>
