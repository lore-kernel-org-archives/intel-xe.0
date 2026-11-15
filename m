Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C50606A31D
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XSyQQPgf;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SgmwWXWV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2490D10E8B2;
	Sun, 15 Nov 2026 12:07:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F6110E8B2;
 Sun, 15 Nov 2026 12:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794744453; x=1826280453;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NULSaaNu2od/gkbk9UXypSEz8ClF8/r3RawKaB8vKRc=;
 b=XSyQQPgfM+oZ6ISrgwXXuYJyALR9ENprLbR896ug67clyNcaEVSxZD7u
 CN0oxTa+9OMBg7tg143xEIkwSAqo2A0m7z8W/equ/GrfQLLzZoz4j4r6I
 5B+CGBK+0ciEwcKG6zXcFF5vjpXNpYagJz2KjsPBsSFdc+l5ldx+vPm48
 VNxx4UFY5QQ24T72PQpKGjg0oKIBvJM4Z1JcPkwtAKobqb8rhouJWyK7N
 n59FpocKUKVO6XQPFgynhl0hEwfYfdm2Jd6WEYuC7hOhAgb5kom8hayz8
 e/tIHNQOz0PhaMMlrpjr5JD7E9OYZ67MlBGTtaF80kf8f/4mxmESaBThY g==;
