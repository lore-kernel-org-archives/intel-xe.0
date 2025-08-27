Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47852CA0EFF
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AC110E88F;
	Wed, 27 Aug 2025 19:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUbt8IWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C22110E88F
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756321965; x=1787857965;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ceHPWXJrhFC/xT0HTAd+2YodkFnKwIHZIgUXhCX0hhk=;
 b=RUbt8IWzdJXFDklz40iLrzYLj8SUuuYXQVEueEQybC3VfUK3OWyX4Yf9
 saGsZ4OMqP0wiz4PP90YfXohQxftg0DInbZLNwI+15VTlEtZ2Re/p6Szv
 JhD6HaiMq5iGRa2F0mfclKCjE2LK2qJX7SJauBgK7WJvUFq831BCmaY36
 eoiQIptrl0cUsGZltzvfpMZTNMS/fyshIzOBKRW8HJlku/szNAz4ykQVe
 naYWiTj3yhb5L2AnN3/mYPVY2ddEuDRrpBk91mYlq69nQ+7kU2mFpvO8H
 7tk9JArfWNfyveCdisTP6gVegujMc+uI3JEDEYRRikeuIw6jkLaz3yjYl Q==;
X-CSE-ConnectionGUID: mN8KmJjdShKMVFE9QrHSYA==
X-CSE-MsgGUID: nikUfOaQS8mcT8orKxQEuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57782821"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="57782821"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:12:45 -0700
X-CSE-ConnectionGUID: y2R3ku7iRNqcy8/zMXI8ug==
X-CSE-MsgGUID: iwi85YC/TdCfgRZhJMTLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="174089057"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:12:45 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:12:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 12:12:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:12:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jldHkl2Jb6j3rHjuAbTmDg+cFZ/2IsXb3KTF1Ta4zwyU/dvcXkYOfejYvwcgBxsJ5xrIURKNRvU1tsBIlphUzzRVSscysXLwniGJr001+8MxsFN97Ja5V+ejw1pDLL2vc4otcPaWdC0UTeHkyVUeWfuwQS26z2CUzfldseXu+tjRQ4eodzw5hnolR+kPmqOqps5nUTNMI6Goy7A/m9pG3g071UtrvAWWUuW8IMZg5P6CoKtox0rbDtCGEGWXsItaFU/xn6fwr8ZeH3Oj3dq+zU4YYvj7T0eiJLf1I6sAJGsJsTrpAgPc3i8G7M/cumrzuMLBR3ta0mCpugNGJyvy7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTwNWTy3R1w8eSGpyEzh1DcU/MdSpNPMk/hGDxD8eaQ=;
 b=nfYqh1mER9+75+tDXe5viw2N3aySzpjzX7E+UeGoYC4fhDlfyiJbjuKcPPLZXdf2ioOu3LQ9PwsK+NtMbPB1BG0HAkQLH2PRMxpYzXBKx0Il77j33NdWoqAfafcztNOPwAntPYP2jbEVlo/qjd+Qhi+Ry4wYUuWG2dWURjmUZOIanzbWP/NLHWW+C3e10xiTVr+ARdNyQcsrcTt9KwtjLUt4m2X93gkaX3FTv5zIY643La1TigBNWXs6yBddU5zbVvkRnQJ+1ahidwLyfJKCFVslO9V6uDH+WF+PYKm+KRozTQH7nJQBas05JGlfDghgeAFKts7AZaOLjsncujPEWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 19:12:40 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 19:12:40 +0000
Date: Wed, 27 Aug 2025 12:12:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/3] drm/xe: Track LR jobs in DRM scheduler pending list
Message-ID: <aK9YpUTSSZenQnxO@lstrano-desk.jf.intel.com>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-4-matthew.brost@intel.com>
 <862c6172-3308-4a69-baa2-fe984a082269@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <862c6172-3308-4a69-baa2-fe984a082269@intel.com>
