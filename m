Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65007CD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 18:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D2C10E90D;
	Thu, 13 Nov 2025 18:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOhxp4vX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3271C10E907
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763056909; x=1794592909;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=2MQgs16VuimozfOSzUE0SopWSLZrkTngCmQd3YhmKbA=;
 b=ZOhxp4vX7AfTKiGkXlHegYcvCi0feKKPVGBbxQhnd+yrGu9f1jNGy93e
 giFPF8eUMUc6LkJgk64ByV9vK0dwJUWdsKf+7Kyf6U90EBHdsTtJLfXnL
 iY/tvomRFQvktq27SNvdr/I1yzmUkz7u+qMfcj4TLPKjDdZuoK90DTgZT
 Ytd/ttJih63+5a9HiVKkhy80x7EKKLeWPYsKxnpkmBWGH2vLUUQpgH2WE
 lhWLjbZrZb8pK9ZbFhXoqkF8taCLv5OcP+bmEXjSi3ROGfNX8nD4BpaOt
 RweLdFa+WvyY8AJW2BawG1GcsD52J55Nrki8xW1JFFOX2MIF8qRZGW1VD w==;
X-CSE-ConnectionGUID: RwP5L119Q7iZyauVwT96iw==
X-CSE-MsgGUID: 03KU5asjRziHjXuCYJXO3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52711005"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="52711005"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:01:49 -0800
X-CSE-ConnectionGUID: c+zof0T+TLyliJWUxiMH+w==
X-CSE-MsgGUID: s7TEaRVaQeiAxu3EIRQa/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189761168"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:01:49 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:01:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 10:01:48 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.29) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:01:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tI5fPRPAOvuSn5ydwnY5DXadN86QzUhNUgGHzXAtApOWzg2PNXWvDXWZtotsTRjB/yzhGrjWRqIsj9rOCOJZqtJ2XB1r+cdCjePYL3NRkshB29qKAgXYTni9cdgNeE+NkCtP+C7iitF5408QBZVlhNxjrhZdeuYMYSVPwekpT0vJhpwpRbGxMe+QRyqmvSRB21G8XrrL2oJQuBfPomo8kXtcjQ+aoGgzDccS1ObT8hgLGllSJ9CWJmYZmefDeWJvOZ7/lUBa0ynJG5r0yPe7eZsXsjITKiFK9clbU0upCPIycTnYK3cT/BNxdwt5mScFH/gcI3qBCNITPNZUlogHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIs4mF4MfiOt6b86K9HMGGLrbqb8sM14TjlQGOknzm8=;
 b=DEViMf+NI5AllB1sPjL4lESdJJliLJpgSt3Sb+pbpN01Smz2tv9KKM/5Nc2VhZ1/WJCquafoJZvlqZX1ZQxKvHWnL+cHm8sx7dfNi7hbQyPLCs2YvwLMlYiVFbtv6SFS5RFRTHxMCXreDaWnCyj2tZGdpl3UTZ5QLkV/ACY/kEoCcuTDHRBf7Vo1L0z/8m2EXBZK67daxpdCcL2j2mo8ajEStcWM0+dzJmurJQFj7K3oM6Wjyyjvoz00R0VHYbXysx+a+yXr1zVk9l4W7DSCEbM6iO53kjUsKc3GSr9fx2q3EMXBRihuXlZYZ1P1UfZwUMCUrt4Jp/eWifwTkgy/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA3PR11MB8893.namprd11.prod.outlook.com (2603:10b6:208:577::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 18:01:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:01:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-58-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-58-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 26/30] drm/xe/hwmon: Use scope-based runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 15:01:18 -0300
