Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F81606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FWxg/y4P;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eQTSdlKS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C853F112055;
	Thu, 12 Nov 2026 11:52:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACF4112055
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484340; x=1826020340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=cbIEvD42ypNI+EVDIt0NvmGeb1d3ENJyw162rs1lU/Y=;
 b=FWxg/y4PHKgVY+HHuvBz9SSdOgUdxTairJB7kiRh77vsbl+F0vG1WfRV
 Mh+LOlzyzRMtgwO+PJLo7swfOEdzuqaVdCcvYNw0aLJcWcMQJHX4KxXhH
 d9AGoUGp7A5V7/hRL2vMsR98l+4TthjSt5sXJPbZXFuMW8+SGSFMVPEks
 H7BB4irMHeMr5zS50lZgdEOh1TU/2kDCiWNIWusgIFpjNGpe0g2RBeaku
 rD3H/NarSw+JlVnwzcQ8m5I/0mmRCFDrlXCBOODWZv0V6rJnq6E/s/+UD
 KTCz5pKRg0sSE4B3P9YjCn/uHcki6nUhVDjIED65r2LfVETl/KHF6EsOS A==;
X-CSE-ConnectionGUID: /ETwy01ORe+XS7D1KauU2w==
X-CSE-MsgGUID: seIAbIU2RuS2e+rxINCxXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3132798"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3132798"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:19 -0800
X-CSE-ConnectionGUID: 8QMq78SZRjandUg0AZLdwQ==
X-CSE-MsgGUID: fzBwkA7aTfOJuaQHdhJZyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10407527"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:52:18 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx0U2X8JEY73dIMzPimZ7GOsJXTCE6bWcFVZt5OxEERWSrIB4HnbfKY9B5GjHyhOHPoNh779FObCt2KafD5hU3/neQ1iw1vV9HBmireMGxPJDkk7OOqCB2n+Z/sQ/Wgl4I7QSt8H2zrZrcLczaufrVwONT9Rr6LY3zb4tKf2tY6hq129iLZtPr6X281ecF4LdSjrmOB9KPs8Z6NPHaXJuTjaf4HNvDuKAcJmEFu8Bng5oN+r053Y3NOkVdygYufDwulLw7flhtXEBrz5VZezvYtmMDswlEJrLKoKhNXEkV6gEAYO46g/TTS3gmIiZ5BQ6NUTqWod87Z4W9qXDJEpKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfnpZHhIMF/Ibohx+bm+RLM3NdGQEFIlGR+OeuyXn7I=;
 b=PrNPd7zVw67dozYWDM3yRulFtxs2B+1QnpW/Wiv4/90c2WigrD0X5wK1Cx0fr/RWHBP7B9rS4ChAWs8dzf/zpjhrhSUrNJq+am2j9K5sPRoX6wySyEbZ6XwQooSJFNJVFnGhAbN6mwPpto9yU34/Z1Tj48Zn0hGQ3ggt7erGbc1zcr/qQ9V3AtVwhLCojUqPTqg+yZpjcPxNoG8OnqQ6scvYmaBDCSK0Lr94RIStjZ+CH7ry2KryPLC6229usPNBJTSfr3EhhkReepvmjR7LX7J2XXQBaEINwBxprWBesGuoM6D2v1xaVEI5ULCYdk5tyF3dQxBrt0b6jozKopd5gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfnpZHhIMF/Ibohx+bm+RLM3NdGQEFIlGR+OeuyXn7I=;
 b=eQTSdlKSoidcqXHrxDOMdnat7Oh83UdhTGG5+dmu9XXp2jrBEey4Bmqvlgb9HXp8n2NXDlJ7LAmXtvCI/35b0e+S9GutnzrfU+Q4blvJ0NBA8DR6jTYv/YPMMix3wPiptQykvXpha04yrl6/0/PnEz+5mLmAeWg/wiYFtm7NKmA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 11:52:14 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:52:14 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v8 2/5] drm/xe/ggtt: Introduce full GGTT range size