X-ClientProxiedBy: BYAPR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::19) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: c22c14b2-4bf5-4b19-5995-08dde59db159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEJKakZFY09oVkZDVGVtZzB1dVNwY01GM09WWXpDN00vOElkS0FSNUU4UEZH?=
 =?utf-8?B?MENGNlcrN05oc3hRWi9RVjh2akp2dHV1Unp1akdYVjlDSXhJNmJoVzgvOXVJ?=
 =?utf-8?B?ZXVPVHhRa2ZDdDEyY2tXZGg2M1RNSm5jaG9pRE04eU1NdUxhb09JRGZ1VGlF?=
 =?utf-8?B?VTBMQS9Dbm1jaVF5Q3FQYlVkYjlnV2xyM05tVUNvWnZ5bVNyRlNnNTY2eGV0?=
 =?utf-8?B?UnFpR0RvNlFNYXM0a2lwemczeDk0U0xKdkJQUEM5K0hyektTbUM1ZWUrWHBR?=
 =?utf-8?B?TDFEdmJUb1c2Sy9taTJId1kwMlN5L1hCVC8zenlmQlRCRVh1clF5RW9RUndX?=
 =?utf-8?B?UnJSckxHS1lvZzc0TGxzN2VTb2ZxNGVGUGl5Rm9VRVFVMGd3cU96YWwxa080?=
 =?utf-8?B?N2NBWVFiVG5BUkNBdDFsYUhTWXhjN25vWGFVc1YzWmlIK0N2czlNZHhZekJN?=
 =?utf-8?B?bTJMd1FST1hrZU95WUtQVW13SFJlQzVJRFljZXFwRTh6Ym8rUDJQa1Roa29o?=
 =?utf-8?B?NjJYeHhlSyttbnhSTnJNOG82SEl4UVFTc21Bbnc3aG43SVNMWm4yWER4K3Fv?=
 =?utf-8?B?T2hrQjEwK0IvTElIZVVLUU5MbVNGRGVzQThidnNndFVwaERoMlRxK2s4RDJM?=
 =?utf-8?B?NW4rbU1BT1IzVTh2QmtPaksrVkxMU3Nva0lQY1llUG9tTDZHd1p2UjlGckFl?=
 =?utf-8?B?MCtZOEhmR3dKOTE2RFVISjFZVjh4NjNwZWF2L0JVbW0xKzlUMlVWRlN5MkZO?=
 =?utf-8?B?YWVVd2lPQTJIMFBrZEtzT2gwL0VqWnVpRCtKb3pCdnprQi9MRzNiTWVvUXZ3?=
 =?utf-8?B?a1ZrU3ZjWENaaUFzbGEzN3pleG1iM2x3VXhueFg3cGFwZVhIWUVLQ1BKM0lo?=
 =?utf-8?B?OGsyL1ZORHowUFpFYW5HR3k4YVVZRHJyd2VUbWtkaFNiUGJIZTFsRkhkaWxm?=
 =?utf-8?B?R0pPMzJNSVZFVDVOODBVVDBnbEltMXAxbTdzWkV0eXZUV1NSNjkrUnNSY3Nx?=
 =?utf-8?B?ZWRCenlmQkNKQzZPYkJFcVdSei90VmRjSm9NUzVFNGp5Z082cEozcUJVbExu?=
 =?utf-8?B?d1lSK3BJdmFXeVk5QnhVNTNia2xUUXJWNC8vbVI1M0VLM3dYU1BsQ2g3bEwz?=
 =?utf-8?B?WmxzbGRJUnpVQm5wZzBxaENacjBITUUzeEhpWThHU25QOGtCWXROOVVRa1lZ?=
 =?utf-8?B?SUgyVkJsNkFCVEhjNmZ2Mm9qNjA0VEdDY1hRc3AxVmlZSnYvaFRWNDFPOW1I?=
 =?utf-8?B?MWZoNEhCYi9BMlUyd3NWN2VOcTVUaW9FNE9SNEVCeXFaQmw4d0xsSlJjUG4r?=
 =?utf-8?B?eWp5aDRGSlZTdkJyRlF6REJUNlVKeUpydURUK1ZlUnZYYk9LZXQyOE9VSDZW?=
 =?utf-8?B?Z1ptaWJmbU5ZUjVuT25JbmVqaWJlQXBVUmI0MjZTcTQ2TGxDaStCN2JGYXli?=
 =?utf-8?B?bFFCNFpMUG5XSmwwQ2Q4QlVoV3hQb0pvaHRRQUp2eW5FS1BsNWhIaWpjWWRj?=
 =?utf-8?B?Smk4TmNsNUhyK21jUk1FS1k0NlhHV05tdGlCK0pMN1BtaVRPVTJKZ1BMQkl0?=
 =?utf-8?B?V1N1SE9hRm96dFBKVVBGTm5yT016UUNZSGpHRVoxZ3AwSktuamo4ZHNjNjIw?=
 =?utf-8?B?TUFZWXpwUzl2b0NTUzhZdW9aQlBoREVEU0JNck1sWERDWlB1azdIMnRzclRx?=
 =?utf-8?B?R3R5OWoyRXpOYVdUK0R6RFhlUzVYNGo5YjVNb3hyWFcxZU9rdmMwUmt1ek5K?=
 =?utf-8?B?YkFxbU1UQmJyQzlIUURkbGRMTWNENmdqT2hGTUJUdURaWkpPc1Q0RXE1aEFE?=
 =?utf-8?B?b0d3N1hZRldKalVzUS9DeGszWVFVS0pIQUt5TTRYNG1qMmk1WnlRTXdTdlVN?=
 =?utf-8?B?Wldta0J5b0E5Sk9yZis3SUV3ckVEUmJaOXNWSHYvdm80QU1QSUVQVVVST21L?=
 =?utf-8?Q?IQXVVXw3DEo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2FaeEdkYzRSMmpOcUxBNXBzZ3o1eStFRG5RRGNMMHQ4bWhxUHdvR2p4cGQr?=
 =?utf-8?B?ajZ0TDdDZjVNNEpORkhHVEZmbk1pbGlaRGlHb1M2WFJRM2ZYUFVXZHJ1QXR1?=
 =?utf-8?B?bTlWdzBzdzVOUUd2MkxwcEdWTytyaithN1JWNVdGS1dVUUg0aWR2U0hEcHNq?=
 =?utf-8?B?blNSRDRpMm51Y3VlZ1FiUG1WTmFDVEs4L3ZTOEJhNzk4a2k3MzFMYVE4REho?=
 =?utf-8?B?YUNTYW5iak5WOXNnM2duVkdHMTZTWGx4VlVGOXZvTzlhMFRLclNzQ3duTXho?=
 =?utf-8?B?bnQxYlJnWlJVVEwyR05mblUwK2pKWlR1WXRtMkdqZmdUa2V4U05iU2Z1VnNn?=
 =?utf-8?B?eURzVjZIU3g5NzVJS0VGV1lVVWtEOGVWTVhPNmMrekhUeW9mTGFQWmN5ekhx?=
 =?utf-8?B?T2tDdnkvanl1eHdabE43Y2R0NEJuUGlaYkZqR3hLVHRMeFJLNDJMdW5xcTNO?=
 =?utf-8?B?T0pKeitsSW5qb244ayt4dXJwbEhvZjRlQXQ5czNZM2hhcGdnWURuY043K05x?=
 =?utf-8?B?REZyTmQ2Nys2S0lXdlNtVG54dEpLYmRpeFhVQXlwYnFCTGtBM1ZFc0EyVTZj?=
 =?utf-8?B?TWo5eExhM2hoQW1CcG9zVmhVbmRraFFMOGNncUNFVHV3MkVxZzNKQ1MrOGlY?=
 =?utf-8?B?ekp4OWk2VkkxVHR6djIwNmFLOEUySC9lUFdjbWNRQWVOazdiOHhMRWwwcUlK?=
 =?utf-8?B?WTRPNXgxSWJERmNVL0x6Uk1POTJpNjZvb3U5Nm42aHVVenFoWGZ1bTc0UmNX?=
 =?utf-8?B?Z3l3aVgrRWNvNWMvak9SQmZRdlBXNG8vNURCUElUdVh1Znl3M3VRVzB5Ulll?=
 =?utf-8?B?K1ZHZjJtcm1xUW41REtrOEw5bmtTcVRIcFRueXZjV0FRM29XeDhtcnkzYUR1?=
 =?utf-8?B?Y2VxYW52VXdKMzZDM0p5WWZhR3R0UFBnTFpYM2NMLzRNcHNMQmc2TTVlWWZW?=
 =?utf-8?B?Zm1yNFhIMzZRYXNjaVY5Y3l2RThRZzlTbWxPWkQwbFpkZ2dRcGhBbDdacmE5?=
 =?utf-8?B?M3BmMDI3eFBYQ2svOVA4MjB0UWNHYmxDSmZ6cUNGdjVXdWdEQmsxTkxhTTdX?=
 =?utf-8?B?bEQvMnFnR3dpQ2xOem9NTkxNWURCRWZOTUl5WEMxL1hJR3pqM3VJWXVMZCs3?=
 =?utf-8?B?a0lYbjgvRk05Y3VWdGUyUVh5TTlyT3BkaDdEcVdadzU3R1ZuVGxGd2p4OWNH?=
 =?utf-8?B?YmQrNjVWNkk2QWZRRDZEOXZFalQzVytaN3Y5RjJtSk9BTDFqeFdTUTlyamp1?=
 =?utf-8?B?THcramNCbUdrVlpXb0M0bXFhelVvOE1wbSt1MlZ5eDI5VUJ4M1dNN1BCYThq?=
 =?utf-8?B?UkI1OU9tOXhjOE9mWHdXYlpoTHhRTFE3RXFCU2IrM0kzRDUwWSttYXZYenZH?=
 =?utf-8?B?T09JR01sVzNqRTlIWTlmdWxzSkNDeDdJem1wT3ExSnJKRWx0TDJlWUt1NjlC?=
 =?utf-8?B?eDZoNXVod3JrNFFQamNMTkVpN1pDeDVQVnJYUHBkMjBXTTRJUmhkcmdQQTR0?=
 =?utf-8?B?L0xFVjhBSzJJV0JkaHZjbU9GcmJzaDFPbnpkVFhRamx2aUtscVVkdFpGc2RF?=
 =?utf-8?B?ZmdWRGdHcnZCVXJpaHVkNjNzZzZ0UGZDMTkzSVJPNHhTN2lvZUNJS0NVU0d3?=
 =?utf-8?B?bnhSRENqNHMrRVNjZVAzTi9LWS9EMnNRNU1wRStzcnJMWWhsVG85MGJVaU8x?=
 =?utf-8?B?ZVVrQ3l1VElWa29Xa0dXdXdJQ1pRbjh0WEdFcFJlNWZPaktxVDVzeEdLS2Mv?=
 =?utf-8?B?NjVnV0JQY1czNDJuS0VQaDBXck5uRkpFeVRxS1RxYUtJS3dxaE9LNVF5dzFT?=
 =?utf-8?B?cXlkODg3aHpxem4xK0Uzb2owZlUvTkZaNFRJc3VXOHFzU1hzbkhRY3JSU3Bv?=
 =?utf-8?B?L2ZvQ012V1NFaFpwNDgvOVhMRUZweHlhSEdHY290RTg1ano5a1BtdlU0WFZ6?=
 =?utf-8?B?MG54NWkrcEpMelFsT1F3cHFobGJ5dzdxVk5TaXlHcjNwZ29TZUlUcWUxUWh5?=
 =?utf-8?B?aTNBb2psV3J3R2REOEpKZGc0LzN6QUV6T2dTbGtjcElJZjE3L2VEb3FMRmV4?=
 =?utf-8?B?TUtaeGh1c3ZwenUyYUNoUzZWSjVQZEIzN3BQV29LNjd3Nkh5b0RObjUwV3Fw?=
 =?utf-8?B?WTRRWXI4TDFXMHdtbmZBVldFbTNVL05iNWZyVVdDUmlTaXNNVmtuTHg0cmtM?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c22c14b2-4bf5-4b19-5995-08dde59db159
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:12:40.6803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkttDLC2vvFnqK8iEEdqUSXXyqlJTLeiZSMjbTYbj7QXwGjxUU5E04MHzkDqOuUEuyYscLsMUHlVhQb17Um1hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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

