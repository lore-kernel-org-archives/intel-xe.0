Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E7DC282CD
	for <intel-xe@archiver.kernel.org>; Sat,  1 Mar 2025 01:56:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B16B10ED70;
	Sat,  1 Mar 2025 01:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAk1h8ag";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0666C10ED70
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Mar 2025 01:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740794175; x=1772330175;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BJuZa9oPtTIpnmLwRbpYyY5mnqtLSqY1KpVAVCsbEYk=;
 b=fAk1h8agJIBk26iknJFyQtkQK7jR40LVuuFLNsAMduHaIzEzsYxdOwaQ
 /Wb6d9jcpXZ3RloVT74/zsiMo4qNuE90TEIvxHkUOrWh6MlOwG3qQzlsY
 JODRLy+dcFzucIdS4aD4xFKJ8xK4ZCxFhacUhc/VJmwIAABJcD/wiLyzW
 8nCZjWRiCWXzsoBEFlJfq7aBBVIkMUgwPaHuQBW1yOFwmEi+MI2p8lgwh
 9ZSFZo1mbGBelCSgJGX9NeBfwTAzvXpOLrX+xObjI3wugO3z4nfVNPIm3
 qzJByc2Y55ECxQdMJW/lOT1pTTaS2+PgkWObGvfcExZ1cPw17GSzjTngX w==;
X-CSE-ConnectionGUID: vJY2Pz3bQtSe235HGmVNCQ==
X-CSE-MsgGUID: ax6/1LodSgSiKuEHJ+gTUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="41861919"
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="41861919"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 17:56:15 -0800
X-CSE-ConnectionGUID: zR5bH26XSVKMlxRiNzPwpA==
X-CSE-MsgGUID: Ldg3i8KbShWSMr5io0aQKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,324,1732608000"; d="scan'208";a="117514604"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 17:56:15 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 17:56:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 28 Feb 2025 17:56:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 17:56:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsBCWzoEStxmwrj7sqwCFpLeFWeRuM7zr1lDaBHO8xnA/rXU28zHN31APywHGdSZeTDsvOu2wL5y3deShdk2may5jCPVRp4KPrLRllXf0wgSiEkMDa0qIYgX7vZLXd3LrpfMVq8wyc8eAsg9EKVSh48vjuIBm5mKoBSIojEH+I/L14fBTaY/RwSxEl6oll2KsHbKW45ayJ+h7E8N0bh/tTnfIUKOF+pOK9bHKBCXyN9pi8lR/xSxFEpXKFrGUbcQn7dcBSr7RSQsf9tCRcaJ+tfzSRXYTSmGQ6XAvc2CZCp5Rp9glSVRNKjQQtL9U/NDyCZKevm3ktrmLYb8lnjLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nu6ZuxVRYrij78dDDX4W5DstW1Mn+ycnHC7HnBejhY8=;
 b=XRvRUt+ExZ7xNW7TE9k75ldU9PU3tWdLOp6unr4FGivSxliIFfLvIEJUEtuUJxVu1MqAZhWzX2Kgco4cdGUhSFKH3c2sfnWH+eQVJsqu1Z/jSiAHDZ0zAxWK6pYCtQLCEFusKmovVKK+heTCOLlfJX1W9LgMhxtQmvMn5CKtc1Tx3qzJxdzFQH3br35YCxWrvSm9JLSiSTmBzd+ZjrfYDNxWjAsD7GdO8fH4N2QaV2QAz7BPjr2RpsWyJyN6oVDA7I0uwKDOnwY2mKO5WSNfvBgCjx+Xpoe4r/PDlaRAGX6+TbX0Rl2AzYA3xtgFijhmcLDzGcQDyoAf93tUF8oKjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Sat, 1 Mar
 2025 01:56:11 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8489.021; Sat, 1 Mar 2025
 01:56:11 +0000
