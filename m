Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B08606A331
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 07:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f7py1G27
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D8610E03A;
	Tue, 27 Oct 2026 07:23:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CD010E03A
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Oct 2026 07:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793085778; x=1824621778;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SnSDpM0jv7rDPdTJhNzz3GKC89CVSGuN6yEuHU43YU8=;
 b=f7py1G27KsT6Lxw36ZMemffu7PbK4g6pp3Kn9+1Fwuyqa5KTE6bP8cSr
 6U6hxlyX//qZXH4YhbQRs/isQCO4XOwOQmQKvIveCI0gnVbCyFgMi7Pj6
 Kcg06fs1E0+HQiAawBTiJF4JP/80wk9G8vdp/KKfwKBuAn7JhYW19i1rM
 U/x/BlVI07W9zxqcEMba9vzs2GF5iSsMZUaBozbI1DjNTtJZYeHI9u1Sk
 fGbvHrD3xeXw7SJuxpzBhZOtf56km4oPZcrBl2pjpnhskbHhsHY9PxDEd
 hiXHW4nI0uS6iknSAASATQBz7Lk4++oSJWQ3iXKycAxp07GsD7LIvuHTV A==;
X-CSE-ConnectionGUID: JP0tDTJsRa2pniLwJ6pa5Q==
X-CSE-MsgGUID: MvsVXphgSXS7RlkBX8Xk4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1654563"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1654563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:22:58 -0700
X-CSE-ConnectionGUID: ncPiMQOGSS+Y1KEwUG4f6A==
X-CSE-MsgGUID: nowT0gjpR26iIPhESN5liA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4624918"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 00:22:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:22:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 00:22:57 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 00:22:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqr4nTqJ0w33Ec3GY2EnUjlR8Q3OyqQ25LUn2bvtmusuIME2LIvADbStohM1CpGt5TNm4bWDDf6KR/SwJsVHKQaKKDXqDbWUyZNrNB1Xh/ShSgpRSp8yOnVM0lwoMMQnSDCIdCngKsEe+XOae1HYiQqeOGzs42d9pcx1QxTP4okqQWhtSTc9iRglont+IRYpSsRWkzw0B+fPdbSSRqmhrY7gdILzDwiteEVlV+RSoXI9kuyH7WrNI/1us/52bZC3Td1SyVtYKoab2Gm30EXXsYzCL8hyIWWg9VSgK4k38ZdTaspNSZWsqVlcDJvt/KCMJp6WxGzSfOjEaYWTZODhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bk/Zvn2HLLBmEwaD0JGFoTwKl3FGZ4+2rFQUDpPv3k=;
 b=ajLh29OdK0Zy4GHRS6+oJ58sx4EqrfyU+QQEwxnmUxUEdYZGqbsZo42fKpNqPcsthbWMS9cbvXMTyJI40s7esOMOsI84vSfMAp03iey5xfcPR9TcJLgFM4OKNf9GBBcP2tgMzY2HS/UUM4TkxII8WCAL69YlEQjGS6/i0+Uj4QNKmmxZuHWorMIVrS7xqZa+RDmf9Q8HoBzRNz7gUusiqfn8prUI0JpIpCu5dRq6NC0sP5E6bjveXe16ORcPNiCFm+yd9MslkJB2vmDjw2VMuSGMTU1Mn0jU25NZWOAzLZSjSQX2uhB4YC8tNpt2JFHHkf5x9QsyxNI+NOYrwMLEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 07:22:49 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 07:22:49 +0000