Message-ID: <176305687851.3698.10344878227335918535@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA3PR11MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a43b38-2db8-41de-2b2d-08de22deb1db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0w1T1NXYlZsNC9pZlZqcDArSnQzc1FTbEZCNXNRa3VPZ3Y2YzZ5b1g3Qy9o?=
 =?utf-8?B?Ym1mMzlTc2V6UnNiQlA4ZXZ3UHYzNnhPZGFvWEw2N1lnaXR3YmlwRWhia1ls?=
 =?utf-8?B?UjdyRnJIVlRkV0lTK0RTTDlURjFtM3lHS2Q2ai9XK00xQnMwU1Uwb2dSbzdh?=
 =?utf-8?B?TUQvempHUXd6R1dHam5aWmhYNm5FRXhvbkgyYitJV1pjc0VaRWVWbGgwaDdV?=
 =?utf-8?B?Wktad1RIVmVLdjgyZ0tKQmo3Zm9ZcVRndktVWGVjTGFzb0hJbVR5WWpFRzZP?=
 =?utf-8?B?UkRENlU0NmxBU0QrY29MWXVBd3JjbzBYU1o3ZTRUakQ5TlAyMGhNVU43d1NC?=
 =?utf-8?B?SVNzSWsza0k3enFIRjl3aWNqSm9oVDdDWlhWTGtVWmlIend6aEYvem9EMHkx?=
 =?utf-8?B?bTNXTGxsZjB6bG5JcFBvVGxyMHdPOGQySU0yb1R3eE1tZ0NVN2k1OFVVcWFV?=
 =?utf-8?B?MVgxRlJXSnRqQkxTMTFuZXdqSlQ5cHlITGlOT1orS0lSbGs2TFBJTUo1ZXJt?=
 =?utf-8?B?WVRiZWl5QkJiamtDQ25NRUt4b3FlYVl1bmd1MzJ0OVhWSVFYVnVKUmp5aU1Q?=
 =?utf-8?B?S3NMYWt4aWVCYTRVWGdoV3hrYXBrS1FaR3lKZC9NNWNWY2p0a29CdG5XeE4r?=
 =?utf-8?B?cUJ0S3B1QnJHYkgzN3RhTFFSUHFLVWxBVTZjdENvUklWWlBXbmUzbzRhd3Ns?=
 =?utf-8?B?Qi9IWU1vZTI4aWxMT3NkRklIcVppQmVkWGpwNy92Qlc4QmplUVN1anpWd3h3?=
 =?utf-8?B?ZW1hRUZyZmVzVEQ1ZWdVbUVLZDcyWmNxWW9lYkdubE50TE5TTXlKNUNlUjlw?=
 =?utf-8?B?M1RnOVZ2MnU2NngvNG1LbUtnUStSTTROZStyL0d6U1FqRUpkV3ZjSzRUdEVP?=
 =?utf-8?B?U2NDNURWakIrMWFjZXlzNDFrRUNUcTVoTE5iWjFXTjYyMW9sTE5WSHBkUGcw?=
 =?utf-8?B?N0l6VUp2ME4xSWRTNkJwOHBsWFdsemJpeXUyd3dBQk9yR1pyaGVPeVB4VDRm?=
 =?utf-8?B?RzVNRXBVcEptMzg1WFNLNjdDYmdvUXNWbUR0MDkxSHgvUHhsZENwK3lHaURj?=
 =?utf-8?B?d1hFQmlYU3R6Q2JQR281N2pBWEREOGtNeFBQVlRRV1hIemJpSjJ3NExkdW12?=
 =?utf-8?B?VDY0cmltSldiamtMU1Y0SnNOK2JYa2plTXA5VFZzTUNIY3k2MEhRdkxUTWRX?=
 =?utf-8?B?TG4vL25wOWo4ZFgwK253aGt1T01mdHlrTldHTmZLMkZHTkpqY0k1MFFKYjdF?=
 =?utf-8?B?c1hvczBUMjZTZFNldHMwNlIvYURNY0VMMFlKUjQzMndnOHl1RElDT3NjRlNQ?=
 =?utf-8?B?Q3Rtd2FEaVYwVHE2eFFLMTZTM2JRNm00ODVxeTNQZTZDbGoranMraUFWbmha?=
 =?utf-8?B?RENTNjVOK3NVM1BQUlhnQitlKzR0eXBacFY4cDVwK2xSV1EvNzY2eUxLWlRr?=
 =?utf-8?B?Q1QvcVRORmxSRUtVUlRPNlBVaFI1VVJhZkZJcGxIQzlOZXdMNXp0Z25ma1No?=
 =?utf-8?B?TXFINUl2QVBpYmlGNjBmNmxpb3VmanhHcm5pS1kvWE4xQlBTSlZmYU9pUWF6?=
 =?utf-8?B?N0ZCMk5yNHlYb1BuR1dIY1hUWUlENGxUQmMrV0xFc3V6MjRubEd3cjVTdFJZ?=
 =?utf-8?B?YUpESGlNNjA4ZXhUWk41aGR0a0xrN3k4aVFaZTJPaWtMczg2NzdZR3RuMTJP?=
 =?utf-8?B?ZTh2djlUeVpNbmNQSk5xVHlWQXUzRkhhMXdhQ1gwUmk1aVJEOUdBclpNQjhX?=
 =?utf-8?B?MkVNc1pZRzh4OXRxK2pUVDQ4M1ppeFpNZEtiSXphbnY1bFVzTE1EejhpRkw4?=
 =?utf-8?B?N2VwOUVhTHh6bmdMUU02UGYyY1RFbXN1TDdEVnF4SkZ1V0N5bm55WEwwOWd1?=
 =?utf-8?B?VDRzbDJHNkJCMjlKZGxEd1FGYVpMMlFEcXV4bjdYS1JBbzRsRytydm4zMm5S?=
 =?utf-8?Q?hza0AzAB8jXOfPLwTELQZUsvQPLmSyOZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anc5S0h4WXZXU216dUdXM1ExcnR1YWNhcVZqNkR1YUdjbE5kbjlEd2VZbFZr?=
 =?utf-8?B?ZmFqRDJXUUdmbUNxTFViZitlUlZCVndLN003Mmd5UVFuOGZIalMwamIrL3ov?=
 =?utf-8?B?QnhLOUdUTWVWNXRHUFJoTFlhdjBNOUgrSVliYTJMQU5paHk0OVRvOEMvVE5W?=
 =?utf-8?B?L0ZhUmV6eE1aS1ZFai9udDZIMGpXWGM2Smpxb1VPL1Fxb3hMaUpWRmp3SFRq?=
 =?utf-8?B?ZG9Bd0d1Z2pzMGJZUXhiVElGRnJGUEUweUdOaG51OEw0N3NoR255SjZ6d0RF?=
 =?utf-8?B?bldtNE5QdlhJdkI5d1ZMbGpCMk94eFhOZHhjbEx2amxWS0lxUVFMOTZKWGc0?=
 =?utf-8?B?d3hBOVl3SjFuVzRFbW85bDZFc3UwMWQ1ZUphNmMvcmd4OVB4bkVpQnVjVU1J?=
 =?utf-8?B?SjNZNHpCSHFuM1RId1l5WFpzMXRRUE51OTVkbWcxQ3IrN0NCNGlwcnFaRnhV?=
 =?utf-8?B?NjJmQnZPaXF1RWp4WGs3Sk42YkRlRDdJejlER1ErR1RNaG1nRXBqSXp3RFJK?=
 =?utf-8?B?RHBNUG91TTVzU2ZoUGw4ckZQcFoxdXAyelFVbjI3UG5GMXZhdGpSU3ZPZFdx?=
 =?utf-8?B?ZEtONnBqV2VxZGF1UzhQdXYzcFQxZFFNYWwzc3B3aVBvQW4zbjVEd2hzZlBS?=
 =?utf-8?B?UVZVbUpFMXBsMFRkbzVhN2RmYlVzVE5rYXJmd2dKS3RLeTBmNzMrQXVYMXA1?=
 =?utf-8?B?alo4V3VMc1RKNmRlODIyeGEyazRhbE9vd21Qd2Y1S3dNRHl5MXRHbWhQcVIr?=
 =?utf-8?B?M2lEaGdHczVjL09pdEtiMHkweEtVdkF1czBLVy9OQWFFZVRLNVFWWkxsUTRq?=
 =?utf-8?B?VWVuS2svNCswS1RhZHJUU2Iza0dDQ0pXOUdPNHpEKzRTODlNTWxlSUpha2NJ?=
 =?utf-8?B?cmxzSXI4dmFqVkJ0SXZSczIxVG5mcnl4bktINWMzdHc0b1M2Y21HQkI3S0Yr?=
 =?utf-8?B?bkRRODFEZUIxbFZOcEh1dDJRbUlMM1BKcHdjUGJDaTVxeldNK3FqZklWVENk?=
 =?utf-8?B?TGpHcG4vQnRhU3ppY1Y1SThYUC9NMVlka3lTZ1JiNUZ3UUJFeFBvOEFQOWhY?=
 =?utf-8?B?SWQ0UFhLbGRwQVB5QlVzSWhCaDJxeHZYN1ZETzR1VWsySXpMVFc0NTUzNzFu?=
 =?utf-8?B?L0wxUGNWWnJ0ekRKRU80cG1pa3oyS2Y0NkZoYjBkbGNKa1JMeWZZc1Y4UUJ5?=
 =?utf-8?B?TjNhS1hHbU51UlJsWUdGUmpnY1VVTTZVSytOaWtCOVppdWJOUFk1eW1hSGNt?=
 =?utf-8?B?aExoSlh3ak1KSmdQdko5QmtpdzFYK2NZdVRycVpZby9FRGFmVTRuWTRwbEt0?=
 =?utf-8?B?QzlWMmROZEN0SDlxNU1lZjRTNDQzeExZK3hKRzBqNDMwbmFqcVFaNkxWaWtv?=
 =?utf-8?B?QkxaUG82T29DcS84cEhMbVBlT1VtL0NZNnliTW5pa2hGaU5OaUgvWDFVdklQ?=
 =?utf-8?B?ajBVMDcvcGY0cWs5eHh0KzArVzV6NGJJUlZydGM3L3c5SzFFTy8xMkxka0My?=
 =?utf-8?B?ek1MNEhlREJ1THRadkcxSCtmRjJGeFI2UUJkZ01hSFE3RHVJYitGajN0QkNQ?=
 =?utf-8?B?ZktwOGo5ZjR2cHF1anMrazdReU43UWJyY2RwOHkyT3JLWG9IZHM3S3FoYUlE?=
 =?utf-8?B?KzJJUm1nUnR2NW9FaGRWQlNoelhQbVRwM3RCaU5yNW04ZFowUnYwYkpXcFc1?=
 =?utf-8?B?azZnVkh3bFI5RzJSanJKZytrMlNBelB5MEcwU1FmODcvakx2bEQzcDE5MkRx?=
 =?utf-8?B?Y1htalBZRzNRNFBEOTJDRk93TnJKNUV5bWhpUTBhanY5MEtCaGs5WUJTcjdy?=
 =?utf-8?B?VFh6cmFkZ3pFYk52YysreDhraGtGOTJNTmpyQWpwcHV1bDhJVWVCVG5pSEZX?=
 =?utf-8?B?Rjk4OWNoUktzN3ZROVhTdFhvazBGeFVKb2hqWlZFNU9kaDlOeEhRbFVxLzJ3?=
 =?utf-8?B?RVdMSGtIaDQ4b1NpbG9jZkNOTWx2TWFPNmd5dkZnYVNQdSt0VUs0WkpoeGhl?=
 =?utf-8?B?MGVVUXFVeEtqcTV5UUUxRVFKNmZVaUEwZFhHK0huK1dHSzlpUWJpaTR4ZUhL?=
 =?utf-8?B?ZTZxU3Y0MU1NV1ZSRnpLWkFmeFpBSDF4K1pFN1pMSlBwTm5FQWNVV1RxWElj?=
 =?utf-8?B?Z1V3ODVNQXJKWDVsVm0zd3VFZFRkSmJyU1NKV3FzNnRZc1dGcXFpd0FDNE9i?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a43b38-2db8-41de-2b2d-08de22deb1db
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:01:39.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqLH0+HVJ0AOtuicdpPI/se0KJs/XeeHe0tdi7+xuFHrq95doLrnrKOmsP0pEkO1BOdW40RCXag8FgtUuj0vLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8893
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

