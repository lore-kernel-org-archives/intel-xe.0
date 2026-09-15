Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8474EC88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 22:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB90A10E46C;
	Tue, 15 Sep 2026 22:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifItzWii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FEF210E46C
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 22:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789513179; x=1821049179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Eya8rJA9gIB9kC0OL+HHm/qxZIemOvoFv67ya4arxs4=;
 b=ifItzWiiMgDYxgWmiSn3hjpDFkeVHFZgKWIWEPHPbJuNVrD/zrCPfb7z
 QZY7yXfAb6kVi3JcUgC2XzQZpXct3ZswXJVU+2WRRnNKwDb18AQrva3/x
 W9mLC2s9ayBSEeoKpsFfCGhsq85DuKjWfaDT/p5123dYoPfpdNfW3f40y
 dWT2fXn5gFl6KLrBR60KXFzcJoAkiXDTWCjtpCpgA6lUXzLaeEOrXzKh6
 vmc6UtYnBjQv58/0cein2VSPgPVOuEmJe73EgNE/BsWs02GBR4kDEUEsB
 b8TecEMDbmgeynwtWOy79Ex1dUdWg/qn1PCsywhhxNk2c9HudpZFXg0tp g==;
X-CSE-ConnectionGUID: eMk4uLChRce2+OqqofQSAw==
X-CSE-MsgGUID: vnfWe2bvSfqhN1ntK7c/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101234895"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101234895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 15:59:39 -0700
X-CSE-ConnectionGUID: qjZzatCeQgmv+oRAHsfc3w==
X-CSE-MsgGUID: KhuWgl0WTLmo4dC3rhmZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="278397446"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 15:59:39 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 15:59:38 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 15:59:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 15:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFhxT/Z3n8aFJqvQf7eQxVEAgM5Qq1K0nCSJ1YhDG/jFX0E5w3c2zFmEClUELvoDbCv5rIWzmC6xAXIr1YGDkHxsJ0V8TVGwDRFnIeZT7wxc/oTniEpIVbHxKiZ9zjTAjWQXoSwkr8Akg4IpXkRWXejyEjbEmjvChk5MPTLVpBtw07pXbsByj8U9Xhuvuc90O/LwFRERz48PDy1QITcb7f0q7A9A7sSfP4k4GXgzkODleytGtVO5TGPm3XPrserumhL0TqLOJVZx9qEGCKa9fm/4plZHuBnm6rQuewU6ci/A3nqxENq5ZCNEgikFXFCyVyq08JT/H9r6eFhlIRdV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bdVyaqUofyu0KqMlhVQ2RNjU8H94lbOtQ9OGenmIyM=;
 b=Cb2ntuMb5QkZmbz+MADzmJlAJdbUOLL3ayyMHFgBCVHVV07DTFQGNWlA6Lx9Ni4WiZv5p8lxIvJf8/TMuUvvI1yTZd8ASQb7K2SFa3SvsF8osmU7EMA1Rs8HrdhNkxqV8MFUjQXLDfgaIWn+6UsYa+zvSs0DZA6eBb4rGfeSLtmCLXUoa6NV14fte7zvtWUYAyeDJt62BwWifELYmX0nPcL/F0MiawkJDmT3rodRLPUlwK7NYqpRTpdDOq5GDPQMPYVR1IbjJWpMrmZnCXFQ8a+nFP/EADvwmhmwzhienqzE59Rj/OUr1xhi0XseDFHQXNKwD7h/e/7u8azwl8BRYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 22:59:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 22:59:28 +0000
Date: Tue, 15 Sep 2026 15:59:22 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3 2/5] drm/xe/guc: Use different error codes for CT errors
Message-ID: <aqnNykdW8AeYUzpG@soc-5CG1426VCC.clients.intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-9-umesh.nerlige.ramappa@intel.com>
 <088c7152-3776-4670-b939-c1fe558e0381@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <088c7152-3776-4670-b939-c1fe558e0381@intel.com>
