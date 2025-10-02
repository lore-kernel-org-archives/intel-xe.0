Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B502CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 13:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C1810E14F;
	Thu,  2 Oct 2025 13:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrD6NJHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C55E10E14F
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759412781; x=1790948781;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=gTT8IT9vIKvDwv3sHgu0m/Qb1hLM/0qTLQ3CO+zE6YA=;
 b=HrD6NJHUk7mVXjS7iRNubwBCotz9peiA1iwD0VCk0DaZ3FcTeVHrvlbo
 x0xNjrfCn5unJ55+gxMlto3MRicK6TxJ4aPpkNRnxzZPoKb0xunoPJ6SQ
 EaxrEutD+7Rmd4rwfn/6n2J7cDwTcydOyWfQdAtda3zuRhsXnXr+DWuza
 W6TU/NOlctym5HHDt6An3LQTTYP8eTtE4cI7Ig7gZCWSprr5P2xXMXxmz
 3tUIm9J4DeP+pAWCgK3jB01bInR0U66lQxt+umIXo9fh6FhsRAqXmbe+/
 rPNVf7rNsmwPQOFEC6B3+GszexRHGxkBjJpq3OhTguKxrMx8sAaYYK8YV A==;
X-CSE-ConnectionGUID: SjfRJVjmRpG4z8FLwN1R8A==
X-CSE-MsgGUID: WqXLUxRQQK6NAmP1jdCz3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="49250025"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="49250025"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:46:21 -0700
X-CSE-ConnectionGUID: lz9BededT1SJgD81qQvD0A==
X-CSE-MsgGUID: Z+af4oVHQnypEnBE55lvUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="179826247"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:46:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:46:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 06:46:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:46:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr+Hb32E13E/b2E+nhmX/y2aDEQ4S+lGSR9dQkbM3N02KHdD0ItvU/0spKauO/O+n9C20UhkUqEDDTtcKSBPCG5yOhTYxkAXzeRTlS0Ay5SIbZuJbRKdsd5K60QHZOJ3i6I31O8CTYTPcWYK4Y1mXHh3RhogttWwhBy1+30OkukzRKdJozH+lW5AkNcfiYHM22bGQcaNwOViSpfPG4VePTG/8UorFXc+ae/hc+g5TDp134yrytwFEEPcKX5cJovezML/Cyw3FbYpvZ/G5EUreqlweSIldXrFkHVmLYXYEdPgQJaIPuTpldb697tyFEbEiGsHnHFXZcS5BXh5GUSP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWsSoJB7RVWfl/PdtT5cLYtfuk+XjDghISUZMV1ORGo=;
 b=VQx2murkiQhk+sJJrVmfnTp1hCzsr4f1aCMTL/m1QIepnDTxbjEdTEdxXzxpOdkBNzp3mNH/e+YE1DWSU7YtI0RUDjdJC8nP+IHlv7CwicTi8xl3TmQieoSrfeTaiOn9WXO2m43pCQZUN14NctNx7CUN242sJooY0JXEl6Xnmb7KgulUjLOR5F7CIsLmrMft5vaNlVLRm8mCxFU4Mv98YAA9Vx/uSdJfN57zPi00P4nUoDZGFZcTTUaRqt8zXO3iDu5jJKQySIMFzIbd93e8ZSjtyL1dVXPXMFqiuBzCLYmN26v8QQccVBeiC0EuIMetJp76XQOH0aW8htNCFHWKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH7PR11MB5863.namprd11.prod.outlook.com (2603:10b6:510:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 13:46:12 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 13:46:11 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-37-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-37-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 12/23] drm/xe: Check for primary GT before looking up
 Wa_22019338487
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 2 Oct 2025 10:46:02 -0300
Message-ID: <175941276213.1952.9542047972038176094@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH7PR11MB5863:EE_
X-MS-Office365-Filtering-Correlation-Id: 6589f218-08f2-4457-1b87-08de01ba0ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MENGdFJYREIzMlg0aXpOUTdJV1BYMkwvdVROdWF4c1haVUFnbDhQejRQSVlh?=
 =?utf-8?B?ZkFDVUFRcm1pZGdQbGhNSVYwYjUyVlFvRjM1c1FJZUVNa0dNVTZqVWtqanJD?=
 =?utf-8?B?dlFSbUt2NzJLdnIvRCtGaStFV01lZ0NiSGNNMU5rMGpiTURiZnhwWWtSTHFB?=
 =?utf-8?B?dko3SzVMd3MxOXNQWVZRaGsvZXRJYXI5cVN0dU5EUVl0aU5VajBsWTJUbjBF?=
 =?utf-8?B?Y0xHTS80a0RPQkl4MERKQnArTlRpS3c0Sm9PS1JzNHdHb3J5Tm14Y1FjMTYx?=
 =?utf-8?B?TGNKa1k3UkhaNzdiVThRT0VvUU9IUDlKMVhmbTlzR2tMMjF1VDMwakdMTDRZ?=
 =?utf-8?B?cGVabmk4NExVVkhYZW1IS1dFRXBwcW9NZzRtMmpCOTltbTY3Snd4REk5SUIx?=
 =?utf-8?B?eUl2RU9rYTFuOFBGUDQvL2VRV3EvSzBoYW93UUNkWXE2dVVIZmh6emwrSUxm?=
 =?utf-8?B?a2c3eCtBcENsa0pLMEZJZlU4eHRZR09CT2JuSzJTRzRkMXBib0w4QTQzSEsz?=
 =?utf-8?B?NEc2SVFGV0ZtUDBJd005WEEzZnhCUi82LzFSdVZJUVQ2OWxsRVFVbWt0Qjcz?=
 =?utf-8?B?b2tKb3FZcWNTWDVhMEtIRElsZXN3cm91clFhMnhTWWdrNTM4ejE3UkdiMVYx?=
 =?utf-8?B?bEptQlFRVzdLa2tpWHIxYVNMQ0wvZjdZRlBlS09VVkdmTkFWZGZ4anlEbW1w?=
 =?utf-8?B?UHZ2NXNUUEVCVnBGNlY5YnRYYWQzUjJxdkZNdlRrRTBjV2JGSFg4NWhVNWZE?=
 =?utf-8?B?ZlhYWlYydHMvSGRqcUY4UjBKOHVobXRJT0FSTzZJb0Q3aDBaVkNTNGVBdGVK?=
 =?utf-8?B?SWxNQkJ6NEVsaHVwTVk5NHVIWkh5aGdEVWpmejJJdEtvVGhWNlByTmpIRWpM?=
 =?utf-8?B?NlpNUTgrdXBwZUtTOEJCakNBY3pZbWlFaTIvUTdaNlo1TytCdlcvQ2djeFlw?=
 =?utf-8?B?aWY3cXZyMGs2TG9YaTlWcThwaC9UUUY5VVRSYVdaN0RYamxKTTQ0dldlTzRM?=
 =?utf-8?B?THp3ZXVHdG90bkxRTXVxWkVKRmJNcTNLRmYxVzdGYS9DZTlrUGJkbWlQOCt4?=
 =?utf-8?B?MS9NSFJHZ1VrMkFvZWRCc2w4WTBtKzNkMUQ4Ry9HYldZT1h4TWtmN0pPTnAw?=
 =?utf-8?B?SytySkZicDNBU2xjWGh2cVZmT0tELzB5UjdPR2pyWXVRR1BUYzRwa3VKNWpS?=
 =?utf-8?B?d3RSUDZobnA1cnpTRkZiZVlLUDMyK241RVFHRSt0OFdQcmkzRjV2ZnNXWHly?=
 =?utf-8?B?dm1RNXlrWmh3K3d4eEpHeTBDcDBBd2RoZDJTbVY4ci9JOXZiSVZMdlBxbVZ2?=
 =?utf-8?B?ZW5qWDJoQWd0QjNlNkY3NHhGRGVwOVFIaXpRbE0xc0twNWcvdTNoZWVCdVho?=
 =?utf-8?B?Zmd0VVVubHFBYVN0RjFFK20vcnM3d3pLZjRZNk9HbStBQnlsTmsxdHlCTW5r?=
 =?utf-8?B?b3JZTzZ0alJMVUs1cGRwYWc3a1V6VDUyMy9xNUFJOE5IU1U1YTBwMlVJZCtB?=
 =?utf-8?B?a3RtTzJTY1NIY0NwZ3EybWcrQ1BBanpTUTNyOG1CZDh1T1BSQ2s5QUYzTWpv?=
 =?utf-8?B?dk1TV1hwV2dDVnZ6bWZDQnR1Y1k2SzBzTkpLcVNTMHBZRW1VeFlYVCtpYnJU?=
 =?utf-8?B?N1BPU2RXSm1vSHhIelg0S1BRUXI5NzNMZVpKak9mbnJ6T2g5eVE1b3luWGVP?=
 =?utf-8?B?bTM2cGo5SmFaOGhvVERSaHJWazE3b1hQM0JrSzhxMXlpZ2Z2NDNtcFplQ2tJ?=
 =?utf-8?B?dFRKeUVialdrUTFXY2tsem5LbG9XOFFkU3d6L3BxYUpDc1I2Q2dxaWdXbytO?=
 =?utf-8?B?SkNqa0djR2E5WWVvbXFtL2xYRzJUUWhPM0lraFNrdlhmbVFRVlRncmRrWGho?=
 =?utf-8?B?Mkt1Ukw4T01pYS9RY2w5dG1SV2lCRDBSb3VQcHA5bjk5S1JHNitmQjBNeGlV?=
 =?utf-8?Q?y/nJ6FEU3NEbOIDmW8EmIGCJqusyA6w+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3dZZWN1djRIcGNkR0xhV2FiakY5dDNLR0hRQ2FSK1BtZ3prcnpwVUdUMjZF?=
 =?utf-8?B?akFYaGRaU3liT3cvWnVQZnQ3YldCRWFMb2NUUTZpUlU3ckpEOE8xUm12ODVG?=
 =?utf-8?B?MXRxRmxrd1FhT2hyOXlvbFVBaWM1SXNDTFVvOUU5RmtzT1NjKzRmQnR5emRX?=
 =?utf-8?B?NlArdWlLeWY1UkMyY2drVWY1N3ViZXVqQlZPVHl3RjNzd2VoQUdad1Exc1RS?=
 =?utf-8?B?Z3pPUXYxQktNWnJRelFpMXZKR2JtSzJWVlVKazcrSkRBWDZhYzFYLytMYmw4?=
 =?utf-8?B?a2g2NjZSOFg4WlJXY01hMXFwcU1PZlBRQ2p2NHZ4M2R5cW0xbGNOV25QZWZv?=
 =?utf-8?B?U0VWV3pyWndZbEVZcFo0UXNEK3JXMW15ZUR2Tm4xaTBDb2V4blAzUS9rNlc5?=
 =?utf-8?B?N3YvcjkxR3JyQ0MrQUtnbUxMYUxNWlp3NG9JMUpGNDNTTGp2VVpNZ1pSUUli?=
 =?utf-8?B?Qk9jaHR2VXpsZ0lNOFREMS9BcXYvd3FvZkIzRndNNGMrTlF4VzEwWWhoUlZN?=
 =?utf-8?B?c3F2SGdtWk5oUlZ2bHlXTlVXa0dpS0xpUWwzUmdWVGZUYXlyUDNkYndJK2FI?=
 =?utf-8?B?S1lCU0N1T0tHNk90V3FsbUQrSkQ0ZXRqTktLdUttemFrZDF3NlYrc3hKNStY?=
 =?utf-8?B?dENaL3IrRDcrSEw5RFlJQk5lWHV4NW0zTFVoam0rYzBMelZBYUNvdG5CRGFu?=
 =?utf-8?B?aWUwczN3Mnk4bGJtR1NMMXg1YytXOVpsUG9wQXBWYWJoSHA4bmVNWHFGckc2?=
 =?utf-8?B?bERYSTFJMDJIODhLQjdkdEN3T0VVdDE1WHFUd0hUS0xiSm1EaG1RWWtqS1BW?=
 =?utf-8?B?L3Zla3dkbkxia2tQUExiTnZXb0NZNmlnUFhlMHlkKzhZMzRsajJVNXNYZ1V3?=
 =?utf-8?B?b2FZNE9qY28yZExuemFVekl5VTZFMlZJWXFJUVhCN1M1MEprTlZHRHhENSth?=
 =?utf-8?B?a0dKRVA4SjZGMGZKRzByMXo5MXEzOTU5NkxMeUFJZURubEVmVmhzaEJYOWln?=
 =?utf-8?B?a1QybHd1WGplcHNTd2E3TmN2VTJYd2cvUjA4WHlLaUxqenNXazA5TzNDejdr?=
 =?utf-8?B?anlFQmdnZWxYbG91dUFSR3NQYmJ0eUlNUVZSalhsY0RGZktKUWRoSmxScmxu?=
 =?utf-8?B?bk82Z3VySEZaVEVwK0lxeXRHWnZTUUdGbnJiWUJvSUhOdElvbnlYWE9pRWJu?=
 =?utf-8?B?NlJGeTdJZThoY005Z3RRdHBycHVYckJZQ1pSRDJmQ3cyamplZzNzZGQ3M291?=
 =?utf-8?B?ZlllQXQyVTJlSTN1bE5na2grQ0pVVGZlZjRKU2V6U2ROOUQwdDlIcEgxVTdV?=
 =?utf-8?B?dmpGYmZBTXlFVkdMSitFWEttMTFGS0UvS1FNWncvN0tMWDNBWTluQWZuMGda?=
 =?utf-8?B?azBDWlhEejh4WGxGV1BpY0ZyS1RFOEgxWFJ0ZXc1ZlljQm5xTmNtWHExbmxS?=
 =?utf-8?B?MlhmMTdTbnBSM3Q1SjZrdXp4TUErcndjNVBUemo1U1NwWjE2cDE3NkVZcEVW?=
 =?utf-8?B?UWJLMWNseVd2TjNYTE1QeW9qSnVXVnhFYWlEaktrRHYwVVlua2hxZ1hTNlc3?=
 =?utf-8?B?OFAyM1BTZXhvdk92ejRyM083TnRPTjN1Y1poNXZXMmsyTThZbVdTNlhsWDFp?=
 =?utf-8?B?dFlDWmVqQi9GdHc2NG1mSFVjMlVJdm9NN252bnZ1OWdWMVBWcUc0OVhtemhu?=
 =?utf-8?B?MUE4ZjNhU1FTWU1Wa1BzeGhJc3YvMHROdWNpZjBsdlp1ZStWZk9hQnBiR2th?=
 =?utf-8?B?Wkc2c3JTdlVQVHlBOUJoZDY1ZGZMVW5DcXQvcjZzY0p4Nit4YTlpSFM5WFJF?=
 =?utf-8?B?bjF2MXV5U05uL2p1VC9SdFNGV0ZlR2ZUMHFoRDRCd3pGUFVMQ05FOW9BOGo0?=
 =?utf-8?B?WFNpcllXUktlZThmR25ZVnREdWxCdU5wcmF6NEZLNUlnOHcwcjV2NFNOUVY2?=
 =?utf-8?B?Ukx4WkQ3dFFwNktjWExBeG50dS9sVm16cnN6Y1JQdWNndWNSWW9YSmZEbFBi?=
 =?utf-8?B?ZEhlL1JlWUtQTGpJV2Yrc0dsaDFIQ1ZpVTlhOFRXcGU0dVZ4WitSRXN0bTFX?=
 =?utf-8?B?YjJrSHlTYmZhOXNCck1pOTUrb05tam8vdUtreWp1djc5K2J4RFZ3Ymp3OU9B?=
 =?utf-8?B?SHJVMFI5SkplMGpyU3BvR3FtcnVrVmdpUkhVZmRuWUVrVWFtUUd4a3dzYjhL?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6589f218-08f2-4457-1b87-08de01ba0ba5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:46:11.8844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0+KL4HfcCya2OrZK3KCoL3+Xwra5C0lidIKrKIHmmHP1ooisagJ+SAufR1YRgynyhuLWoNibayWaqEI8LP7Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5863
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

