Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759BF606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ByvsmRkq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=d94PAoF+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F6210EE24;
	Mon, 16 Nov 2026 09:45:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59B610EE05
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822342; x=1826358342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=eMqWJIOzPuzZXYGmh7amabqnSYW6bUd+04gtD6JpCQI=;
 b=ByvsmRkqp1wUVa+pgHHQ9flTFSBpADBwzRtfegoRMaJV89ooGXppnPb/
 vZ0JNVoeWrB4+Qse0REYtyTF3EYAakg9gfxQK/ELlDVEoovG7YEDQdBZQ
 XtghZxujphRzPJ9pdDU7Im0n6LOOvFzWEdY033+Bf3E9jMawzd15sKYF0
 tIf4HDjQGzfAaTeYPFYfSC4NjSJVvFl07ityZ6wokBUOolyauBWjx1l0/
 bUMDJVcMNEtDfYaTM36xEQoC3XpYd3NFNwMw+3he09RCH4ok/kFSbrtJi
 70IdGSi45ut6SHUY6sS/TiFkyMkXkWgwVovpVlifjwrLWn8EO0h2Oc+bd w==;
X-CSE-ConnectionGUID: ZmnXGfzGTAuzUHcIKzJAgQ==
X-CSE-MsgGUID: F92YNZXWR56zJFMp4R4qWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3564798"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3564798"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:41 -0800
X-CSE-ConnectionGUID: km0alOHNQHGg4YSbkSqSWw==
X-CSE-MsgGUID: TGfLofTaTwm8uoFsQiljIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9854644"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:45:40 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.59) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVlw9TrxyJemNsfk+sceChD31rphptzKhL1b7GwaDTAySgtS6Q58rTdCCZeWzIx03wLAg3sdGLIHCn/C35e8rrLoj8ZsZJ/oaVKGaDA83yaXaYiMJCHGzqiKPNJMmZoQPikRUscP29zKD7Rq/ZMcysQaTztsQZJIo17y/IHy4BTwDg7SQViCAyBB1QJzEeE/hOD03tsyhk707Bg/WV6iOhuEYhUlIbbo7oELc1BIGJnTt6YSJshpBqt6itMgULemQ5LnLhkVy3IElegVvYbo0AwVAjvpteFGBexdSDzCdDxLJ2/ZQawetP4hwf7ydmUwjYQBFg1WW2zrFiDECunMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdkEulCYOHtt6TWk0cnP2ZlAZ01zZOINDQ/5a2DHEg4=;
 b=S1smOSii/jBW6f0VOHTb6PStcyUakLjotfHi1lgAhK/Bb6myznmMatAkQHZKsG5sj1nZ6dzmn2P15LjOZgFfbieTuiLXD8rOdVZFBaSP3xnFpx+zcIjG/cCOOt5Nye8xB8Bmuhhjx+h7ff+6BwTY+UMllKWAvudJx/sNEDRFIopLYQ99iiRmY8Jf8xJDTf1bBf/paavxbIxKzBqOaL3hMozIiXFxgMXkQh7/HDjVlTUxWn8XOWVf4qMrLuSqfvYJXHRl2y3OmNtwWxIaom1Y83YKmkj0sZ11NLrcpagPciOgw1sYIWyjag61v+3Z3qYQQYBLHQTHsaw3lA+kjlEvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdkEulCYOHtt6TWk0cnP2ZlAZ01zZOINDQ/5a2DHEg4=;
 b=d94PAoF+l25p9Fw7+1VQv2eawjqm0Ixs2B6tfxUNDsuMdPDVO2/ojzvVhBrE8JIWtajjv1uSu2T9uwKx1y8fGmkAkyBzduGdUwr0Z/Z696MTai0VlQ1dkSGxv5jVH9z81IYF/YzQlw0gyqaLS0VMCt6O7st2pV898a+keTdbkPo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:45:39 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:45:39 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 2/7] drm/xe: Define VRAM regions and pools