Date: Thu, 12 Nov 2026 12:51:44 +0100
Message-Id: <20261112115147.2329912-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::20) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: a2493f52-b7b5-4d4e-26ca-08df40b364d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|261009223027099003|18002099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026140227099003|261021123027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: eSpv1XG+H14S6YHhtKDOB63DRXgZsB7XhSXm/uhLNse0n2WFdTSVmjSfKlkuhLWeidQDF8RRFYfDl1rlgY21THoQ6KPdpYQiK9zVDLftZdTXFP+D6Eb3xNW1IP0pY7ZTvn/9FrZsAUzozeeLT3m0BC+Zeki6Jbmnc+X+4akdQ462KbLYwcj7dSMwSoIYmB/wo7/zVPzWEkuFmGTsSAL59tltElTK9Y//sQ/BJRKA8S2nMzvvZbIsSofqMQ7Bt7V0HZPFkRbZpolty6KQUt+zq4iDgo2i9wZR6iNbBk5+/cUuSUOkSf0AqFP2EQH1NtcCrfduspDg9dD9MzwmtBYEIQbdy1LHgpwCi+2bWTTLWuciEf0N1EEEi/I1gGp6fRlfRasJGJXHqFP8f1UjDa0a0NwjApPWrV9u7jHIgQN1zPMcY0tcQH9ff/M776CKp6Er8+rMsoZRZA66PVzj/oEzMwQP9vm7k+CaiAOINGKw8ZX171MbxuimmN9SdfsP/axmxFNhUFzv6p4NHxYSupgMbEXzcy2AKWvKWZfd8iktwe3udX2oNlzcUMrbATiIQupYi+vJo65fkkD51yA36cyQPUd2JcHdzcepTITZD0yvDCrXI5R14m0ZjuzQCIlN9jN6p8nQda4Ajyp5aiabFdt6HJPN6vN/hsWgrhghqGkAKpA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(261009223027099003)(18002099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk5XK3BXYzJBdmJvVGJXMlhBejRPTENJR0Qvdk9PR2VubFVJMlpGZEVuTmwy?=
 =?utf-8?B?MEFXc1ZRMFJZZ1hmaFA5OWdyRk93L3FUSWhXSUxMN3QxVlcvNXZIWWZ6VGNp?=
 =?utf-8?B?TWszZCtQNWUxNFJKTC95b0pqZGVjdE12amVkalFzMkN6UEJKY2w3dHpHcDk4?=
 =?utf-8?B?OWNNNzlueUZBS1RhRElWT05Mdk1UQndwdWFFeVdVSVgrRmU3RXFQN0tWTWt6?=
 =?utf-8?B?aXZaRlBEVVVmYXZFQ2ozamp6N2l0dFdjY281UUxXSHJCcXI1N1NkSGlqTnhN?=
 =?utf-8?B?L2cwclZubWdoRFpjSGVQWUN4cndmdDAyNFNacXF4cndhWmxLL1h3eFVaMUo4?=
 =?utf-8?B?UGo5OFc3dkFzOTF6VUJOaTdJSGtndGNGMWY1Tk9vOXVOeDNxanFCalg0aWVT?=
 =?utf-8?B?MjF6R1NsSEpEUFFnUTBDNVB4bk1rekQyVmZtVzNOdW9Hd2lTNFo1MitJc2sr?=
 =?utf-8?B?RmRhSkR1ejIyQTJuYWV2eU1ZTXRKS0ZlYThJN3NXbThQbWdlL1hja3E3ZzVO?=
 =?utf-8?B?NlFucWwvUVNlclFGbGdzTlZpdTJUSzd4ck03RThKL25JdHhzdXB5WmV1c2Fs?=
 =?utf-8?B?dnhjeHpJR21lcFV1QjVEZE9Uc3ljQ0I3UlNxMm1UME1kYXZxeVNQcmpyeEc1?=
 =?utf-8?B?bkowT0toeUdiU00xbUw3c1owUE5WL1lYS09HMG5SaU5sUks3NEVsa1lxMVM5?=
 =?utf-8?B?UmNFQmJ3SVJpWk9EWGdhL3QxcCtwaS9wSmdHTytFM2VEV0JMMVdEVlJuM3lO?=
 =?utf-8?B?c3c1elNhdlhQMTVxcHZNbnZEOExBN08wM0hjKzAwaitJU3JCTmVJb0U3NCti?=
 =?utf-8?B?S0ZzNmlMZHYvdWNzQWdHVnlHeFh5M3V6Y2dEOG1xMmcwaEpRTVhGeXFTVFFz?=
 =?utf-8?B?VTdIQS9mNnV0Mkp1K3NiY212aVdickhBMHNuT0djaDZod3dnNWxRZEp2S3BL?=
 =?utf-8?B?cEt2ZU1tYkgvZTdrMnN2Z1VPSm9MQzhJWVA5cys5T2JGbC9JekdKWXl3d09h?=
 =?utf-8?B?UDUvZ1lMeE5aLzl2aE5HdzBtMXRCNjFxYU9UYlJGMTdwUVVkalhmeGQvbjNN?=
 =?utf-8?B?M1pTMGpWN29SRXZyRXBGNTZpTjBOQ2RIZDEvc3Y3UTM2M3FLbGgrR3R2SWdK?=
 =?utf-8?B?cXVDcHczdEw2Zk50MFFQZmxJLzdYaUhXdVBYQkRaRnMxK3RrNThXUndjQXQz?=
 =?utf-8?B?N3hNcVBBUUwzRGdRcmpDQVUrQjFUUnFXUkk3TlphRGh2SVN4dDFldzNUNTFs?=
 =?utf-8?B?QmEwM3dWZVdXc09SeGlWYnBpUWIxaTNPQVdBaW85SWNPQkltWjE3MkJZcEJu?=
 =?utf-8?B?c2lSc2R5TDd3cnUwNVhGT1NvSjFoR2MxeGxhRlV1c1A2SS9RRkVlaW9xN2h1?=
 =?utf-8?B?bCs5aWVxRXM4SDEzR2Y0ZzZJV0pudDJnQkEzYUpWZGh6L3FCTEdBTXBOQzZR?=
 =?utf-8?B?T1JybHhLZHpMcElGdjRVMGEycFg3bG5vNGpaN3dVZGxYd1lCbUFVRW5SaGdJ?=
 =?utf-8?B?SmtLNjJuY0dpLzhValJnQ3ZoaHNvM3dLRUREZTVTWEJmQllBY09PcHRmb2E3?=
 =?utf-8?B?bFlnQjA4Z0ZIUi9ZVitTVmZRamlYYVFhZWk1WXhLNXFvUG1kbUZWcmoyNUlM?=
 =?utf-8?B?WWlqZUM0akVGSDczZTFpakZsMEdjWTdnSFdIQUVLSE5JYWZHVi9UZFV4aGxU?=
 =?utf-8?B?dExxU3pveUFxN3JTc0lSN0hBZ2JEeHI5dWdkQnZBamhzL1BFb1VvZzFteDQz?=
 =?utf-8?B?VUQ2VzlIL2tsbHdLSkt1WkVRT2lZald4L1NBMzFQM1AxRCtYN0sraTNRMEl2?=
 =?utf-8?B?b21GK3F0M3RXUmpac1p2bHEyTFVaZFYvazlsVVZybnhLRlJQRDR6SWw1ODJC?=
 =?utf-8?B?RWlPcDVxM0kzcmJwdk1sY2dpNVpZSGp5azFUWHFlaVlnYmtuSTdoZkJJdFhj?=
 =?utf-8?B?U1RWbFd3OHMvdU9wbi9lOEpNNk5HOWRhS2JueTcwZEFwS3pOZkxjNkZoaEFj?=
 =?utf-8?B?bG45aW11YThvY1hvWW1HbXcwS3lkTHIxYnF2V3BjMk01OEM5Qk9LdkxOaVU0?=
 =?utf-8?B?RnlsZ1BPaitVR3F4N3FZbVdGQStGZ3VkMDNhT0xJWXM0OE5lclkzNnVBT2tQ?=
 =?utf-8?B?RDkzWGphTzBHaitUb1QvNWRQeW01QWY5U2wxNCszVlR0V1Yyc2hKMGprcGhi?=
 =?utf-8?B?T3NVN1FLVzR0SkZvYjlNRnhXWjVLbkx4dCtIWHBWeHBXRjlUdkxxa25jSi9I?=
 =?utf-8?B?cjlEaEpPTk9oNFRQOXR5SVVpaW5BYi9Sdlc1RzR3T3l5d0V1OGNLR3cwbkV3?=
 =?utf-8?B?L1ZMSzJYT3B1YVJmL05xZDJ3c01ZaTB3UmNoaDBwZ3ZjSXRhV3VzVTdXNTl3?=
 =?utf-8?Q?pKFGwxp55upLhwXM=3D?=