Quoting Matt Roper (2025-09-30 19:56:29-03:00)
>If the primary GT is disabled via configfs, we need to make sure that we
>don't search for this workaround on a NULL xe_gt pointer.  Since we can
>only disable the primary GT on igpu platforms, the media GT is the one

I was a bit confused with this statement: "we can only disable the
primary GT on igpu platforms".

Possible meanings that come to my head this when I read it are:

  (1) we can disable only the primary GT on igpu platforms;
  (2) we can disable the primary GT only on igpu platforms.

Perhaps we could change the placement of the word "only" like above to
remove any possible ambiguity?

Given the body message for patch "drm/xe/configfs: Add attribute to
disable GT types", I would assume that (2) would be the correct
interpretation...

--
Gustavo Sousa

>we'd want to check anyway for this workaround.
>
>The ternary operators in ggtt_update_access_counter() were getting a bit
>long/complicated, so rewrite them with regular if/else statements.
>While we're at it, throw in a couple extra assertions to make sure that
>we're truly picking the expected GT according to igpu/dgpu type.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 26 ++++++++++++++++++++------
> 1 file changed, 20 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 7fdd0a97a628..0ed9ffc3278d 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -107,10 +107,23 @@ static unsigned int probe_gsm_size(struct pci_dev *p=
dev)
> static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> {
>         struct xe_tile *tile =3D ggtt->tile;
>-        struct xe_gt *affected_gt =3D XE_GT_WA(tile->primary_gt, 22019338=
487) ?
>-                tile->primary_gt : tile->media_gt;
>-        struct xe_mmio *mmio =3D &affected_gt->mmio;
>-        u32 max_gtt_writes =3D XE_GT_WA(ggtt->tile->primary_gt, 220193384=
87) ? 1100 : 63;
>+        struct xe_gt *affected_gt;
>+        u32 max_gtt_writes;
>+
>+        if (tile->primary_gt && XE_GT_WA(tile->primary_gt, 22019338487)) =
{
>+                affected_gt =3D tile->primary_gt;
>+                max_gtt_writes =3D 1100;
>+
>+                /* Only expected to apply to primary GT on dgpu platforms=
 */
>+                xe_tile_assert(tile, IS_DGFX(tile_to_xe(tile)));
>+        } else {
>+                affected_gt =3D tile->media_gt;
>+                max_gtt_writes =3D 63;
>+
>+                /* Only expected to apply to media GT on igpu platforms *=
/
>+                xe_tile_assert(tile, !IS_DGFX(tile_to_xe(tile)));
>+        }
>+
>         /*
>          * Wa_22019338487: GMD_ID is a RO register, a dummy write forces =
gunit
>          * to wait for completion of prior GTT writes before letting this=
 through.
>@@ -119,7 +132,7 @@ static void ggtt_update_access_counter(struct xe_ggtt =
*ggtt)
>         lockdep_assert_held(&ggtt->lock);
>=20
>         if ((++ggtt->access_count % max_gtt_writes) =3D=3D 0) {
>-                xe_mmio_write32(mmio, GMD_ID, 0x0);
>+                xe_mmio_write32(&affected_gt->mmio, GMD_ID, 0x0);
>                 ggtt->access_count =3D 0;
>         }
> }
>@@ -286,7 +299,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>         if (GRAPHICS_VERx100(xe) >=3D 1270)
>                 ggtt->pt_ops =3D (ggtt->tile->media_gt &&
>                                XE_GT_WA(ggtt->tile->media_gt, 22019338487=
)) ||
>-                               XE_GT_WA(ggtt->tile->primary_gt, 220193384=
87) ?
>+                               (ggtt->tile->primary_gt &&
>+                                XE_GT_WA(ggtt->tile->primary_gt, 22019338=
487)) ?
>                                &xelpg_pt_wa_ops : &xelpg_pt_ops;
>         else
>                 ggtt->pt_ops =3D &xelp_pt_ops;
>--=20
>2.51.0
>
