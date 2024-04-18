Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BF6C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 14:31:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A75113CFF;
	Thu, 18 Apr 2024 14:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E17HwfFQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE68113CFF
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 14:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713450692; x=1744986692;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=NW6YlXd0fMihaokn3TrheDmUJo1D8y7JoJ+lXWLHwRk=;
 b=E17HwfFQqx3SvKV7r2UdbJzGc51MpAfMwnMVjQIWx5x0HTJBLje0ku6a
 L0dWeCDEdfDB1UhOD4tjj0fW2RYJcweV4zsBPRXjCwR3EF2cqlzNxJ52m
 6CGgECpGY2UHv5mSwHYX7RKg61zkdDRx2ljb0qR6nA3x/EFRSKQRAnqyA
 cQM8+S8eaz1GT72ULQM4nZAaZMQDZCAVCTyZKLSp9U56PKXQHJyBkzqFj
 flo5eYSPc2gNz7b1dHeHRN9aqv5+YBl/bQ5DZJKq4qr63BaAqHNbNA5HP
 UjuBpIF3HJF8z2FI1idgfMxHs8kt38hrLisQh56tJOHOeFOwtXtxJM2Eu w==;
X-CSE-ConnectionGUID: 59Wl5mpMQvmL38HvsLH1lw==
X-CSE-MsgGUID: KAiW8F9HQ/K8rLeCtJKP9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8926372"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8926372"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 07:31:32 -0700
X-CSE-ConnectionGUID: MGKuVclSSJS9xZFh4FrqnQ==
X-CSE-MsgGUID: cdQMdAOpQxSvsSbcIoEZPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23522531"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 07:31:32 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:31:31 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 07:31:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 07:31:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 07:31:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsXQOj3hpvieDqxF9Kux4eWxTkzjxEEvk9Nc9IPdHwQjUTMTaoKYI9KJ0bY5vxbrcRcscB8SlRW3YbENYRWWV1ODEFW2KgV/MYpEYZt5cFcpKZysv5AqpzcjrgLLHJlsXvdgC/Q3PJxYmK2hFL300m7+/ompG58gAyl8m8femL+B+ydSkbm334NKnMBzNS++kWhmoePDd8z53AmPcsPDMrsVvmx5RRuWaLd2H92W+nbtvQekLBcqK29uXSTOySp9sUU2gb2zuHgZhqxzajqIRuQYae9lUQSpo4A9Eoc2Mb7hYKa/0Ibd7c3UcKogbMxD7cjoSPXn9sxVh2TtammpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NW6YlXd0fMihaokn3TrheDmUJo1D8y7JoJ+lXWLHwRk=;
 b=kXCVrTccBYFNTc8pOzJ6nZZwaazsfv0kB+yp0OojnQMC5LfMu2TdqWVnc3jQs6280xDMQxvbBxd+/qUeo7kyllSRFjrBzsgYke8MS+7RJA/JacM8AXUaC3ZeK3zluA+gMgsBazQY9DhrLoabxsR2sU/nS79XA9OjgWNhcoabaho3NQHmiXrEYq0I53VSlaBnS4u7nbJ75tIJqS8+bGZ+S8eNdTLib4oLFhertZmjTB1H/9ugHz2xua81+IpcnOS2LaIQIS7wGgHT50cKRG0E5Q25mF1c/MwslJNjZEQ2lnoxWKUiqGMtVkeASXlq+NUu96uqxgfLMOGirxnDCpZWrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5167.namprd11.prod.outlook.com (2603:10b6:a03:2d9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Thu, 18 Apr
 2024 14:31:28 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::3191:4863:ad54:bdb1%4]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 14:31:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <h7vbeswsxbjgf672ddvqgyobvpfslhbu6vmxuc5c6tmt6rbjm4@q5k7wdducac6>
References: <20240417212501.312346-1-gustavo.sousa@intel.com>
 <171339034765.54602.16408540374552896913@gjsousa-mobl2>
 <h7vbeswsxbjgf672ddvqgyobvpfslhbu6vmxuc5c6tmt6rbjm4@q5k7wdducac6>