Quoting Matt Roper (2025-11-10 20:20:44-03:00)
>Use scope-based runtime power management in the hwmon code for
>consistency with other parts of the driver.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++------------
> 1 file changed, 4 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>index 97879daeefc1..5ad351fad6e2 100644
>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>@@ -502,7 +502,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, s=
truct device_attribute *at
>=20
>         int ret =3D 0;
>=20
>-        xe_pm_runtime_get(hwmon->xe);
>+        guard(xe_pm_runtime)(hwmon->xe);
>=20
>         mutex_lock(&hwmon->hwmon_lock);
>=20
>@@ -521,8 +521,6 @@ xe_hwmon_power_max_interval_show(struct device *dev, s=
truct device_attribute *at
>=20
>         mutex_unlock(&hwmon->hwmon_lock);
>=20
>-        xe_pm_runtime_put(hwmon->xe);
>-
>         x =3D REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
>         y =3D REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>=20
>@@ -604,7 +602,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, =
struct device_attribute *a
>         rxy =3D REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
>                                REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
>=20
>-        xe_pm_runtime_get(hwmon->xe);
>+        guard(xe_pm_runtime)(hwmon->xe);
>=20
>         mutex_lock(&hwmon->hwmon_lock);
>=20
>@@ -616,8 +614,6 @@ xe_hwmon_power_max_interval_store(struct device *dev, =
struct device_attribute *a
>=20
>         mutex_unlock(&hwmon->hwmon_lock);
>=20
>-        xe_pm_runtime_put(hwmon->xe);
>-
>         return count;
> }
>=20
>@@ -1126,7 +1122,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
>         struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
>         int ret;
>=20
>-        xe_pm_runtime_get(hwmon->xe);
>+        guard(xe_pm_runtime)(hwmon->xe);
>=20
>         switch (type) {
>         case hwmon_temp:
>@@ -1152,8 +1148,6 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_=
types type, u32 attr,
>                 break;
>         }
>=20
>-        xe_pm_runtime_put(hwmon->xe);
>-
>         return ret;
> }
>=20
>@@ -1164,7 +1158,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor=
_types type, u32 attr,
>         struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
>         int ret;
>=20
>-        xe_pm_runtime_get(hwmon->xe);
>+        guard(xe_pm_runtime)(hwmon->xe);
>=20
>         switch (type) {
>         case hwmon_power:
>@@ -1178,8 +1172,6 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor=
_types type, u32 attr,
>                 break;
>         }
>=20
>-        xe_pm_runtime_put(hwmon->xe);
>-
>         return ret;
> }
>=20
>--=20
>2.51.1
>