Message-ID: <4c695d89-327e-42a4-a24e-4a89430e055f@intel.com>
Date: Tue, 27 Oct 2026 12:52:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/xe/cper: Add driver error classification
 definitions
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261021162508.265700-7-mallesh.koujalagi@intel.com>
 <20261021162508.265700-9-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261021162508.265700-9-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0138.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::18) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cc4d6a-b073-4c9b-90c4-08df33fb1b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|18002099003|22082099003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022105027099003|261022075727099003|261022113327099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: fGvnFcwfn/LWDtEAaW4vZtxb/AEeQtJiLRK7k1TmlgL4Y0ILSmB3ee/LNZ/0gsKb7/5nt/waHXUcvpM1lOKzPWm++5DE+fZ8ptK8QmB7XufHuFejiUxPEZMQMjvC7jnHkvNHkoxqZ0L4x0BeFF4YrcCnxjgZaMLqkvAFrIA6JI8obJQUDKYWy/ftRYIOhhDsxnaGZYYzUWWwRmpXVxKeKMsREbMigSzPKW7BFGP9pos1ENfhv4TMbDC4NpLmPc3YZvWFylMH3IBkuJ+SeOBij91jYrEDgiIPqzcEWYMIGzIkfMfZSZDOIVoxuoD+7O9XZyRIRFRWu8FdbnFoJ2ob6PK0/5Z2ViduivrSW5FK9lGkWzpvhOgkUTKLTbuXfDxfBVaR00nmg9Rwkh0Puk7eBfzGBF9A7ZRPmeeYWRIEhrTRdcWN0bNAfkzF+g7v8R9IRkyVjhZgNicIluYdbnnl62Jp5Bmip7YctgwAVy7dCJ2sXsXptATX15MHf8A5mb8kbFQAjLvnVWcl3uBeCn5GDhZimXb643LAKZvgmPO423jn5/2n6KJZnVKO0vbn1a4qsIlyEMpcc24VmuU0GXAYKDurfYIKiXB+CRtoPfJXz4rhGVfJNRZ+vv2JieK3VZQEMuokMATdU12w8GvKiH+cj1ywWPdEvB3Fg6YYhv1nh/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022105027099003)(261022075727099003)(261022113327099003)(261009223027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZklJY0QycHY1U0xUdm1qd2tCdHVKOWx5TExialVsRmF6WmVlM0NlRzJNRE5X?=
 =?utf-8?B?VXN2UFgzWkxwUHBiL1lvSzlNbWd1aWxPSmUrZWdNUkpLczJmTVcweU1TT05y?=
 =?utf-8?B?c2lwZUFhM0lTSWZjK1JKSVFNcjhpSE8zUnp5U3lMUThldlBuNDdvT05SOE9Y?=
 =?utf-8?B?S0l5aDA3YTlDVUxBNVVycUhZaU5TS1hOS0gyMTFMeW1OMEs5VnkyWHNETnlO?=
 =?utf-8?B?Nk93WUJNRU5hRDVjWitPaFUzY3V2OVhjbXk2MmJiUVlZSVE4OGFudkZxM2ZL?=
 =?utf-8?B?NFdtMi9TVTVORFRqbkNIa0pQZXZvaTkxYUtSYlhYMXhBTk9Ib0cwZlBzaW5I?=
 =?utf-8?B?ZDdUNjdLWE5yNytqY2NOK21kZC9MSXpxbFVQTHFzTGdFMVFIVVNWdDVWT0Ni?=
 =?utf-8?B?M0hMaFVkdzJnWG9kOFIveXBMR2tIcjdZc0QxczNYb3ZLVHAzRFlkbE5rdktu?=
 =?utf-8?B?ZU85Q2VLTkRBdlpSaVNxMjlIYmd0R2c0RVBPYjVQaGtVRTZBNE1GY0RZQWxj?=
 =?utf-8?B?bDNNVkx0Q2JxblZUeDR3Zm03NENYYk8vaUJOb0dZK29ZaVphSzduWHc5anhN?=
 =?utf-8?B?WjVSSitpOHY3VDAzSllndzRYdTBuTDU3T3FwZENiV1k4dVBUSVljdGdRMGdY?=
 =?utf-8?B?YzBLcW9iaEU3YXlpWExxS3pCZ0dJNWxDeFMya0xKN3ZLL2wwZ3hJOENHYksx?=
 =?utf-8?B?TVl2VlhOSitHSGpWVG85MUhiVFp2eVR4UGU5TnkrOE1tR05teW9qWVhlSlMy?=
 =?utf-8?B?Z2phb1FGOTVoejhKbHEzSmNHK0ZzTytjWndFdHhPc3Y4S3pUUDNzVGMzd2Zp?=
 =?utf-8?B?ZERQTk5uT05OZmZ4Ri9mSERaallpcG4wazhxemovVzY3aGVJaDdVSHBFRWV4?=
 =?utf-8?B?Mko0eWVSMGlhK2VnR0ZSUklnWUNHOHg4eU5pN1lCeExBWHdwdVVhZE9nSENo?=
 =?utf-8?B?UE9FN3ZoL3dGakR3UENGRUZPaGhXelc0OXFTdTZnOFB1dlBXWkx5ZHdhWXAz?=
 =?utf-8?B?QTdyalZrZFVsOXl1eWRNV0RtRDJDTmdHUnB1QUl0YVlhMjNtb3FmMkd0UG94?=
 =?utf-8?B?QkdSRjJiWnBJcVNGa05HMXNqTHZLU1l1OW9IbUFvOTd5aEVPN2RoU0xQWXdx?=
 =?utf-8?B?L05WanhQdlJmOWFBYjJTZjlqb0VtV0haQmI2cWFBWk82Um5kelcyZFlpVG4r?=
 =?utf-8?B?OVVFaU10UFJPOHU0QVZqWUlqZExyNGJMNXZZb0lUa3d3cE5GaldmVElhWHFY?=
 =?utf-8?B?c0VzUlZyYjZpcDVXL3AvV1lodmRUdm9KM21uUkxjYjlHNzZmTzBaV3F0UVVG?=
 =?utf-8?B?eWNCVGM4T0hPUjJzWmN4YzgxRVBEeiszNXViVEEvek43cmlacmhKQVI3N1Nu?=
 =?utf-8?B?NDd1NDJVVzBZRHNnNU1pOG1id3B6dlgwU096MDArYm1KbFZuNHdPTEt1aWc0?=
 =?utf-8?B?TExVRTE1UEpWMEUxL3ljazVKaVJPUFdrdG95MHVsY2pncnZNV2R5SjFITmhO?=
 =?utf-8?B?Ym9DUXlQeEdRK3pYSWN5bFNoQ2NqVXpldzcvUExGcEtDcTlxNTdKYlZ1NGw0?=
 =?utf-8?B?cW9YNFhiL0xyWURaTWo2Qm9TZW4xVDJEQWhtcjMzWEZOazA4Y0xhU2dFNTdy?=
 =?utf-8?B?ZnQzS2pLbjBKdElGMFdrQ2x6MG1qalFrVWk3djhCam1TQTZtVHIvTUxvQkJZ?=
 =?utf-8?B?UjdvZHdJeDhqSzk5Mk1tQ0tZWmJJUGFibWdnTVdQMVRIRzRsT3FJUzBjMzNY?=
 =?utf-8?B?blZUcngvRkplbThBWXl4S0ZiRm5VOFZMakNKakNkUGpjSjY4WUN5RnBnbzZL?=
 =?utf-8?B?M0trVm9lbXhINDMxa0dSVFNEMmdFamRJeGFnaHl2emltUGxySFFrZWhhOXRr?=
 =?utf-8?B?VVA3c2Z5Mk51UG5jNmFZc2hDWWM4WkxUY0UvSGtuUHRPV0hpVVp6SElPVk1B?=
 =?utf-8?B?dHF4NUdzWUdTTnNiWmpkM3NyUnpySUxzbUhUSG8yL1JTMWtqaFdscFhKVnNp?=
 =?utf-8?B?U093RnZZQ1U4ZCsxNmZNSzJHbmRJWDQrOENiQ1VPRlZYd0MxbjQ2Q1VaL1Yx?=
 =?utf-8?B?QVhseUN3UWdZR245cmxKVk5WdmVPQ3FjNis4ZXFCeXd6K0d5OHd0Wk1Qc2N4?=
 =?utf-8?B?OEd1Szl2ZHhSVndKNmVLNG5GR0NDL2t5K0hWemlZVEQ4TGRvTkNIOThsU0c2?=
 =?utf-8?B?R05yWkJkM2lXclpJRFhsd1NkaThWeUJyWHZXRXJWQm0zbHNmVUJ6MmV3Smhy?=
 =?utf-8?B?RlY4WGl6OWFCU280UVQ3SVNUSitqbm9penAzQSt0bDFUaHp5TWNoSXl6bTM2?=
 =?utf-8?B?bUt2d09ET0EvcE45MU02K244UmJ3NGV1K3N5TDFzMHNYNmV0eTFOUT09?=
X-Exchange-RoutingPolicyChecked: V3gyNSjnO2WcvDJMSHyFlqtR8iBcRZlGjQ5aaCjHAkQxWyLdD8h4npTYKm1Dx+EcxtDz7hMDxWDVKkwxjgsw1mnzF0rpp9MOOTQh+4szL4Pdqf1NFzFR3feo5fzl0aYeAfAKiR0GumUooqhPq+DbwxYY9QuYVzYFFarrDb/+nEOFYkMQMt1YL0HuNMGAs2rAfW4Zq8E1r22M2TO2hARRrlkS1QEXGHgQqKZ5k7IMg9fdrnaHsJADMz9w9DJ4BonfXk9LUF8Z6HrhDb0xA38N8/ltV3FiixfqKbUdouqWwc6qHFB8qAUa4CDnDxe1LFnScYo/ahlHVYRUp1ylZk6+vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cc4d6a-b073-4c9b-90c4-08df33fb1b1f
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 07:22:49.5574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJzgzIzmoQtLYZFNwJYIuYirtw5KmgZCdmSFEsF8C2Fttj2dagwA3JTRdILZgOEhSJQ9RtQOrQGHXoanHPkzzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 21-10-2026 21:55, Mallesh Koujalagi wrote:
> Add definitions for driver-detected CPER error classification,
> including xe_cper_driver_error_class, a common union for raw and
> typed access, and the INTEL_CPER_NOTIFY_DRV_ERROR notification GUID.
>
> These definitions will be used for software-generated CPER records.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_cper_types.h | 41 ++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index e0034429e661..5e7bceef703e 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -41,6 +41,10 @@
>   	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>   		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>   
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +
>   /* Section Types */
>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
> @@ -66,6 +70,43 @@ struct xe_cper_error_class {
>   	u8  reserved;
>   };
>   
> +/**
> + * struct xe_cper_driver_error_class - Intel GPU CPER driver-detected error classification
> + */
> +struct xe_cper_driver_error_class {
> +	/** @error_type: CPER severity: CPER_SEV_* */
> +	u8  error_type;
> +	/** @reserved0: Reserved, must be zero */
> +	u8  reserved0;
> +	/** @error_component: Driver component id: CLASS[7:0].TYPE[15:8] */
> +	u16 error_component;
> +	/** @tile: Driver location id: TYPE[7:0].ID[15:8] ('tile' and 'GT' field region) */
> +	u16 tile;
> +	/** @reserved1: Reserved, must be zero */
> +	u16 reserved1;
> +	/** @cause: errno of the failing operation, or 0 if none */
> +	u32 cause;
> +};
> +
> +/* Same size as the counter-sourced error_class */
> +#define XE_CPER_ERROR_CLASS_SIZE	12
> +
> +/**
> + * union xe_cper_error_class_u - RAS counter-sourced or driver-sourced error classification
> + */
> +union xe_cper_error_class_u {
> +	/** @ras: RAS counter-sourced error classification */
> +	struct xe_cper_error_class ras;
> +	/** @driver: Driver-detected (software) error classification */
> +	struct xe_cper_driver_error_class driver;
> +	/** @raw: Raw byte view */
> +	u8 raw[XE_CPER_ERROR_CLASS_SIZE];
> +};

Lets put this union inside header and info structures. Something like this.

struct xe_cper_sec_intel_err_hdr {
         union {
                 /** @ras: RAS counter-sourced error classification */
                 struct xe_ras_error_class ras;
                 /** @driver: Driver-detected (software) error 
classification */
                 struct xe_cper_driver_error_class driver;
         };
         /** @first_timestamp: First occurrence of this error class, in 
ticks */
         u64 first_timestamp;
         /** @sig_id: Aggregated error class SIG ID; set to U32_MAX if 
unknown */
         u32 sig_id;
         /** @error_count: Number of times this error has been observed */

This series is built on top of the HW CPER series, so let’s follow the 
same approach and introduce the structures or their members in the 
patches where they are used.

Thanks,
Badal

> +
> +static_assert(sizeof(struct xe_cper_error_class) == XE_CPER_ERROR_CLASS_SIZE);
> +static_assert(sizeof(struct xe_cper_driver_error_class) == XE_CPER_ERROR_CLASS_SIZE);
> +static_assert(sizeof(union xe_cper_error_class_u) == XE_CPER_ERROR_CLASS_SIZE);
> +
>   /**
>    * struct xe_cper_sec_intel_err_hdr - Intel-specific CPER error section header
>    *