X-ClientProxiedBy: MW4PR03CA0312.namprd03.prod.outlook.com
 (2603:10b6:303:dd::17) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 3522e44b-5465-4522-93fc-08df137cfeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: yGFmcSE0ZsQwpz3kG/XckZKiSGt7qR2uMmlLvH88MaH3hfF9tntFM43zTtllZuteQTt7M5XYrTzGDc+LYF4Zxq5DYPm6mYpipOl0tHGFifvGFRdvGIkbEUqXUL5CuafLwXXBzc7ul4k7UO0IIey1ID96z4Gf934sELY7glT2ubF7LyZ0JPTxCrtJ54mNV4L3ywoTiZmdOWCVtC5j0aEDumr9RPj5YMSlbHMke6CSlbDzLsBik5Lm0h43NtFNiLDiNmXAB2+Wql0EMTANUYEa+ZJUmlJ9ij4j+wz+hjGVel8tibRGwmNBRtcEER+OidurV33L1Oz1TmygPcB+V7SD/QUsDit+i1weh83f7FYZFW1aexQZIC9gtG6+BK7BgIpOMwDGI4RrHQQ83D6ulqE8MkXbx5Y2tC2ubTOJBv/j3e0UPmFYNNqijNxjrA2MeUs9gIzps3pM2fmBOMZV6l9Gcb8mvAo338vXuEoRHd1aJEVQDhkobFJmTSniI+zOkddWZt4Zi8R1/P3UVzINypiAMy/ncab8RianbEW5eUOb0BaYj02ZAAZ2wo7NeR1Ev/XxjEuTNK9ReQRapq37mDmCnx9HNPOF2dFIze6i0qX+NnkSn4Hl4+J2+MwufC4eJ76KI+lsLlz8ZjXhy2n7fX9G4aZ9IJFOvKEjj/g74YKolbA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2MvalJWUE1yenhPS1NBOWZLRHlocGRSS1lCTmFPSGNJbkxMRSs5dlQ5dnIw?=
 =?utf-8?B?WUVLQ1BZV0Q0RVNhTGVDb3dLbTRWUmZaeGdFQThFUmhqeVFQSTJUTEZPT0Zx?=
 =?utf-8?B?Y0J4ZGEwNmdsODhIVmRNY3VpY3UwNWV2SWtPQ011ZXdXeVNIVW1QNkNPL3c0?=
 =?utf-8?B?dnRYcWlTNFpSK0ZNZzJxT2Z1YmF2TUVZZ204aG4wTTVyOXNLNHFJV1hESUMw?=
 =?utf-8?B?cWN1Znl3RHNDTUNBUUNFbkdQVjFyb1BJWWliNXdUMDU5MU5LNVZNU0E5aVBq?=
 =?utf-8?B?ZzZFVGtDV1hlU015TTJNRDB2d0EraEdVRk5OUWpNZ2diRFI0aGU1ZkFnQVoy?=
 =?utf-8?B?MGg5eXg3c0RqdzBSTWE4TVNNY3IxdG5CNFlhQk5VWmlrT1FFK3BlUVVoZjZa?=
 =?utf-8?B?VVBtRCtVN2RZcUg4cGM5cGpldGltNFVqOTV1T0hwVUNQdU9LMm5hRFo4ajhF?=
 =?utf-8?B?MjNEb01LZkhjR0FxUmdFQlpQZzRGb09HZjBFZno1aG9Oa2VJcG02eHNXMVB4?=
 =?utf-8?B?dXRHZGs3T25HUitBakxUQ3ZnL1NoV1NqbVFjMkY2MWZJMXRvaFk3YjhFa1hy?=
 =?utf-8?B?OEtKQjE5THB5dEZXLzZvS2J0NVl4YmVDNnF5WHZmblpWb0o3NWtPYmdlV1Z2?=
 =?utf-8?B?bGE4L1lONWFMQVBvTHJNT2FjenB5ai9pZHZGSmRLL05WT1BHd2FPTlg1akxB?=
 =?utf-8?B?c3Q5N2ZUaVE1ZEo5TThvTEN5VEdXaklGWXY5M1llSkNFRngwVE9wZ2ljbHVy?=
 =?utf-8?B?SFhGWnlHeE4yZkR5WTkzMStVeUxvb0N4MTlMTTRSSVlVelFDVlVBUVRtaFY2?=
 =?utf-8?B?RWlKVm5LWjRBRU1UenNEL2xoa0xtYVM0MmFSdTdQR3hrVVpKeUdNM0I4bFFk?=
 =?utf-8?B?a3Yranh0Qjl3RzVqSWlja0E2K3FPL0xQRWdzK3VqZzhqKzdSblFnU3RDNDNa?=
 =?utf-8?B?d0lxYVVhQVE5dUxrSHlqRGpPL3NwUFFrVW1kMk9keHNZbG9sZndPRjdMbTdp?=
 =?utf-8?B?QktMV0h2Z1JMNklzWE9XcTFIU1hGb1JhdFVmbkpMbUpySElFUjNVSkJ0TUxR?=
 =?utf-8?B?ZEVXcGJsUks3Y1I3U2huYlQ4RVV6aFBUcHBKTk8vNzJBTzNVSFExYnlaNFgw?=
 =?utf-8?B?QWlBeENxZ0tuTGsyV3U1aHJYV3g4dWpwUG44RUEzcHUveEJWOXNaRGJsNGNM?=
 =?utf-8?B?SjBKVmRIdmU3SEEwMHN5Q05PMUR5cDNrbVc5VTNhd0hqZC9QM3RBQUp2ek9r?=
 =?utf-8?B?TkR1cWlmK1RQZVBXU3RSS2VHcVQ1MjY2UUdJTHh0WXF3cUJNUUtYTGx4dDVo?=
 =?utf-8?B?LzJoYXZZVnk1ZS8xUGJjYm15dVNQY2NIM0RTTW0vUHc2WGRlWnd6UFFlYUFT?=
 =?utf-8?B?SU1KaDA4ZGVzdDd5a3B5NGQ3K1ZPOHVLbFRXMGx4ZVFhVzV3Uy85NUNLVmdC?=
 =?utf-8?B?VnEwQVZzUkRmNUNPU3k1ZnZ2UjN2MEd1TWNWMDZBbFNpTm0yQlBWTENCQzEz?=
 =?utf-8?B?TDNKSTRjc1I5aFl0R3h3cUpscWcxQXRzMENSc3o2aVJvSzFLT2loMmVkcEp6?=
 =?utf-8?B?RnVuWUJvUE1CVk1FcU5xcTFoRmxRMDJzSEhNQktvaENlUExGTW5mSjV5b3lk?=
 =?utf-8?B?NjR5bk5GeFE2SEtIVk8wS3A3QXpKZDIxd244SVZhVnhkZm9FcXpLV0hYNW9w?=
 =?utf-8?B?SmVOdnBjWjhDcXZRN2lWZWxuL1FtSWJIUzJ0ejlFYzh3c2pEcU9ZSENSVTFV?=
 =?utf-8?B?bzhWNVhsMzVMc2JYUXQ4dHM1cHlPcjJNZTF1UE9ZQXp4TEkyOHdrUkI3Z1Z5?=
 =?utf-8?B?d2dqb2paRWdIQUQwQjdjclNuNkVqUUx6L1BsVXRNZGpZcDRlRzBNT1dMMmI2?=
 =?utf-8?B?R0xsSkJCTk5XV1RaalJmbDd0T0dwT1JPa1RITHZYbzkwcEgvT1VSNzVka3ZY?=
 =?utf-8?B?V2dtUzduUlpCV0drSk1jY3FrWnpBd0tEOFpIVU55WWVuNm0zcU5RbGM3LzFV?=
 =?utf-8?B?Rmx0SmZQQXpBYlZQNnV4K0pDa3ErRmhsN0FaQzU2eEJOVkxSMHVDbUZON0N0?=
 =?utf-8?B?cGcvN2szYkRXbGJrM1VNaXpqYW5STGxiOFFPNXFLK04vRTFVRXpmVExSOE1N?=
 =?utf-8?B?T3dPMGlVOEhENVZiSFdwdk4zM0VVNGJLelNHSXVEWmxmNlpKVjhlZEs2OUZG?=
 =?utf-8?B?Vnd5aTJjQ3FWLzRFTjJEaktCZ3BkODZ4Z2VaT1gyWjB6VzVGelJreFlpNjRD?=
 =?utf-8?B?a21wTXZ4bTJERjV1L0I0Q25qb1dScm1peE50UXA5SWJZRnpiay8vWWdPQmIv?=
 =?utf-8?B?R0kwNFNZUE42RWpJZnlwUDJvcG50dDQvZG50Q1BsUllXaGh0cXVuOFZjR2dH?=
 =?utf-8?Q?P24u7PRJQa5F887lIWWXsPHhPTSVClnkpZx8G?=