X-CSE-ConnectionGUID: jF2+QegpSTex+r+AJC2gCg==
X-CSE-MsgGUID: 1w51tS4rSkqFeKUrmlQq4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3534657"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3534657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:07:23 -0800
X-CSE-ConnectionGUID: 5vgmAj96TwqqXXjo2ZIfwA==
X-CSE-MsgGUID: aJbUAoqlT/m2eKhC2AK6/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9256131"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:07:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:07:23 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 15 Nov 2026 04:07:23 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 15 Nov 2026 04:07:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOHrGlHhdId7kz9oKBRitxbNRW2uCgJ+BxySxlbgRz89VeJpV38Gvpc9+gYvl5YErM7XJrxoATjWj1RwJt1Et2kggMlbi8VMdfnTMfLaMwPwxBdjUDPT9HTtkh/2uPEiVv4P3KdxQRwOLn3fXAAfe2kLfX+RI81XkWH/bHn2x7lRM7mbrN841hWqO82icQfKfL8LGGqRypGby28dFLn3E54EYvg6AR4gOCJ97LiW+P4bCY/oN8P34xeh3jc1V/QWaP4YIcHw7ucaxXBg9orA6Nl5gU3GlKhCG/F+sZPhH6pWbGi1SI9x7xZGIZ01ybu5bQP6As1EuLyV0xD9S3bsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y4WtmLvguI2LZ7SG3Ex/SPsJ61fi+ZtoATHXBIz0fo=;
 b=y/ZsMe9wOpmU/wpCOEvaIr4K2yZsl1mDRVjxBniwohnoT7JZCQjMqK15YV8FmnsAVGYrgCSXNG/8dZSq3A0daNZhlNGtva28XE6Xf1oRDDHps5GuHh711NPDYg2aYCKydZy0cbMhUgcRHZ3aSZz1OslAMG//kBMIOEgGb2vsBknBUXakEMt5rrIJuV+qTxRPtMBgip/IIKSbIetE8CUVaopHr+PwXZAJ52+/+J2TyoXDfOcWZBz+yDQsJT7rLe/xnaPU3HeZmNydwEkC04FMp0e0HfQrFASVMKesN9aRpiMVZ/Bwv9wmqKWreQg95ZyMqO0tO7vwaLZkJnA3XMk5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y4WtmLvguI2LZ7SG3Ex/SPsJ61fi+ZtoATHXBIz0fo=;
 b=SgmwWXWVVhN4WWX3MZt7KM7LR8voEhafy4UduSfx7ZIKqxtUVmayqqL1//vEqGTtLvzjiOpu26UVwoWnrjVR5eIMbzXbx4fn30fF9/Txi1pGP0c7XY3gx37tbP1oRb+CdlJFpOHgs/5xNoSaeaKZoj6zZ+hhx9TEdTe2J4hZSWw=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by PH8PR11MB9805.namprd11.prod.outlook.com
 (2603:10b6:510:3c2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 12:06:27 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 12:06:27 +0000
Message-ID: <c84dad40-1cdf-4dca-9079-f222d49ccca1@intel.com>
Date: Sun, 15 Nov 2026 17:36:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] drm/i915/dp: Don't limit the Link M/N ratio with
 the symbol timing generator
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@linux.intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
References: <20261103-vlk-64036-dp-symbol-tg-v4-0-6cf8a588b54c@intel.com>
 <20261103-vlk-64036-dp-symbol-tg-v4-7-6cf8a588b54c@intel.com>
 <DS4PPFE901A304F36C9292E8FFF415A3BB4E3682@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DS4PPFE901A304F36C9292E8FFF415A3BB4E3682@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0260.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::8) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|PH8PR11MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: d8dd835a-bb92-4f9f-aeb4-08df4310e068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|11063799006|4143699003|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261022113327099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: A7k5NX51tXC1y5/9khFAs8Je7Cx5/8B0KIlfVt+QdubVfayoMQmsm6wI0YB9vUjO7smZisE9htuN6s3w7U58LpXzUu6ybQCEINAQTqZbWidTpxXk8e5xO4XIC0b/t+qffQ+o02YPCP8x8W8y6pXk7oqxnm7kPpRBIOUjPD2RTxE3cHgK3Dwa55EsdcK+dnQbjOfbbhqwnwIo7qE2OaXEcdikhX+t+LWo8aBTGt+FNfAiuXugqnENgdEe9Nm2Q9S1sWMSYRqhbEIRJwyjlybs0q5XqdIIuvz1k5QBFd5kWPykJOu2vAR9JclR8qFM8J1F7OeYm6WTHya7R6x074kCKvUbRU2By93EK/JNJINGb4rOpIqF/IAO0iuqbrhuiWcqQkqG8lJnLc6erjdUt/epTM/XeSK4JILWXvQHzaPizXBxIrhyFezlaap0fZyTaYO+4oz6LFJAmu6whBIM4SBeDuUBKS3ty4LQEX46y3Asq7FRgyDfxWteqqrqso8kU3GLAB0p9f5btPOA9zjkPHB8b7+sJq4VpPYeK7djI/gNK4bUhb9612Ua982+0UDs0HPIpR8iRX3WNWeGtY1dRHbsVUx4Ju9O+4vpnGQdvNNSVLbo5ZcenNJ3KJu7UQaAmq8G7Q+xN38xcdqlZo/5hxK7VQ/zL0fxkFSouNNHBtn06xE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261022113327099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1RqUWFRa0loeUVRdmlkV01TZDdGd0k4UzBTL1IwbEErYzJtU201RlIxeEZD?=
 =?utf-8?B?ZVJwVUtJRDFyS29iTmlOTTl0bmtpSzE2QTVnOTVUUlpiNjNsTEJNNW5WZW8w?=
 =?utf-8?B?V1ZBM1VteTkyMm90TEE3azRoZng5bFQ2cUR1UVQ3b003b0paSmtLQU1wN0VF?=
 =?utf-8?B?ancwM3I2WkI5VDlLTGh1blU3bkNjODdGcVdCeFRhVzRNM25DSWdMV1RCSXZS?=
 =?utf-8?B?Y3NoOHczOHFJaXF6MTBVTFIzenRMTStSNkEzaWIrUmdSZDlKR0Y1cHB5dmxC?=
 =?utf-8?B?NEVQL1Q1ODI1QjlWQzdaNUJOaEVBSXJEWThkOS9zOUl3aEl1dUJBL3Jya29i?=
 =?utf-8?B?eFVnV2hIcUVDc0Z1NUpuUS9ISVV6MkFYVVltTHBQUjE0VW94YlA5ZlVEZ2E1?=
 =?utf-8?B?bkwzZlZvdmJSMjU0YlVTU29FTEYrTmVJSmEvYkNUd3h0MXI1ekVKalpoRmRB?=
 =?utf-8?B?YlljNGR4ZzBtVUkwRmlqL2lHSVRzazFxQ0QwTUpPQlo5MUhoK3dkT3RSdTlJ?=
 =?utf-8?B?N1djYU9jN2lYaXdRaW43eHpIS0FiN0RmRWtwRTZuN3pHMkpXUkh4eU5ZUERS?=
 =?utf-8?B?dkNPNEhUdjd0OGhGMmxYZVhwMml2TTB0bnpjTTM2eEFuV0JTeEUvZENKY0lk?=
 =?utf-8?B?YVlXZGs3dEQzd3NXRnZNVm4rUmpwZFZiOG1VcmhJQmxsbEFCWkM1R2Q2UFRK?=
 =?utf-8?B?NU9sR1gydkJXMnh5L09YdXVMTHNSSkFPbWFRR0ZxL3FTZk5QYnlLb1VWZVhK?=
 =?utf-8?B?VlBCNkNkQlU3bFJUVnJpRkdCV2RaSWt1RFFhYkpIa0xCVUVVTkY0S3l4WWRZ?=
 =?utf-8?B?ZWkxbmVxYkdZMm5IQ1RvazZQZnhvbmVmRDJZWVpHSHZmV2xDOFU0QlVxK215?=
 =?utf-8?B?enVLVTFWQm5TVnM2TlZydFhJd1lRMEtpVThrdnp6UWQyL044Tm5qaEZPVm82?=
 =?utf-8?B?M3ZZenhQRHNxa1FtSjJUTlgxRjN6MnRDYzY3c1A5aGZ4ajJINnBSWFNIbFdo?=
 =?utf-8?B?OFNqd1BVQy9NcXhvblBzeG4zZ2UwVTMyMnNSTExTWGk2MFNQd1NkVlFrcE1F?=
 =?utf-8?B?VVFhSENuRXhXSkp0K1lKZUFZR0kyekYxOWJBQWFCWUQ4eUd1ZW53RGRoRXdJ?=
 =?utf-8?B?VStSV2xQMkhIOUpsbUc2T3RlU2hyQXBkK0Z2VExpVTI1a1l5bXI0cFBMS1VP?=
 =?utf-8?B?RE1ZOXlXOUFzUnZ1T3RGNVlLRGI2TUloQkNVWlJ6aXJVVmJsYjNJK1NQaUx2?=
 =?utf-8?B?U1lnOFhBUWFMRS9MSmRPS3RVTUJRZkttWFJJMExaUzdKMll5VFZJMEllQ0Zr?=
 =?utf-8?B?ZzBUMG13Wms1Rm16TDBiUjFBRHRpbXNPOWhYekhHNHlRT2Y3RWQ1WktkRm9S?=
 =?utf-8?B?N1preHI0QnFwd0ZSZmRvZXg3QUNHd01PeEhFc2RzL2hDbTZ6c3B1ZWY4UDVl?=
 =?utf-8?B?UDZwcHFhejE3emErRXVOUU9mcGt3a0VlMXRZaFc1QnlSKzVKdDU0OVBpUXpC?=
 =?utf-8?B?V0FzWkpna2h6RkUwUUVwRWNQZFNpZVA2M2hLaXBGZ3R4Nk0rd0xESzNwbjJk?=
 =?utf-8?B?UGMyNVpFMlRnTGpIV3dxZEhVQ2lWdVlGMk9rZmhmNFlWVzlVVWd4UFp5S1Zm?=
 =?utf-8?B?aERjWm1RY1VpYmpMbXlOZlNzcGU4dUQyRmZLazAxejhheVFXSWhEZ0w4Rmln?=
 =?utf-8?B?VDdMZEJsRkVUSDExczJKZlh6QTM5c1dKSzdWaVBDNGxHL2RoNFhYQS8zOEtX?=
 =?utf-8?B?c2JXb3QrNFdoR2lUK0JFajZXc0tGckQvNlNQa2h3Y0RqeTI3cTA2ZXZLdDE0?=
 =?utf-8?B?T2VJeGhCRXUxNHNUQ1RSNWlzaENpRzk3Z1kveWNxWG9yTHJqUkNKcGFHY3Jz?=
 =?utf-8?B?VUhtTVhpc09EYmVOSjJTcWJCQWNIVS9tZDU2YTk4Mm5mWTd5a0k3bTlxZ3Mx?=
 =?utf-8?B?WTRrYitKTndMZHZTY241RmJaVk55YWk1UWJpWExWaHNmV2d2azdKMTM2RFFj?=
 =?utf-8?B?OGltUmdNNVhFemJqUVVtcWszK2tKQUVwWGZsNGZRcnBPbDRVY3Z0TE94dXdi?=
 =?utf-8?B?RlRsK2poNmErTTF1dmdLMFFTWTBUd1RXTWt1aFlCQVljS1E0N0hhckNIbGhN?=
 =?utf-8?B?VGw1YUtHeWdVM1NtWWdaMVBJK0tGb1JxTXRNRGwyNG5XQWJWZnh3eXFGeHUy?=
 =?utf-8?B?eEZOVWhzRTRSUGZVVGxNV0UwajF1OTdjUGhZQVBYS1JLelJDbzhmbmRMWTlI?=
 =?utf-8?B?Unh0dlFBQW01R0ZMeStvc0NFNDhicUFEU1NCSGRIQ3lWVm9wUXRsVGFCTXIx?=
 =?utf-8?B?QUhkNWpOQlk3K3lhNEszYzRVclVyWWprTHFKR1NkNVZJcURNQXJrWXVoSS9S?=
 =?utf-8?Q?RKVnVR/lACbIKfUU=3D?=