X-Exchange-RoutingPolicyChecked: 3W2ePbmv9JjzCYOUZ2asG7Adpl0uCaT1rBxO6ND/aqq7Q85MxPDhpFmKQQqZWZK+l212A2w80X16kT0wI3sOtDsqwDKn5gCBkEQe58MZ85rkfnHgV7KIHu+aY0Q/i9qEJZ5SeaFPGISWl2gBktF+xADfTVMNleLFturhPaOMuWYrQYEtVDnsH/H7pRjJ5alR4teeVPjRMGSxvojV7q93g+ngk/JvQ8rtCvQNUNCtm403YFPSO0QqMGk/cIFcNc2wFcVmvSL2L1oQ/tELdwjqp6HeeLzsVgTab5ayYC/ZPpb9Fi67vdNogjJ/gzh450CiSX/QAc9dQ0wMHegRE6lgUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2493f52-b7b5-4d4e-26ca-08df40b364d8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:52:14.5824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FbZzW0J+B7CkU5qRLHsYhbCC+vfm+jR+KwZEYJxCuVYgm/FewvIZDsmtK+KCHGH3/t/7m3pC+ElSR8mcq6lGX8t5ArEoQx8ff0z5tVZpiM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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

Separate the full assigned GGTT range size from the size available for
regular allocations.

For now both sizes are identical. A subsequent change will reserve part of
the full range for VF provisioning.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index deddf18d0bb09..73c45eecae2be 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -113,9 +113,11 @@ struct xe_ggtt_pt_ops {
 struct xe_ggtt {
 	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-	/** @start: Start offset of GGTT */
+	/** @start: Start offset of the assigned GGTT range */
 	u64 start;
-	/** @size: Total usable size of this GGTT */
+	/** @full_size: Full size of the assigned GGTT range */
+	u64 full_size;
+	/** @size: Size of the GGTT range for regular use */
 	u64 size;
 	/**
 	 * @flags: Flags for this GGTT.
@@ -241,7 +243,7 @@ static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -256,7 +258,7 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 {
 	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
 	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
-	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
+	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->full_size);
 
 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -361,6 +363,7 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
+	ggtt->full_size = size;
 	ggtt->size = size;
 	drm_mm_init(&ggtt->mm, 0, size);
 }
-- 
2.34.1