Subject: Re: [PATCH] drm/xe/xe2lpg: Extend Wa_14020338487
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.de.marchi@gmail.com>, Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 18 Apr 2024 11:31:20 -0300
Message-ID: <171345068091.2007.2771873276517783240@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5167:EE_
X-MS-Office365-Filtering-Correlation-Id: 086b2c86-4261-41f3-f802-08dc5fb43bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYLLdI78wj0/eENFzWvNhJhrJdq8Eirk0GiQY33hUpSE3PrSMLgjOZ+Ve4fcW+AgacSQG4pPhn4gOgmJBieQHS/oPVerLwsvGyIx8pl3MQpCKIrYvIWCi0XnFyhIQTebVrtX6QRE6QcmpcOPgZeNQPlZUnK1Kd7GSMawLfFPn1CKam0hFoMjN0PIoibrTZubzZcjTHTcjz3jGHgfznXkyR520wkKrQ63GNCT2dkVJxnZoTCGW71p+arY/MdjM/3h8PtgC7Meg0E0SHFO/IpOclOo6jVtGIbQTs5R2iG4fSQY85b/IUaaz4JXNFd61Iu4q/DNoUAbSUacrmwBYdRObtBETeOVaOrHTOHtl7jEEHdDIhAKmU0Hf2YOnWeyeC5jlNMWTPBOZBLunNjSLWC3ugwiuTSdutfxHWgzZBiRh+euBsUnBiF4BYUVOU5hgDjqi2Iz5sGB9W9iec5CtGergwPf8O6wNeYA5rD1+f1FUZcYle6wE/s4dZ/RDHO6lG0EoBht6sx2p1v/dkcndIe8vMJNb9xf/8HsQLJy9faCllbr84VJaY3ZaqM8Cc28KcKMAeNvenZ1SwoLL6Jdnj/n12VkHimO8WSLmF3jXrYQNAf7DpRmVKY2am9qwnBahbrxKV4G3PEgvnRnBozTHB9KnaF8RHIuA1DyTbBWjUoGD08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2NZTlZzQjl3UUU5Z1d2NlJxM1hpcDVLWGQrU2dNV3dpZkFvNzVuWER5WkI2?=
 =?utf-8?B?dzB6Z2U2Wkc1d1RxVjlEalIzNzFPcU1FRUFzRCsyQlpqNkI1TnUwQjdTbUFM?=
 =?utf-8?B?alhNTDBwYTVCeG92a3BhVVJtSHE4MjJBOW53OTE2cCtyR1hSemxqcUM1bzVR?=
 =?utf-8?B?UDd1QWdUR3JJR1c0RkhEY0dJQzlub3RhcHhtMFNGS1FBa05yOENzZG53K2wy?=
 =?utf-8?B?S3Fad2dXOTdKb3RGYzFwbGVERFBwNm9CRG5pSkt0b012czNZRG00VDd2ZE9p?=
 =?utf-8?B?ZzByMUEyOEU3K3FiM2phTlFBK1FwdmlFOHNnMjhXVzlFS3Q0T25LNW9ZdDc2?=
 =?utf-8?B?eUZmRzBlM0FoMmJUNGdLVlhaSUc3NnlPWkowL3RjYTVRWXlhekQ1enR0VFBm?=
 =?utf-8?B?N2x6WC9rd1IyUjhlejhkQXJjekJ6QnJFdCtjSVlMTmFjMGR3ajNXNmpWdTZH?=
 =?utf-8?B?dmVTa0V1RFNXYVppNS83RzF5SWt6d1h2alFhUGt6MVlGbTc5WVVWY0ozQUtz?=
 =?utf-8?B?eFNxc0xrYm93RG5zT1k5TUdEZC9ubUViWFJVOVNQKzhWanNKZlR4U0E4cklY?=
 =?utf-8?B?U0h4N0orV1dvSnk3REZPTHh4U3MzeVJuTkg0aUZlTy9kMTc1Nm54cE5DbXRL?=
 =?utf-8?B?TEYvZDBjcGI3VkE5QnNGMzNxQWhMLzNtZ1RHRVQ0TVhzVFZwRXBSRk8vOHdr?=
 =?utf-8?B?VHdtbmtFRThWMWN6MGpHdU9WUDR3S0FmamtNNXFXVElIRmExWS8vRU1TcGhJ?=
 =?utf-8?B?Q2FoYTFIdi9nMVJlVE4xTTVnT2M1cTR5SnlIQlRkTWtHWFhOWkwrZnV3OW5J?=
 =?utf-8?B?MW5Ra0dRSkd6RXNqYUF6aGNSSW0rVVJjZXJUVzkyRVY1TURpQjIxeCtsaEZs?=
 =?utf-8?B?b2orOHVRQXNHbHRRWWp1S21uektJaGs5MXRoQTRCdW5hWEVZSUU2ams1NC9x?=
 =?utf-8?B?OVB6aXdEdGpNbllPUGUvejVIMEZ2V2Q3OFI5SmZQWndkcnZkeXNIMXhsTjhJ?=
 =?utf-8?B?OVFoZjNtRG5MbXNaV1VEZHVMRGxvSThvSy94d2JXaEM3bTliNHFyR0ZOSUR1?=
 =?utf-8?B?MlF5cFEzTHNNRVpyblB2ZXRXNmQ0Y2NNWW51eGdiYXpMSy93TWFZZjM3SStP?=
 =?utf-8?B?RDk5MXREVmhkT2xOem1zcEFVaENyQUhTdndkZ2VPbHRMdWU3dHhQRHVWRmtu?=
 =?utf-8?B?ems1d3NMenVjQitteWFVcmZYL3NJcUVrZEV0T3FwOEFWWlEvWGkzYTBzek1F?=
 =?utf-8?B?OU5TcGNKWEtINldDS2R0S1BHeHpaenVJZG9EZHd1R3FzTk5pcFFzVzArNTdk?=
 =?utf-8?B?U29PYXh4Vzk4Wm44YUpvSVFYRFJFbVlIY3RncUxnSFF2VURsZkFnRTVSM3k3?=
 =?utf-8?B?RXF0UXFCRDFZc0lJRzcrODMzT05jZUdqaUJ5WXhNTGxnUGVjenVRU1labVpm?=
 =?utf-8?B?MHZqcWhMYlltODVUaGpDWUZORUlNZVZFRVFyNjQ3SlJROUNTYlJ3SXFzcEdi?=
 =?utf-8?B?akdXaE9ZTlNoczRaQm12N3QxS3gvQldLVTluUDRidXZLS2Y3Sk80b3BDa25L?=
 =?utf-8?B?T1ZHTitvNnAvWGd3RlpsZ0hVV0JEN2tEdFdWalhRYzRXSXBhQnR6NFl4N0xX?=
 =?utf-8?B?anFBKyt0bFpwTEpicktLaHBLN2RiQzlocFMvWWpiNUhkbVRtZ2o0WUQ2SHNw?=
 =?utf-8?B?NnJnaENlZWFUbmU2TkxyWnF0R1liTlNGSWpBazgrclB0bG1oMFVaVEsxeXNH?=
 =?utf-8?B?R2JteVlBNWw4eEZSdldCVlpqWm8wUDN3UC8vVUxyTHNXQkxiOVJEdERCaDYz?=
 =?utf-8?B?WHBZZHdacGxVTTdHWXNtQkVxSzZ1QWRDMkdqRnl4N3ptckRQS1EvQTF5MXNW?=
 =?utf-8?B?SlJmTWVaYy9tMXZjaDYvSTVaTlQ3WlNka1JpVU9iaDhBVjBuVjZCa1ArRWRp?=
 =?utf-8?B?UGJxMU0wMlFubHR1NTdmZzJndURGaDFTOEg5czM0TXJMQVVyR2lqT29NM1Ru?=
 =?utf-8?B?WVNQRkVMTlh3b0U3RjF0M2dvenVaZ2s3ZHdGMTNQemw2WGxKOHoxWkxHUmoy?=
 =?utf-8?B?L1JsMFRNY2lSM2lnZFhOTUxLaDBwRzVjZHNHSkFJMDlKbWQ4RWJYdzNwMWhG?=
 =?utf-8?B?WGhKbkJqcklEblhTN1hLVUVLN1hWT1h2MGJzQktGWGtZTVpmVERoTDNISWlq?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 086b2c86-4261-41f3-f802-08dc5fb43bf5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:31:28.5798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzqiWQtKs/kp1aOgA2FxPfYMqmZt1lHhaOa1P0mmlj6KtrJ5N+ERpkPgTtk9qZzXeB7PBuscKLLg07tK1YZqzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5167
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