X-Exchange-RoutingPolicyChecked: xTxNFFcb1LNY6fcK4gcfcecdF+SbjWuuGuM+eNYkVC8IjuT9ZfqKUye737O2JYCS7jiEc/PNgK0KRiCFFzmwEKCjKB6LbEa/uwYt5jphXyEY1gxt/Hk/UWVL6Kf6+3XMfT9pWGi5BQJCnnXcztslzh4j8+9sltFC9hmHmR7H5nTN9LgxquMTFnDHrGTc4LlxtWPtZiTCkiwZp+FFhFRZPcZ8zyPPpqQdmgZb8WUZDKxudxkjJO6KSrHml+FT7n/AXnn/gg6bvpA18gfUuJsVKYpGl7DAtDmbVVU/vCgxiJZPUpSzUeloftEYgthB0rJMOxXbZJCc4VmVerpbE8LW/g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8dd835a-bb92-4f9f-aeb4-08df4310e068
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 12:06:27.6125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HSYEKpFgS+/kfrn2Rh8iwVQcplUBGcrF48ejVi3pVinx4j8w0WP2EEtizh9sqFfxb77SmuUmZwMKYTgCU7NbXxq3OB2BeDfq09xUU5AA8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9805
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 7:00 AM, Kandpal, Suraj wrote:
>> Subject: [PATCH v4 7/7] drm/i915/dp: Don't limit the Link M/N ratio with the
>> symbol timing generator
>>
>> The limit on the Link M/N ratio only applies to the pixel based timing
>> generator, there is no such restriction when the symbol based timing
>> generator is used.
>>
>> Bspec: 68922
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_dp.c     | 17 +++++++++++++----
>>   drivers/gpu/drm/i915/display/intel_dp_mst.c |  4 +++-
>>   2 files changed, 16 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index
>> 788c16df9801131294c73420c2c0d4d3ec848310..a8fa0809079e8b3f6fb574cfb
>> 73fb6bb8b019cc3 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -1277,8 +1277,12 @@ static bool intel_dp_has_symbol_tg(struct
>> intel_display *display, bool is_mst, b  }
>>
>>   static int
>> -intel_dp_get_max_m_n_ratio(struct intel_display *display)
>> +intel_dp_get_max_m_n_ratio(struct intel_display *display, bool is_mst,
>> +int link_rate)
>>   {
>> +	/* No Link M/N ratio limit with the symbol based timing generator */
>> +	if (intel_dp_has_symbol_tg(display, is_mst,
>> drm_dp_is_uhbr_rate(link_rate)))
>> +		return INT_MAX;
>> +

This relies on the symbol TG always being used whenever
intel_dp_has_symbol_tg() is true. Unless the suggestions made on patch
5 to incorporate the symbol TG in the link computation path are
adopted, the pixel TG could end up being used without the Link M/N
ratio check.

>>   	if (DISPLAY_VER(display) >= 35)
>>   		return 22;
>>
>> @@ -1308,7 +1312,9 @@ bool intel_dp_can_support_m_n(struct
>> intel_display *display,
>>   			      const struct intel_crtc_state *crtc_state,
>>   			      int pixel_clock, int link_rate)  {
>> -	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
>> +	bool is_mst = crtc_state &&
>> +		      intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST);
>> +	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display, is_mst,
>> +link_rate);
>>   	enum transcoder cpu_transcoder = TRANSCODER_A;
>>   	u32 link_m, link_n;
>>   	int m_n_ratio;
>> @@ -1331,7 +1337,10 @@ void intel_dp_check_m_n_ratio(const struct
>> intel_crtc_state *crtc_state,
>>   			      struct intel_link_m_n *m_n)
>>   {
>>   	struct intel_display *display = to_intel_display(crtc_state);
>> -	int max_m_n_ratio = intel_dp_get_max_m_n_ratio(display);
>> +	int max_m_n_ratio =
>> +		intel_dp_get_max_m_n_ratio(display,
>> +					   intel_crtc_has_type(crtc_state,
>> INTEL_OUTPUT_DP_MST),
>> +					   crtc_state->port_clock);
>>   	int m_n_ratio;
>>
>>   	m_n->bypass_m_n_ratio_limit = false;
>> @@ -2815,7 +2824,7 @@ intel_dp_compute_m_n_ratio_limits(struct
>> intel_dp *intel_dp,
>>   		drm_dbg_kms(display->drm,
>>   			    "[CONNECTOR:%d:%s] No link config with a Link
>> M/N ratio <= %d\n",
>>   			    connector->base.base.id, connector->base.name,
>> -			    intel_dp_get_max_m_n_ratio(display));
>> +			    intel_dp_get_max_m_n_ratio(display, false, 0));
> 
> Just use crtc_state->port_clock instead of 0.
> 
> With that fixed LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
>>
>>   		return false;
>>   	}
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> index
>> 81ac454603603df42db477ddb26cfb2f620dcfea..fe9cdf771f481fc8a8b8f3f29e4
>> a24aa53a53f94 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
>> @@ -1570,7 +1570,9 @@ mst_connector_mode_valid_ctx(struct
>> drm_connector *_connector,
>>   					   min_link_bpp_x16,
>>   					   bw_overhead_flags);
>>
>> -	if (!intel_dp_can_support_m_n(display, NULL, mode->clock,
>> max_link_clock)) {
>> +	/* MST always uses the symbol based timing generator, which has no
>> Link M/N ratio limit */
>> +	if (!HAS_DP_SYMBOL_TG(display) &&
>> +	    !intel_dp_can_support_m_n(display, NULL, mode->clock,
>> +max_link_clock)) {
>>   		*status = MODE_CLOCK_HIGH;
>>   		return 0;
>>   	}
>>
>> --
>> 2.25.1
> 