X-Exchange-RoutingPolicyChecked: MBBe1JlEirFFJRZ2PX05MqEG74bScVvBEhM+mpR2oIxtcp/a5vvO4oKJ73x+z/rVBny/A+AJObvAe+JzfG13/Yb38YAXig97P67KD5zI7RGahBJ19uRy1TY68iZt1M/6owAnJlWZCJFSGDTPd6xktjxpGowU2ifASgIggHxOwzOEKj5mX2C/EOD04vq7p0SwRZL+11WEcN+OTO5aTPg5Aj40w0/8XeVebw+HEtebbIWkpAJ63Ue5ssliLm82Rk1gfmFoR7ML7P+3I2sqtlEMxRxREFTRMOAgHZ+T7WJA/ByaK/5Y3WMRfkjXLudAugxyc2zhU4RoHItnk5cBSJA4ig==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3522e44b-5465-4522-93fc-08df137cfeee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 22:59:28.5575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UsJ2vm3dR/NE1OvR/pSfcj4hPRBG7bdK7tbtbx2yWgeBWKJ0xzlIYhXSvMP39bOh7w5UNKfIUN3ogHip8XFJZPY6wMQV9ubFquNWKR0OAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
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

On Tue, Sep 15, 2026 at 11:49:43AM +0200, Michal Wajdeczko wrote:
>
>
>On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
>> Instead of always returning -EPROTO for most errors, use different error
>> codes based on the error type. -EPROTO is retained for the cases that
>> are genuine protocol violations by the GuC.  The remaining cases now
>> report what actually went wrong.
>>
>> receive_g2h() used to escalate to CT_DEAD + kick_reset() by matching the
>> two error codes that dequeue_one_g2h() could return on a fatal error.
>> Invert the check to simplify reset handling.
>>
>> v2: (Michal)
>> - Sync order of errors in g2h_read and __guc_ct_send_locked
>> - For CT errors use EPIPE and for HXG errors use EPROTO
>> - Convert the non-fatal EPIPE to EPERM in the helper
>
>nit: move change log under --- line
>
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Assisted-by: Claude:claude-opus-5
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct.c | 51 +++++++++++++++++++++++++++-------
>>  1 file changed, 41 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 5c4733da385c..c5a417fef913 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -947,6 +947,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>  	u32 cmd[H2G_CT_HEADERS];
>>  	u32 tail = h2g->info.tail;
>>  	u32 full_len;
>> +	int err;
>>  	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
>>  							 tail * sizeof(u32));
>>
>> @@ -961,12 +962,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>
>>  		desc_status = desc_read(xe, h2g, status);
>>  		if (desc_status) {
>> +			err = -EPIPE;
>>  			xe_gt_err(gt, "CT write: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>
>I'm wondering if maybe we should introduce helper:
>
>	int ct_corrupted(ct, const char *msg, ...)
>	{
>		va_start()
>		xe_gt_err(gt, "GUC: CT: %pV", vaf);
>		va_end()
>		CT_DEAD()
>		ct_stop() 	// ?
>		kick_reset()	// ?
>		return -EPIPE;
>	}
>
>and just call it instead using goto?
>
>this helper can be later reused by g2h_read

kick_reset is not called in the send path for -EPIPE (like you mention 
below), so not a whole lot of reuse we can do with the helper.

>
>>  		}
>>
>>  		if (tail > h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -EPIPE;
>>  			xe_gt_err(gt, "CT write: tail out of range: %u vs %u\n",
>>  				  tail, h2g->info.size);
>>  			goto corrupted;
>> @@ -974,6 +977,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>
>>  		if (desc_head >= h2g->info.size) {
>>  			desc_write(xe, h2g, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -EPIPE;
>>  			xe_gt_err(gt, "CT write: invalid head offset %u >= %u)\n",
>>  				  desc_head, h2g->info.size);
>>  			goto corrupted;
>> @@ -1044,7 +1048,7 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>
>>  corrupted:
>>  	CT_DEAD(ct, &ct->ctbs.h2g, H2G_WRITE);
>> -	return -EPIPE;
>> +	return err;
>>  }
>>
>>  static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>> @@ -1067,11 +1071,6 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>  		goto out;
>>  	}
>>
>> -	if (unlikely(ct->ctbs.h2g.info.broken)) {
>> -		ret = -EPIPE;
>> -		goto out;
>> -	}
>> -
>>  	if (ct->state == XE_GUC_CT_STATE_DISABLED) {
>>  		ret = -ENODEV;
>>  		goto out;
>> @@ -1082,6 +1081,11 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>>  		goto out;
>>  	}
>>
>> +	if (unlikely(ct->ctbs.h2g.info.broken)) {
>> +		ret = -EPIPE;
>> +		goto out;
>
>to be fixed with -EPERM/-EUCLEAN, or ...

I changed this to EPERM

>
>... maybe this should be just xe_gt_assert()?
>
>IMO we should immediately STOP the CTB once we detect that CTB channel
>is broken so we should look for STOPPED status rather than info.broken

Maybe, but we don't do that right now. Probably a future improvement.

>
>> +	}
>> +
>>  	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>
>>  	if (g2h_fence) {
>> @@ -1809,10 +1813,12 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  	s32 avail;
>>  	u32 action;
>>  	u32 *hxg;
>> +	int err;
>>
>>  	xe_gt_assert(gt, xe_guc_ct_initialized(ct));
>>  	lockdep_assert_held(&ct->fast_lock);
>>
>> +	/* Keep in sync with g2h_err_is_fatal() */
>>  	if (xe_device_wedged(xe))
>>  		return -ENOTRECOVERABLE;
>>
>> @@ -1823,7 +1829,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		return -ECANCELED;
>>
>>  	if (g2h->info.broken)
>> -		return -EPIPE;
>> +		return -EPERM;
>>
>>  	xe_gt_assert(gt, xe_guc_ct_enabled(ct));
>>
>> @@ -1840,6 +1846,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  		}
>>
>>  		if (desc_status) {
>> +			err = -EPIPE;
>>  			xe_gt_err(gt, "CT read: non-zero status: %u\n", desc_status);
>>  			goto corrupted;
>>  		}
>> @@ -1871,6 +1878,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  		if (g2h->info.head > g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -EPIPE;
>>  			xe_gt_err(gt, "CT read: head out of range: %u vs %u\n",
>>  				  g2h->info.head, g2h->info.size);
>>  			goto corrupted;
>> @@ -1878,6 +1886,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  		if (desc_tail >= g2h->info.size) {
>>  			desc_write(xe, g2h, status, desc_status | GUC_CTB_STATUS_OVERFLOW);
>> +			err = -EPIPE;
>>  			xe_gt_err(gt, "CT read: invalid tail offset %u >= %u)\n",
>>  				  desc_tail, g2h->info.size);
>>  			goto corrupted;
>> @@ -1898,6 +1907,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>  			   sizeof(u32));
>>  	len = FIELD_GET(GUC_CTB_MSG_0_NUM_DWORDS, msg[0]) + GUC_CTB_MSG_MIN_LEN;
>>  	if (len > avail) {
>> +		err = -EPIPE;
>>  		xe_gt_err(gt, "G2H channel broken on read, avail=%d, len=%d, reset required\n",
>>  			  avail, len);
>>  		goto corrupted;
>> @@ -1950,7 +1960,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32 *msg, bool fast_path)
>>
>>  corrupted:
>>  	CT_DEAD(ct, &ct->ctbs.g2h, G2H_READ);
>> -	return -EPROTO;
>> +	return err;
>>  }
>>
>>  static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
>> @@ -2042,6 +2052,27 @@ static int dequeue_one_g2h(struct xe_guc_ct *ct)
>>  	return 1;
>>  }
>>
>> +/*
>> + * Errors reported by dequeue_one_g2h() come in two flavours: either the channel
>> + * is simply not available right now, which is expected and handled gracefully,
>> + * or the channel state or the message itself is inconsistent, in which case the
>> + * only way forward is to declare the CT dead and reset the GuC. Since the
>> + * former is a short and well known list, check against that and treat anything
>> + * else as fatal, so that new error codes don't silently escape the escalation.
>> + */
>> +static bool g2h_err_is_fatal(int err)
>> +{
>> +	switch (err) {
>> +	case -ENOTRECOVERABLE:	/* device wedged */
>> +	case -ENODEV:		/* CT disabled */
>> +	case -ECANCELED:	/* CT stopped */
>> +	case -EPERM:		/* CT already declared broken */
>> +		return false;
>> +	default:
>> +		return true;
>
>shouldn't this be other way around?
>IMO original fatal errors are:
>
>	-EPIPE
>	-EPROTO
>	-EDEADLK
>
>as once we hit them, we should trigger a RESET (which will then
>result in cancelling all pending H2G with -ECANCELED, turning off
>the CTB), so any new CTB request will get either
>
>	-EPERM - already stopped
>	-ENOTRECOVERABLE - if recovery fails
>
>> +	}

Correct, the default case is fatal above and returns true, so it matches 
what you are saying.

>> +}
>
>maybe we should document in a separate DOC section all error codes used by the CTB?
>
>	-ENODEV = CTB disabled
>	-ENOTRECOVERABLE = device wedged
>	-EDEADLK = CTB deadlocked ==> RESET/STOP
>	-EPIPE = detected problems with CTB descriptor/channel ==> RESET/STOP
>	-EPROTO = detected problem with CTB message ==> RESET/STOP
>	-ECANCELED = pending H2G cancelled due to a RESET
>	-EPERM = CTB already stopped
>	-EUCLEAN = CTB already broken
>		btw, should we ever reach ctb.broken?
>		shouldn't we move the CTB to STOPPED state before?
>	...

I will put it in comments in the beginning of this file.

>
>> +
>>  static void receive_g2h(struct xe_guc_ct *ct)
>>  {
>>  	bool ongoing;
>> @@ -2079,8 +2110,8 @@ static void receive_g2h(struct xe_guc_ct *ct)
>>  		ret = dequeue_one_g2h(ct);
>>  		mutex_unlock(&ct->lock);
>>
>> -		if (unlikely(ret == -EPROTO || ret == -EOPNOTSUPP)) {
>> -			xe_gt_err(ct_to_gt(ct), "CT dequeue failed: %d\n", ret);
>> +		if (unlikely(ret < 0 && g2h_err_is_fatal(ret))) {
>> +			xe_gt_err(ct_to_gt(ct), "CT dequeue failed (%pe)\n", ERR_PTR(ret));
>>  			CT_DEAD(ct, NULL, G2H_RECV);
>>  			kick_reset(ct);
>
>hmm, it looks that during send() we kick_reset() only for EDEADLK
>error, even if we detect broken channel (EPIPE), right?

Right. That's the current behavior

Thanks,
Umesh
>
>
>>  		}
>