Date: Mon, 16 Nov 2026 10:45:18 +0100
Message-Id: <20261116094523.2484301-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0072.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:349::13) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: b10480ac-ba66-4e62-c104-08df43c65f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|6133799003|11063799006|5023799004|56012099006|10067099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: rrIsjtuB8JJ8ZiPmmlGcBQTCh0apGkTboEshSTWAEB0Vke4aKFvbC5DnG3UYJuDuSSDaWdUD0hBFG3AK3fnXn12P6er5EK/V94YcuqM/ifiGIGTjkCMj8iQcvQT7VFDZsstSEdGTl8bFkt/oEcJVOl+o029JB1KmoSn+u63IzkvoJaT8II2JTEsNNHW2fcYUiD6mxa7GnC1TiplSlmAXeCtYxeWlYnLESfEB0/A8blXUIKWIQFJfj5xIWr/nOYBnNkKrXOHczdG4swkFT5GnnSFvMdBHPvV2s549gKknJtyAGGQMQMkukKwyDI5pd1d4kg4c+DB13Vh0jvoFaFqM5lZTKGYSpNDb7oZ3TrD1ealDD6i836SlN/oQqkMGmpX9Pt8J0KVVYB1DVQQcESqU4uUY9P3kjL8QtVyg1xGHCiBEQNCD1sOHUFNVsyKRcsuXK4VsPzwOmGCxUXWksLKdJvkPM7t3g3ItD7kOUuzg8oYAyXSjoXTngIGnPL81xEFsbp4D8nsUBlXw9ubYO2LduoafhweOLQu47cawDnES+kuEqgQeq7WmByLHWBrEmiUb0o6KGgSffDhRjeJ7xKciX7hA+HBR4bm7I5dmoCtT6ffZC2g48rSxqqegCHW7oym/y8XwwPltivppT1F33L0PGq9lwySn/k/f6kzU/EJUhwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(6133799003)(11063799006)(5023799004)(56012099006)(10067099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a21aMER5Rk1Tb3FCb25ZSDVKbldGOGRBMmlNaURkQ0VoSUlTbEdhczVIN05F?=
 =?utf-8?B?NkcrSzVKL1BwVXUxaURxNjBQckdneWI0Ky9ENEVNRDEwSy8rYVd1TXlIMGV0?=
 =?utf-8?B?RE1zamxVMmVIZnZ3WVdFNVZUVzAwVnpDR1V5TExjOG8zZmdLTGdqd3hiRUM5?=
 =?utf-8?B?OFo4bUc1QVpoYjZuZVl2eDNRazlHeDYzYTNjVkc1USt2czFMRWtxSEl1UGp0?=
 =?utf-8?B?bnBWV09TeU43cXJPMEhXQnBSdFUxV1BqOVhFQU16elBmRnJvRTl2eHFRd3ZH?=
 =?utf-8?B?VW8wM09YcmRuV1lSNG9vY25uZkx0enpXWTg1ckZISnhqYWxPTVU1UUNIcFFD?=
 =?utf-8?B?V3pNbkZndjVsR1hxcWdKTTVmTEtCaWpYTllSUGtSOGR6c0svdWRITUo3aEND?=
 =?utf-8?B?aktVbEtpMlhhTzk3bWFDaWtMYUJyT3llaXFxTjE5VzFETHdFVTFQeGNiMkQx?=
 =?utf-8?B?S2FTazlPcjg5YnRicnJneCtrWkR5M2FaWEdET011WFFPZ09NWnFWNnhiSlZm?=
 =?utf-8?B?Rlp3SXVSRkRMNUN6VWtiTUlnaExQSEtwQ3lPQTJIZC9DcEJhc3d1N0kvcXdF?=
 =?utf-8?B?N05idXV5N210bzg1VVBIWE95NllkYTI1NzRJa1IyaVFlVEwxMDlnRi85Tks4?=
 =?utf-8?B?UDYrV1Z0N1M5MUlNNFhjWUVRaUdTN0MwVTJIaHFhaWJETjlVUllqUlNvekZ5?=
 =?utf-8?B?NDdkR2U1eGRJOTQ1akRXSG1MSGZWRDdXY2IxSmN2ZlpqOE9JWnZNYVlBNG8r?=
 =?utf-8?B?TTZ1NWcvN1JjTzhBQjQrYi8ranRLb1EyT1hYek1oSWxMZDR1RG1FUkM1UUFF?=
 =?utf-8?B?V0J1aVRuRlMxUUJ3NWtFVTQxbklRYkRYOHdiRHd0SHdGTmZVajU2WUoxcnQ0?=
 =?utf-8?B?eHltRGJlLzJQSXljWjMwU3RQVGtHNStQYnpGbGRrVG1xbURsMWUwaDF5ZC9t?=
 =?utf-8?B?QnBMVW5nWFQvckVkODg3Y3d6YzMxdHc3OFRYVUtzcGF5RVhPUkF2VkczMVN1?=
 =?utf-8?B?Wm5uZURiT1dWWXlERERlV1hhdGx5UEZpUlZTTlhQTndDVGxzUFZOSmRHODRz?=
 =?utf-8?B?VWo5dHBXd1BucWlyWWpsNzZhb0FqZXZCS29LWlRUYXZOcTNlRXVUL3dXUGV2?=
 =?utf-8?B?c2d4VWtTTmpGODFuMlBFSVpqalZDRjBhaU5FclZ6NzNkTXZFdzNBbllwdWpi?=
 =?utf-8?B?NytaTHRuV2Z4T3B6b2JFTk9ENFFEN1VyL21GejgxZFFQRG5xYkhmb21mT2xZ?=
 =?utf-8?B?Q04xWUVCLzFSNUxiZ3RrYTBSSUpGaTJZbnpKZ0w5Y2RqQVRTcURYMjhuRlA5?=
 =?utf-8?B?Qm5Jc0pJOUxnWjFnZHIxTnYydElkU3g0WG9JTkFVZ2VpWE4zYmxkb0Njdjk1?=
 =?utf-8?B?dnhtNlhmUHVzUzM0ckNWTWw2OFdmVmJ0VVZwYjNNZ0pSQUJ3RmpnUG55Vnd0?=
 =?utf-8?B?TFd2amlnRWdMaUtYdEFEKy9oSmNvY2QraHNDNnk2NUcvc05zL3hZeE9UMjgz?=
 =?utf-8?B?NXg4aGVkVW1PQXZPbk5xOGJ1WVVMa0VnYXBrTVBoL0dPeGdxa1VQR3RHNDVM?=
 =?utf-8?B?eVA2MXJJSnMzS1Q4eUdnOVVOWXNHZDNydmdLOE9hbmZZV0dMaVRpOGlybHpl?=
 =?utf-8?B?SmFaMDZvOEVwamhPZWIyVHZ6enU4S3d4Ym1McXB5RXM0b1pSbkt2Qk51OVFy?=
 =?utf-8?B?dzY5a3ZkYmQ2dkk0alVhM2Q2cHphVzZ1MVpVODRuMW14VXFwOTFuTkVDb1dU?=
 =?utf-8?B?bE1oZExTM3VBQWV3M1o3TElnNlcxZjBTaHcyY1E5c21NT0RWWUZuUldSeDU4?=
 =?utf-8?B?MitjZXU4dTdocUErQ0tnMkQ2YnMvVHp4bWYyc0FTR3JSM2hTQTRTeTJIQjcy?=
 =?utf-8?B?ejVZVlhmYVU4V2l4Nkt3bEVTL2lEKzJKZlRGbXQyakcyWEVTRUF1aklkL29r?=
 =?utf-8?B?T3BFQlFKbC9aTG1xMWlsajVFbkw2SmJiWkgxeWNnQ1pUOXVyOE5XbDhQNUpT?=
 =?utf-8?B?ZlorcjE5UTZ2VWhxcDhmcmtHRzQvVVRjdlpDNUR6bjhpMDdEblFDaWdxcDlS?=
 =?utf-8?B?WVFadmtSZ0N2NDVWeXhJakM0ZEZHSGMwTVhMZDR1Q3AxV2dPcXdHRmVvUmZP?=
 =?utf-8?B?VC9uK281am9XeWoyRVNWVlZYYUR6QTlGOUwrcm1jZEVzTzA2Nk1uZGczRVA2?=
 =?utf-8?B?R2FUaVVOWU9SbFJEWHFpM2ZtNDdrMzJjRTJ0aFVvRHRlYk5uVDlZVFZwUWZB?=
 =?utf-8?B?MnhjREU4QTloaldiSTNxTWErbFpsbVFVaWpNdnVldFNDZXVIMjl4SFhDV0Z3?=
 =?utf-8?B?Wnl4SzFwM0t0a09JZHpXa2JnQmJ6ZVVUSTFiNnJlcHp0bGlpdld0M09iVGU0?=
 =?utf-8?Q?O5CNLOV2CFENv5q8=3D?=
X-Exchange-RoutingPolicyChecked: i0/qU+O71w/yWNGQY3ftTXBqX7dEBJxZD8n6DBLceXTQ36M1GqhhFzMM5vbqHiU/YmIPk151RFzLIM4hewYdwlVxDo2AdHTSAYGJz6o42dcRSfXsHsEhE6SmDHxZE4fbQGxE/vxD8agcFGFVniorsX/EZ+BJgnKQb2WXsdWGWFEgb+UQer3YOEaml+o/qu3nnK/F9PbNroAz7TGH1ihwrQm0hRwlsbqYXwJ/ZBbWY6wKarL1zHUhEjz6coPb5071TTFD+Crg+xCzACyuNnicZGyz5sKhrePLpgZwRguzi3+i1pcAGGK3otGb5DBokQgcyWn4FX8pBeeJlwZPC4tToA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b10480ac-ba66-4e62-c104-08df43c65f48
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:45:39.1860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ze/7EME2cQtO9V4feI6jvt9Q7T/asj/jVLRim7YpvRi0d5xLpylSiqQMncpF5lHCogWC8dyn9+hJGS/1nSAlcQf09Yq3S9XUuRHnwHJjWEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Allocation paths place memory through a struct xe_vram_region, which is
both the physical carrier of a VRAM range (BAR mapping, DPA range, TTM
manager) and the only handle for the purpose an allocation serves. That
makes it impossible to dedicate part of a region to a given purpose,
e.g. to keep kernel allocations such as LRCs and page tables in a range
of their own, away from VRAM that may be reachable by other agents.

Separate the two concepts. A struct xe_vram_pool represents an allocation
domain: it identifies the purpose served by a range within a VRAM region,
whether that range is available for general use or dedicated to
a particular purpose. A struct xe_vram_region owns the physical resources
and embeds its pools as partitions, keeping pool pointers published during
initialization stable when the region is later split. The region also
records its binding, distinguishing a device-wide aggregate from a tile
region, since both may use ID 0 for the first tile.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vram_types.h | 159 ++++++++++++++++++++++++++++-
 1 file changed, 158 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index 646e3c12ae9f7..a3e421f2f32d4 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -15,6 +15,142 @@
 struct xe_device;
 struct xe_migrate;
 
+/**
+ * enum xe_vram_binding - VRAM region binding types
+ * @XE_VRAM_BINDING_NONE: no binding assigned, default value of a zeroed region
+ * @XE_VRAM_BINDING_DEVICE: device-level region aggregating all tile VRAM regions
+ * @XE_VRAM_BINDING_TILE: VRAM region bound to a tile
+ */
+enum xe_vram_binding {
+	XE_VRAM_BINDING_NONE = 0,
+	XE_VRAM_BINDING_DEVICE,
+	XE_VRAM_BINDING_TILE,
+};
+
+/**
+ * enum xe_vram_pool_purpose - What a VRAM pool serves
+ * @XE_VRAM_POOL_GENERAL: general-purpose memory, available to userspace
+ * @XE_VRAM_POOL_KERNEL: kernel-only memory, never exposed to userspace
+ */
+enum xe_vram_pool_purpose {
+	XE_VRAM_POOL_GENERAL = 0,
+	XE_VRAM_POOL_KERNEL,
+};
+
+/**
+ * XE_VRAM_MAX_PARTITIONS - Max partitions a single VRAM region can be split into
+ *
+ * A region currently holds its default pool and at most one pool dedicated
+ * to another purpose. The TTM manager mirrors the partitions of a region one
+ * by one, so a region cannot hold more of them than the manager can back.
+ */
+#define XE_VRAM_MAX_PARTITIONS	XE_TTM_VRAM_MGR_MAX_PARTS
+
+/**
+ * DOC: VRAM pools, regions and partitions
+ *
+ * Allocation paths place memory through a struct xe_vram_pool. A pool names
+ * a purpose (general-purpose, kernel-only ...) and resolves to a TTM
+ * placement plus the address range serving it, see xe_vram_pool_place().
+ * Whether that range is the whole region, or one of several partitions
+ * sharing a region, is a backend detail pool consumers do not need to know.
+ *
+ * A struct xe_vram_region is the physical carrier: it owns the BAR mapping,
+ * the DPA range and the TTM resource manager. A non-aggregate region
+ * initially contains one partition spanning its whole usable range. That
+ * partition is the region's default, general-purpose pool. It always
+ * occupies partitions[0].
+ *
+ * Each partition is described by a struct xe_vram_pool embedded in the
+ * region, so a pointer published during initialization remains valid if a
+ * later split changes the pool's offset and size. A split never changes a
+ * pool's purpose and may only happen before the region's TTM manager is
+ * initialized.
+ *
+ * The device aggregate described below is the only region type that has no
+ * manager and no partitions.
+ *
+ * The id shown below is the VRAM region instance id. For a tile region it
+ * is the id of the tile, which the uAPI relies on. The pair (binding, id)
+ * must uniquely identify a region.
+ *
+ * Partitioned region:
+ * A tile's VRAM region can be split so that a pool dedicated to some purpose,
+ * e.g. kernel-only, gets a range of its own and the default pool keeps the
+ * rest. The dedicated partition is carved out at the start of the region, at
+ * the lowest addresses, and takes the next free index. The default partition
+ * keeps index 0 and is moved above the dedicated range. A tile without such
+ * a reservation keeps one partition spanning the whole usable range::
+ *
+ *         xe_vram_region "tile0" (VRAM region id 0, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager, shared)           |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[1]            |  partitions[0]              | |
+ *         | |  offset 0                 |  offset pool_size           | |
+ *         | |  size   pool_size         |  size   usable - pool_size  | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                  ^                               ^
+ *                  |                               |
+ *             dedicated pool                  general-purpose pool
+ *
+ *         xe_vram_region "tile1" (VRAM region id 1, binding TILE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm: struct xe_ttm_vram_mgr (one manager)                   |
+ *         | .---------------------------------------------------------. |
+ *         | |  partitions[0]                                          | |
+ *         | |  offset 0                                               | |
+ *         | |  size   whole usable range                              | |
+ *         | `---------------------------------------------------------' |
+ *         `-------------------------------------------------------------'
+ *                                     ^
+ *                                     |
+ *                            general-purpose pool
+ *
+ * Device aggregate:
+ * A device-level aggregate region is unrelated to the tile regions. It is
+ * never backed by a resource manager and has no partitions. It only
+ * aggregates the sizes and DPA ranges of every tile for reporting purposes.
+ * Nothing is ever allocated from it::
+ *
+ *         xe_vram_region "device" (VRAM region id 0, binding DEVICE)
+ *         ,-------------------------------------------------------------.
+ *         | ttm:        unused, not backed by any resource manager      |
+ *         | partitions: none, this region is never allocated from       |
+ *         | size:       total VRAM summed across all tiles              |
+ *         `-------------------------------------------------------------'
+ */
+
+/**
+ * struct xe_vram_pool - VRAM range used for a given allocation purpose
+ *
+ * VRAM allocations are placed through this frontend. It identifies an
+ * allocation purpose and resolves it to a TTM placement and the address
+ * range serving it. Whether that range is a whole region of its own - and
+ * thus has its own placement, mapping and address range - or one of several
+ * partitions of a region is a backend detail the allocation paths do not
+ * need to know, see xe_vram_pool_place().
+ *
+ * A pool stays valid for the lifetime of its region and its purpose is fixed
+ * once published.
+ */
+struct xe_vram_pool {
+	/** @region: region this pool belongs to */
+	struct xe_vram_region *region;
+	/**
+	 * @part: TTM partition backing this pool, or NULL until the manager
+	 * is initialized
+	 */
+	struct xe_ttm_vram_mgr_part *part;
+	/** @offset: byte offset of the pool from the start of @region */
+	u64 offset;
+	/** @size: size of the pool in bytes */
+	u64 size;
+	/** @purpose: allocation purpose served by this pool */
+	enum xe_vram_pool_purpose purpose;
+};
+
 /**
  * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
@@ -26,9 +162,11 @@ struct xe_vram_region {
 	/**
 	 * @id: VRAM region instance id
 	 *
-	 * The value should be unique for VRAM region.
+	 * The pair (@binding, @id) must uniquely identify a VRAM region.
 	 */
 	u8 id;
+	/** @binding: VRAM region instance binding */
+	enum xe_vram_binding binding;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -57,6 +195,25 @@ struct xe_vram_region {
 	 * (e.g stolen mem)
 	 */
 	resource_size_t actual_physical_size;
+	/**
+	 * @partitions: partitions this region is split into
+	 *
+	 * A non-aggregate region initially has @partitions[0] spanning its
+	 * whole usable range. It is the region's default, general-purpose
+	 * pool. An optional split may adjust its range and create another
+	 * partition before the TTM resource manager is initialized.
+	 *
+	 * A device aggregate region has no partitions. Allocation paths do
+	 * not take a region pointer, they take a &xe_vram_pool pointing into
+	 * this array, see the DOC above.
+	 */
+	struct xe_vram_pool partitions[XE_VRAM_MAX_PARTITIONS];
+	/**
+	 * @num_partitions: number of valid entries in @partitions
+	 *
+	 * Zero for a device aggregate region.
+	 */
+	unsigned int num_partitions;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
-- 
2.34.1