Message-ID: <e2d34c00-ee7d-4dab-94da-a0412ef12513@intel.com>
Date: Fri, 28 Feb 2025 17:56:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc: Enable extended CAT error reporting
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Nirmoy Das <nirmoy.das@intel.com>
References: <20250227010530.3002093-1-daniele.ceraolospurio@intel.com>
 <20250227010530.3002093-3-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250227010530.3002093-3-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df30895-9c35-4423-a182-08dd58643dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjJXektLNktGRDVFU0NqZTJzd3hacERVZ0k0UG1BSXdsSmpIR05SdzF6dzhq?=
 =?utf-8?B?ckRzYVNEVnpKRDl3THNHdThYZHAxV2kwd2ZKMFoyWGIwT3FwMGwyWjBFRlBr?=
 =?utf-8?B?K1JMNkpkYlVkT2h0b3o3SjQ1amo2dTVDSWh6ZEc5OThMVHBjNlVCY3RPVXph?=
 =?utf-8?B?L0g0QVBKL2JBbk1BUjhML1Z5VDZDMTVNczdWS0JNTTQwTVVGTmF3N2pDWXJQ?=
 =?utf-8?B?RXN0UDRwRlZCYVI5RHRHSzhVNmZITkhMS0c2b0o2bENGektUcTdUdjVJV3Ay?=
 =?utf-8?B?VUh2ck9iQm0vRi9OeGpMd0FTWjkrNnM5Vmo0UUs3ZElrWW5GZXJnaTlBV2c5?=
 =?utf-8?B?RDYyQzR4UnJQajVYRDhwMUdGalBjS20yTEdyanNid2RSdEFjcFpyaTlhdExz?=
 =?utf-8?B?dFI4MWxVUnV6cDNiZk92L0c2MjA2dVFXK0k3RGM4UEZqUVRXM3NCbzJ4eHRM?=
 =?utf-8?B?QzczdHM5dlJsRUVQY2lwVk81aWdRYllNTmZrcHQ5NytpOEZXM0pSYW5hcVpp?=
 =?utf-8?B?dHpmUW5oZnVMZ3pDamRHMUticGVEUzl5c2NJZWJjWkpvVGx6eU42TDF5ODM0?=
 =?utf-8?B?ckJ3TnV1TExUNHFCTEVxaWhxTVI5dWtwRlY4a3BMbDAzbEdmVjk5WEdZNy8r?=
 =?utf-8?B?TEFENTV3bDIrWlBIWHd5UnhHYnVuVkxjeHJhSk5ZSXNOVXpxUHFBNU9RM3c0?=
 =?utf-8?B?TDRqZFBPV3lOZG1SaWFqYjNpdjZjVExxZE4rVHIxNnREUk9MN0VMMHliVVEw?=
 =?utf-8?B?ME1ySW83ZGJTRnBwclRvcFhsR2tlM3ZlYlJ6SS8vVjVlS0I5THg2MGtwb3pI?=
 =?utf-8?B?dmZRV3NicjJsd3Y2RzhtMTBheTJGVlMrd2YwSUhkaWI0MThUWkowWVRWRDdC?=
 =?utf-8?B?STFaeVY4ZHhEN1F2V0c1K3VnNHB3UEZkU2QyVmdBbnFnYkRwN1cvS1hSTEEy?=
 =?utf-8?B?Z29oRG5UR2E3aThZazRjRWRpSk80SUViaU9xRDlhNVdZUVFCek9Sa0tUNUd4?=
 =?utf-8?B?ckxYRUFTV3NjdnF2S2dhc0xWcFltdFdDN0o0V3d0dW5PaXJMbTcrM3JZYTRa?=
 =?utf-8?B?TzJ5Ty9KNkZHbVBEejl1bnlybDNkd2JxREpqMlVRbzB4MnZtb2Urc0hWemkw?=
 =?utf-8?B?a05BVlE4OFdEb1ZSV3VZUE9BaTZmcElUaDhDRElXWmN2RWx5ZjZRMnZNV01q?=
 =?utf-8?B?bEEyMEtIWUdUcmV0SVVMUEFKQ2pTREJVUW1nWldIdFA1UE1hWUJaZ3hXRDJz?=
 =?utf-8?B?ZkVkMXhXc3B2N0tsOHZxSVRSZjNzVk9MUHV1L0pxYldhaDMxUEpVRWU5VGxo?=
 =?utf-8?B?NnorU1lWVG5oNUwvYzcwSzVLaXViQWJRZy9zYlRXL2o5cy9HNFptUk5STzZV?=
 =?utf-8?B?ZFY2aWtKZkxuMmlBWGJoSUNCNTRFSkhEUXdjMDRKODZLaU9TZVZWY0R3SDcz?=
 =?utf-8?B?Q2lsdldpQVNaTDJhTDNIY1JJUDVIRWtCNTdBQVpNck5lS0tNeHdnaThYc2xH?=
 =?utf-8?B?clh4UURGU1BhelYrbmJ4bXJBU2VSczBGRW5VblJPQUVmRmRmOVRZM2Excjhz?=
 =?utf-8?B?RkMvcXhpUUMwb3lkY1BhREVHU2pjUHNiNEJJS1E1QzNhZTFRZjZWdXVvK0Uz?=
 =?utf-8?B?LzlQYnZxcWFCR1NMUlRYc3VSZGVSYkxzOGZvMW9VUWtYc3cydXJpS282RXNS?=
 =?utf-8?B?MFdwTVNDd2ZxNVJwUDJubFpEaFRMZEZlSEdwOXhMT3NpK0VJYktXbGJrUFZj?=
 =?utf-8?B?ZE0zUFluS01wZmM5OXB4ajc5RVR6R1dZUTlMdHhWb0UzVGhoZkNDVW5OZnFz?=
 =?utf-8?B?bml3djlqeFkvRzA2eHhwQVVoMUU0cmN4YlZZN0ZCbkVra1dSbkQzQkZuU1ZF?=
 =?utf-8?Q?OCITBh2nu0IWS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnduNXB5cy8wb1lFZ0xHM2o3WEVPVEMwOUNmQzhJMkZKMFdWNXlKSkl2MWlR?=
 =?utf-8?B?YU9DYjVoVDJDQnRuQmRSK21UMFNnZVNVOGZtMTk0TlJkRDhVejBvdWk3N0RY?=
 =?utf-8?B?QThDWjVtRTkrVWtpMGFRZHRDREhnWWx1amo0dHdnWDNYSnExS2dscVQzQnMx?=
 =?utf-8?B?dUg5N2RqaDQ4MVRzR3pqNVg2dmJVL2xzbEZkTXRXbWwyOGpMc1RtQVVpWFRE?=
 =?utf-8?B?cHRhS0NqOTROclJFSnNEWFRsRDN5Q2RNSFhKWS83ZCtpOXJlUE0ybURZV2tW?=
 =?utf-8?B?cHBLRWRLTkpuZFhxTVZqR3Mwd0lRd2poc2oydlVubzl6cW5ZcWFvUGhtbHJl?=
 =?utf-8?B?NTNUdFdCMnBqWk02TTJZekJ0NWdCYk1tclRVWHA1dWd1S0RhY0NIdDI4ZFoz?=
 =?utf-8?B?TllQeDZUTGljdnk0dzR1UExTQzNWcVZlZjV0cXZJV2czdnc3UHFlVlFRZ29K?=
 =?utf-8?B?SGE4OWRKblM3WDFoL3IzZEFudC80SWZ4MzF0VlJCcjloRk5lN043bDJFRFRC?=
 =?utf-8?B?SUdPL242Mm0yZmlpRndjRTkwWXA0eHpua3VXTGd0cjlZc3E1RDRYK2tyM0do?=
 =?utf-8?B?S3BQWjljYkVubzB3dVZXd1ZJdUNxbk9WY1pLajNvMVJqK0Q5SWpIa0lUSkc2?=
 =?utf-8?B?eWxrMTVxcy8xZnhQZEpiZmlnclVweWoyaFdhSDM0VUNpeisvMjVsNldBekVp?=
 =?utf-8?B?eXhEKzF4eUtRRWlGeVJOZGxWV2lCN3NNQVl5OVQ4bzNSd2x2Y2p3ZHN1VnFN?=
 =?utf-8?B?OWlpRTZxeVc4R3VxYWhlNFRWMGFDbGtYN2NsS1JYVzBONW1CWFdZS09RbE1s?=
 =?utf-8?B?c29mNDRpMFpzY290UGwwMTlrOXlkSVJuRFBjaHAvdzIzVERTMlFWRUNrRXlV?=
 =?utf-8?B?OFBuWmhYNlIzWkQwcnJKUDgwT2ZLenBWS3YyUzh1R2x4dG9JdENQM2Y4L1JR?=
 =?utf-8?B?V3hSWmNlelZVWTVXZzdHS0VqdExWSXpJV2tNYXZUbDNBcUZCc1ZObytOM0RM?=
 =?utf-8?B?WVBhV0E4RVRrWG50UVZGVWs1N3FDSXQ3YXUydzc5RDJrQ3JBekxSUjhWa3ht?=
 =?utf-8?B?amk4REQwUEdiSkZaQ1VQZW96SkhKc3greVFIVTJSWUJ5UElZNWlDYzljL0VZ?=
 =?utf-8?B?cm03cGphVERqTS9ZL3h6S0N2YVFqTHdqL2hpWkVibXJVUGhvUENsYnRwVTMr?=
 =?utf-8?B?V0YrQ0wvaitIS0pxQk5lQ1VTemhYRUNMQmlqSnBEYkxGN3E3M0N4dUVxK0Mv?=
 =?utf-8?B?UjlkcnZ0QXFNbjR2RVFhTG8rcURmV3ZTVy9qcjJrclE4ZGxPM1p6Nmd0alNp?=
 =?utf-8?B?QW1henJKdU5SNm5NMEdlMW9rSXpxT2lxdVNvT0R5SkxPVDZ5SDFzQWJzcGhY?=
 =?utf-8?B?NkF5dHUzWTB5V3hFUXBDZUpSVWU1YWJqcjZKaVNDb09CL3ozNjVZMC9GbVMz?=
 =?utf-8?B?aEZ4RTBEWE1yN2xmaDhzTCtJY2d3UmdhY21LOWttR1d3SXdsS2c2T01ZZmxu?=
 =?utf-8?B?ZEZsbU5JTDNTZ1N6bzN5UE96blFrWnFHSTNYalY5WUdXcG12MU1FMG1MM0lP?=
 =?utf-8?B?TFZMT2VZdjdxR3VybkUxQW12THB1UjVNaVB1cTh2UVZNNkFnRnFRRjBaWHNz?=
 =?utf-8?B?L2VSbEl6cnd0WEp5aE5WSlppazVQOGVxRTFmSzM2MjZHdFFVR1cvRE5zcGhL?=
 =?utf-8?B?dTlVY2p0b1hYcG54cCsrbVIrVkZ3ZnlqR2Jxc3M0RmJ0dUJjQ2xMblV0Q1JJ?=
 =?utf-8?B?SEJGSGo1enZBOGdvYnFoYTV1cVRTRzhiZm1rU1dqZDJnaGU1cnUreU45TExV?=
 =?utf-8?B?WEtDNVN4ZEU2VHorcUFwUVNaVHE3cTUyVXBEVXVxcDE1eWkxNEJHcFNINmE1?=
 =?utf-8?B?NGFnb2haYTlVMmJsQWdWTXllT1ZoTXRKaUVBVzlqOWZXaXVraEsvamtZb1JT?=
 =?utf-8?B?aHJSM0V4NlMxdFA2R3pUQ3B1bnlVQndmT0FZbHlSalNCWTE5Wk1Sb1BkK1p4?=
 =?utf-8?B?MFF3c3ZlVGlOMXNwZWl2MVhtVkZvL210eEJ6Q1B0Rzl5U3hsLzVHS29KQUh5?=
 =?utf-8?B?V1dBUE1QWWlESGQ1VmNRQzlnYVE5dTBHa3lXNEVLUnc3L3FCU3piOG5xK2VN?=
 =?utf-8?B?UTBpUmRjTERaT0FmVEtwK0h6VG45L3JKUEMvZ05ibjRyVndwbngrNnFFWHF6?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df30895-9c35-4423-a182-08dd58643dcb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 01:56:11.4598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LIBuNHSeRnVCbzZIKHFzi0xLVfMzor1AArkt8tHAve+6oZdVsvUWMJZF4c4pFDU9ou01i1scyr+bm8ljwkg4FOEUvrFVxHc5SPr/xZJsFLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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