On Wed, Aug 27, 2025 at 04:46:58PM +0200, Lis, Tomasz wrote:
> 
> On 8/18/2025 7:22 PM, Matthew Brost wrote:
> > VF resume
> 
> VF migration
> 

Yes.

> >   requires jobs to remain pending so they can be replayed after
> > the VF comes back. Previously, LR job fences were intentionally signaled
> > immediately after submission to avoid the risk of exporting them, as
> > these fences do not naturally signal in a timely manner and could break
> > dma-fence contracts. A side effect of this approach was that LR jobs
> > were never added to the DRM scheduler’s pending list, preventing them
> > from being tracked for later resubmission.
> > 
> > We now avoid signaling LR job fences and ensure they are never exported;
> > Xe already guards against exporting these internal fences. With that
> > guarantee in place, we can safely track LR jobs in the scheduler’s
> > pending list so they are eligible for resubmission during VF resume
> VF restore / VF post-migration recovery

Yes.

> >   (and
> > similar recovery paths).
> > 
> > An added benefit is that LR queues now gain the DRM scheduler’s built-in
> > flow control over ring usage rather than rejecting new jobs in the exec
> > IOCTL if the ring is full.
> > 
> > v2:
> >   - Ensure DRM scheduler TDR doesn't run for LR jobs
> >   - Stack variable for killed_or_banned_or_wedged
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec.c       | 12 ++-------
> >   drivers/gpu/drm/xe/xe_exec_queue.c | 19 -------------
> >   drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
> >   drivers/gpu/drm/xe/xe_guc_submit.c | 43 ++++++++++++++++++++----------
> >   4 files changed, 31 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > index 44364c042ad7..b29b6edd59e0 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -117,7 +117,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	u32 i, num_syncs, num_ufence = 0;
> >   	struct xe_sched_job *job;
> >   	struct xe_vm *vm;
> > -	bool write_locked, skip_retry = false;
> > +	bool write_locked;
> >   	ktime_t end = 0;
> >   	int err = 0;
> >   	struct xe_hw_engine_group *group;
> > @@ -256,12 +256,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		goto err_exec;
> >   	}
> > -	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> > -		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
> > -		skip_retry = true;
> > -		goto err_exec;
> > -	}
> > -
> >   	if (xe_exec_queue_uses_pxp(q)) {
> >   		err = xe_vm_validate_protected(q->vm);
> >   		if (err)
> > @@ -318,8 +312,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   		xe_sched_job_init_user_fence(job, &syncs[i]);
> >   	}
> > -	if (xe_exec_queue_is_lr(q))
> > -		q->ring_ops->emit_job(job);
> >   	if (!xe_vm_in_lr_mode(vm))
> >   		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
> >   	xe_sched_job_push(job);
> > @@ -344,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> >   	drm_exec_fini(exec);
> >   err_unlock_list:
> >   	up_read(&vm->lock);
> > -	if (err == -EAGAIN && !skip_retry)
> > +	if (err == -EAGAIN)
> >   		goto retry;
> >   err_hw_exec_mode:
> >   	if (mode == EXEC_MODE_DMA_FENCE)
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 2d10a53f701d..6f901139e06e 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -816,25 +816,6 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
> >   		!(q->flags & EXEC_QUEUE_FLAG_VM);
> >   }
> > -static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
> > -{
> > -	return q->lrc[0]->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc[0]) - 1;
> > -}
> > -
> > -/**
> > - * xe_exec_queue_ring_full() - Whether an exec_queue's ring is full
> > - * @q: The exec_queue
> > - *
> > - * Return: True if the exec_queue's ring is full, false otherwise.
> > - */
> > -bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
> > -{
> > -	struct xe_lrc *lrc = q->lrc[0];
> > -	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> > -
> > -	return xe_exec_queue_num_job_inflight(q) >= max_job;
> > -}
> > -
> >   /**
> >    * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
> >    * @q: The exec_queue
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index 15ec852e7f7e..6ae11a1c7404 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -64,8 +64,6 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
> >   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
> > -bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
> > -
> >   bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> >   void xe_exec_queue_kill(struct xe_exec_queue *q);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9e4118126ef9..69ed3c159d10 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -837,30 +837,31 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
> >   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> >   	struct xe_exec_queue *q = job->q;
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> > -	struct dma_fence *fence = NULL;
> > -	bool lr = xe_exec_queue_is_lr(q);
> > +	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
> > +		exec_queue_killed_or_banned_or_wedged(q);
> >   	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> >   		     exec_queue_banned(q) || exec_queue_suspended(q));
> >   	trace_xe_sched_job_run(job);
> > -	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
> > +	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
> >   		if (!exec_queue_registered(q))
> >   			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> > -		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> > -			q->ring_ops->emit_job(job);
> > +		q->ring_ops->emit_job(job);
> >   		submit_exec_queue(q);
> >   	}
> > -	if (lr) {
> > -		xe_sched_job_set_error(job, -EOPNOTSUPP);
> > -		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> > -	} else {
> > -		fence = job->fence;
> > -	}
> > +	/*
> > +	 * We don't care about job-fence ordering in LR VMs because these fences
> > +	 * are never exported; they are used solely to keep jobs on the pending
> > +	 * list. Once a queue enters an error state, there's no need to track
> > +	 * them.
> > +	 */
> > +	if (killed_or_banned_or_wedged && lr)
> > +		xe_sched_job_set_error(job, -ECANCELED);
> > -	return fence;
> > +	return job->fence;
> >   }
> >   /**
> > @@ -926,7 +927,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
> >   		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
> >   		xe_sched_submission_start(sched);
> >   		xe_gt_reset_async(q->gt);
> > -		xe_sched_tdr_queue_imm(sched);
> > +		if (!xe_exec_queue_is_lr(q))
> > +			xe_sched_tdr_queue_imm(sched);
> >   		return;
> >   	}
> > @@ -1018,6 +1020,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   	struct xe_exec_queue *q = ge->q;
> >   	struct xe_guc *guc = exec_queue_to_guc(q);
> >   	struct xe_gpu_scheduler *sched = &ge->sched;
> > +	struct xe_sched_job *job;
> >   	bool wedged = false;
> >   	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > @@ -1068,7 +1071,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> >   	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> >   		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
> > +	xe_hw_fence_irq_stop(q->fence_irq);
> > +
> >   	xe_sched_submission_start(sched);
> > +
> > +	spin_lock(&sched->base.job_list_lock);
> > +	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> > +		xe_sched_job_set_error(job, -ECANCELED);
> > +	spin_unlock(&sched->base.job_list_lock);
> > +
> > +	xe_hw_fence_irq_start(q->fence_irq);
> >   }
> >   #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
> > @@ -1139,7 +1151,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
> >   		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
> >   		set_exec_queue_banned(q);
> >   		xe_gt_reset_async(q->gt);
> > -		xe_sched_tdr_queue_imm(&q->guc->sched);
> > +		if (!xe_exec_queue_is_lr(q))
> > +			xe_sched_tdr_queue_imm(&q->guc->sched);
> >   	}
> >   }
> > @@ -1197,6 +1210,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >   	int i = 0;
> >   	bool wedged = false, skip_timeout_check;
> 
> Maybe a comment here would make sense? ie:
> 
> /* Timeouting a LR job could signal its dma_fence after contracted max wait
> time */
> 

That's not exactly right. LR jobs have there own cleanup worker. I'd
like to drop that in a follow up patch but that is a bit of a larger
rework so left it out of this patch.

Matt

> The code itself, LGTM.
> 
> -Tomasz
> 
> > +	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> > +
> >   	/*
> >   	 * TDR has fired before free job worker. Common if exec queue
> >   	 * immediately closed after last fence signaled. Add back to pending