Quoting Lucas De Marchi (2024-04-17 19:35:11-03:00)
>On Wed, Apr 17, 2024 at 06:45:47PM GMT, Gustavo Sousa wrote:
>>Quoting Gustavo Sousa (2024-04-17 18:25:01-03:00)
>>>Wa_14020338487 also applies to Xe2_LPG. Replicate the existing entry to
>>>one specific for Xe2_LPG.
>>
>>I would also like to take this as an opportunity to discuss the way we
>>are currently arranging the RTP entries for the workaround. Using this
>>one as example, created a copy of the entry and edited the argument of
>>GRAPHICS_VERSION() to match Xe2_LPG. There are multiple cases already
>>following the same pattern, mainly because we are grouping entries by
>>IP release.
>>
>>Do we want to continue following that pattern and keep the code
>>duplication? Or should we think of a way to avoid code duplication here?
>>
>>A very simple approach that I think of is having a single entry for each
>>lineage. But I guess that's not really feasible today because I guess we
>>do not have a way of expressing logical disjunction in XE_RTP_RULES().
>
>yes, implementing it was always something I considered, but then there
>was also the fact that when we have WAs that are on IPs that are not
>close to each other we may have subtle differences like registers with
>different offset or mcr vs non-mcr.

Yeah... Subtle implementation differences among different IPs might
exist, which would make the unification a bit more involved.

>
>There's also the implementation side: implementing the OR probably means
>increasing the size for every item so some of them can have ORed rules.
>
>The other option that I was considering was to eventually split
>the rules from the actions and follow a similar scheme to what was done
>in drivers/gpu/drm/xe/xe_wa_oob.rules (but generating a table rather
>than the current xe_wa.oob.c). The positive side is that we free
>ourselves from having to implement things in CPP. I'd probably gone
>that direction if xe_wa_oob had been done before the rest.

That would be a very nice approach IMO. I was thinking about something
similar. Having something like that could even allow semi-automatic
generation of entries in such a table: our internal tooling would apply
modifications and we would review it before merging.

Ah, well... If we had a way to have a high-level symbolic description of
registers and fields that would translate to actual offsets, ranges and
access method (mcr vs non-mcr) depending on the IP, then even the
actions for the most common workaround types (those that are simple mmio
writes) could be spelled out once for each lineage. But perhaps that's a
dream for another time :-)

--
Gustavo Sousa