On 2/26/2025 17:05, Daniele Ceraolo Spurio wrote:
> On newer HW (Xe2 onwards + PVC) it is possible to get extra information
> when a CAT error occurs, specifically a dword reporting the error type.
> To enable this extra reporting, we need to opt-in with the GuC, which is
> done via a specific per-VF feature opt-in H2G.
>
> On platforms where the HW does not support the extra reporting, the GuC
> will set the type to 0xdeadbeef, so we can keep the code simple and
> opt-in to the feature on every platform and then just discard the data
> if it is invalid.
>
> Note that on native/PF we're guaranteed that the opt in is available
> because we don't support any GuC old enough to not have it, but if we're
> a VF we might be running on a non-XE PF with an older GuC, so we need to
> handle that case. We can re-use the invalid type above to handle this
> scenario the same way as if the feature was not supported in HW.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  4 ++
>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    | 15 +++++
>   drivers/gpu/drm/xe/xe_guc.c              | 83 ++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h              |  1 +
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 16 ++++-
>   drivers/gpu/drm/xe/xe_guc_types.h        |  3 +
>   drivers/gpu/drm/xe/xe_uc.c               |  4 ++
>   7 files changed, 123 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> index ec516e838ee8..fc632c738012 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> @@ -141,6 +141,7 @@ enum xe_guc_action {
>   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>   	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>   	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
> +	XE_GUC_ACTION_OPT_IN_FEATURE_KLV = 0x550E,
>   	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>   	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>   	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
> @@ -239,4 +240,7 @@ enum xe_guc_g2g_type {
>   #define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
>   #define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
>   
> +/* invalid type for XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR */
> +#define XE_GUC_CAT_ERR_TYPE_INVALID 0xdeadbeef
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index d633f1c739e4..4c2b5bfde8fe 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -16,6 +16,7 @@
>    *  +===+=======+==============================================================+
>    *  | 0 | 31:16 | **KEY** - KLV key identifier                                 |
>    *  |   |       |   - `GuC Self Config KLVs`_                                  |
> + *  |   |       |   - `GuC Opt In Feature KLVs`_                               |
>    *  |   |       |   - `GuC VGT Policy KLVs`_                                   |
>    *  |   |       |   - `GuC VF Configuration KLVs`_                             |
>    *  |   |       |                                                              |
> @@ -124,6 +125,20 @@ enum  {
>   	GUC_CONTEXT_POLICIES_KLV_NUM_IDS = 5,
>   };
>   
> +/**
> + * DOC: GuC Opt In Feature KLVs
> + *
> + * `GuC KLV`_ keys available for use with OPT_IN_FEATURE_KLV
> + *
> + *  _`GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE` : 0x4001
> + *      Adds an extra dword to the XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR G2H
> + *      containing the type of the CAT error. On HW that does not support
> + *      reporting the CAT error type, the extra dword is set to 0xdeadbeef.
> + */
> +
> +#define GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
> +#define GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_LEN 0u
> +
>   /**
>    * DOC: GuC VGT Policy KLVs
>    *
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 7b38447d902c..7483aba713b7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -29,6 +29,7 @@
>   #include "xe_guc_db_mgr.h"
>   #include "xe_guc_engine_activity.h"
>   #include "xe_guc_hwconfig.h"
> +#include "xe_guc_klv_helpers.h"
>   #include "xe_guc_log.h"
>   #include "xe_guc_pc.h"
>   #include "xe_guc_relay.h"
> @@ -569,6 +570,76 @@ static int guc_g2g_start(struct xe_guc *guc)
>   	return err;
>   }
>   
> +static int guc_opt_in_features_init(struct xe_guc *guc)
> +{
> +	struct xe_bo *bo;
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/* opt-in KLVs are all 1 DW so far, so a page is more than enough */
> +	bo = xe_managed_bo_create_pin_map(xe, tile, XE_PAGE_SIZE,
> +					  XE_BO_FLAG_SYSTEM |
> +					  XE_BO_FLAG_GGTT |
> +					  XE_BO_FLAG_GGTT_INVALIDATE);
> +	if (IS_ERR(bo)) {
> +		xe_gt_err(gt, "failed to allocate bo for GUC opt-in features\n");
> +		return PTR_ERR(bo);
> +	}
> +
> +	guc->opt_in_bo = bo;
> +
> +	return 0;
> +}
> +
> +static int __guc_opt_in_features_enable(struct xe_guc *guc, u64 addr, u32 num_dwords)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_OPT_IN_FEATURE_KLV,
> +		lower_32_bits(addr),
> +		upper_32_bits(addr),
> +		num_dwords
> +	};
> +
> +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> +}
> +
> +int xe_guc_opt_in_features_enable(struct xe_guc *guc)
> +{
> +	struct xe_bo *bo = guc->opt_in_bo;
> +	struct xe_uc_fw_version *compat = &guc->fw.versions.found[XE_UC_FW_VER_COMPATIBILITY];
> +	u32 remain = bo->size;
> +	u32 offset = 0;
> +	int ret;
> +
> +	/*
> +	 * This opt-in was added in 70.17.0, so it's always available for
> +	 * native because we don't allow load of any firmware older than
> +	 * 70.29.2. However, with SRIOV we might be a VF running on a non-Xe PF
> +	 * with an older GuC release, so we need to check that. GuC 70.17.0 maps
> +	 * to compatibility version 1.7.0.
> +	 * Note that the GuC allows enabling this KLV even on platforms that do
> +	 * not support the extra type; in such case the returned type variable
> +	 * will be set to a known invalid value which we can check against.
> +	 */
> +	if (MAKE_GUC_VER_STRUCT(*compat) >= MAKE_GUC_VER(1, 7, 0))
> +		xe_guc_klv_enable_simple(guc, &bo->vmap,
> +					 GUC_KLV_GUC_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY,
> +					 &offset, &remain);
> +
> +	if (offset) {
> +		ret = __guc_opt_in_features_enable(guc, xe_bo_ggtt_addr(bo), offset / 4);
> +		if (ret < 0) {
> +			xe_gt_err(guc_to_gt(guc),
> +				  "failed to enable GuC opt-in features: %pe\n",
> +				  ERR_PTR(ret));
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static void guc_fini_hw(void *arg)
>   {
>   	struct xe_guc *guc = arg;
> @@ -640,6 +711,10 @@ static int vf_guc_init(struct xe_guc *guc)
>   	if (err)
>   		return err;
>   
> +	err = guc_opt_in_features_init(guc);
> +	if (err)
> +		return err;
> +
>   	return 0;
>   }
>   
> @@ -684,6 +759,10 @@ int xe_guc_init(struct xe_guc *guc)
>   	if (ret)
>   		goto out;
>   
> +	ret = guc_opt_in_features_init(guc);
> +	if (ret)
> +		goto out;
> +
>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>   
>   	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> @@ -769,6 +848,10 @@ int xe_guc_post_load_init(struct xe_guc *guc)
>   
>   	xe_guc_ads_populate_post_load(&guc->ads);
>   
> +	ret = xe_guc_opt_in_features_enable(guc);
> +	if (ret)
> +		return ret;
> +
>   	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
>   		ret = guc_g2g_start(guc);
>   		if (ret)
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 58338be44558..4a66575f017d 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -33,6 +33,7 @@ int xe_guc_reset(struct xe_guc *guc);
>   int xe_guc_upload(struct xe_guc *guc);
>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>   int xe_guc_enable_communication(struct xe_guc *guc);
> +int xe_guc_opt_in_features_enable(struct xe_guc *guc);
>   int xe_guc_suspend(struct xe_guc *guc);
>   void xe_guc_notify(struct xe_guc *guc);
>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..e53653cef66a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2035,12 +2035,16 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	struct xe_exec_queue *q;
>   	u32 guc_id;
> +	u32 type = XE_GUC_CAT_ERR_TYPE_INVALID;
>   
> -	if (unlikely(len < 1))
> +	if (unlikely(!len || len > 2))
>   		return -EPROTO;
>   
>   	guc_id = msg[0];
>   
> +	if (len == 2)
> +		type = msg[1];
> +
>   	if (guc_id == GUC_ID_UNKNOWN) {
>   		/*
>   		 * GuC uses GUC_ID_UNKNOWN if it can not map the CAT fault to any PF/VF
> @@ -2054,8 +2058,14 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   	if (unlikely(!q))
>   		return -EPROTO;
>   
> -	xe_gt_dbg(gt, "Engine memory cat error: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
> -		  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +	if (type != XE_GUC_CAT_ERR_TYPE_INVALID)
> +		xe_gt_dbg(gt,
> +			  "Engine mem cat error [0x%08x]: class=%s, logical_mask: 0x%x, guc_id=%d",
The type is only a 6-bit enum so I would say printing as a full 32bit 
hex values is overkill. A simple '%d' would seem more appropriate and 
easier to read.

John.

> +			  type, xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
> +	else
> +		xe_gt_dbg(gt,
> +			  "Engine mem cat error: class=%s, logical_mask: 0x%x, guc_id=%d",
> +			  xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
>   
>   	trace_xe_exec_queue_memory_cat_error(q);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 63bac64429a5..d1de288d816d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -101,6 +101,9 @@ struct xe_guc {
>   		u32 size;
>   	} hwconfig;
>   
> +	/** @opt_in_bo: buffer used for the OPT_IN_FEATURE_KLV H2G */
> +	struct xe_bo *opt_in_bo;
> +
>   	/** @relay: GuC Relay Communication used in SR-IOV */
>   	struct xe_guc_relay relay;
>   
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index c14bd2282044..7aa93deb4325 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -165,6 +165,10 @@ static int vf_uc_init_hw(struct xe_uc *uc)
>   
>   	uc->guc.submission_state.enabled = true;
>   
> +	err = xe_guc_opt_in_features_enable(&uc->guc);
> +	if (err)
> +		return err;
> +
>   	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
>   	if (err)
>   		return err;

