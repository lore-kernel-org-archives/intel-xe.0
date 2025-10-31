Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD0CCCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 13:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C0410EB3A;
	Fri, 31 Oct 2025 13:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cASy55wM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E789410EB3A
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 13:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761917610; x=1793453610;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DOjgy6jvuBKUTSy1847DYS9o389VM7SqxSfkoFzvP2A=;
 b=cASy55wM6nTcH8bphCSIdugo+wnnC/c3BeVGNDfH3ZBPKPvVQzZqahTD
 9z2V7WrBVY2jH9l3EUFFjc6EsFnUHfG+hP6Oljbvr4vHv+GUMV1L6mp3e
 i0ZXwtx3pcrrQSO69aproBXdmJdcIkznPJIDA830ciRiYBXeisEFw0hxv
 Ueh93YyOnEmDvHCArjMaXvIv8sZJJN+DzIcT7sfHngtSLPE9Mi5U6cX0X
 1+qn4GoM4P/BIqpWH0JX+8aX1NLUTMqFB7MVOYnfzu4jDNJKzMEog/OS8
 uZvPqUfnYuML3FSCgvjFDF5mBJ9nbz4TlBxSz8rRNzPLT4kqXPIhg1sIw w==;
X-CSE-ConnectionGUID: G1P/ufAiSJaIqx8Jlz6GtA==
X-CSE-MsgGUID: FR//cSOMT9OEkwIMNRKsKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64005167"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64005167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:33:30 -0700
X-CSE-ConnectionGUID: 0fL8zPeWR3KlovldGWBv1g==
X-CSE-MsgGUID: cKLNsMs4TXenIW4ycnbUNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="223472878"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 06:33:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:33:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 06:33:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 06:33:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4E9aFClUdWTrL1aSqZqGWdJ4GVQkjAALWkG8KjwFHefcKIJCOPgNz2TEiW4+j0GbFlURoT/Dhbfyiu5rJke+J8aj8HMkAjqy6Y0OuO6ED7BDfFQjOkY+S95B6ry8ZGVLGhEoxDOy5cuiMlj+88zyArR1mQNdeplvX1CuAHZK4f6DPGb1NK5TDR3XrxKsyvmeYpAwpUPFCj2qlz3XnX6u0+mRB/IwEHazOik5npEQoSW7nB4G0gZk5iaXaBKXm5ZjpaakJdASAAF6VbpEx0kT6nHFPSSFApQTrrBsmPu5K7OkuD9FNpmxqUZJBPQf7MVOEGvpy9uEz/jDKS7JHW78Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gNIaXPjJ4Y4zqVCti+nl0itOENPp4Q26vNAD49k9L0k=;
 b=yGtqYmCfBEKwSFd/gfh7lHhfq6lBM3g9hOq8bQs2geMGVOoyf846tXt9b4ul9vpGHnBSfiIc/3VeYsevqOIyCG2Ju2ctAOKf5YdY/C79lP6fxF7ehDSMvp264m/LWWl2QOA8VGOtb1Aueb4xUfQKrz59m1lZox9eLMiE0v3T96axSgsODoRIC8D2efyZFSlCMyijzpocTh/CUA9z8Y3ts0Fk+GASGDIndjh/1XTSwab4Pa3KG0hclPC+XZ861CKkV4u2LfY64E8Ow5pZr6GCE9grvRA+vFcKtBB+5hCSJpBbPS++z+jpx0K5Wq20teYaegkPX09hOUs7cWqyuthdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 13:33:27 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 13:33:27 +0000
Date: Fri, 31 Oct 2025 14:33:02 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v3 1/7] drm/xe: Stub out new pagefault layer
Message-ID: <aQS6hgtqWvaIglr_@fdugast-desk>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
 <20251028035843.2488613-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028035843.2488613-2-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: BE1P281CA0359.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: 282a42f7-75a4-4c8c-0499-08de188212a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDBIenhxUCtMeUVvMjdpQmRTVW5id0RnQnFVakVLTjgwNUZmTjZKdUtheGVj?=
 =?utf-8?B?dklQa1FmN1diUUlBVWJIVjZ1UlByeHcwazA2eVRuVWNsQkYwU0dKLzBJclVE?=
 =?utf-8?B?RmlLN3hqb083OHNwak41NHdURmhaQUF0QWczTXNXcWx5UUhVcGlnVFZMeUZp?=
 =?utf-8?B?K29kR2MzcFJGTitsVklKcE1CMWNmYkUvd2s2RTZxaFdmWjU1ZStRQkZndzR1?=
 =?utf-8?B?WHZQTC94ZzFGK09YVDNzdnlIaXJpVGZQN1huT3lhc1k0dGIrRmhHaEtSNU9q?=
 =?utf-8?B?WjA0dTFYZmFrTkVDNHZWSHlxalVCRWUvMU9sSURZeUdaR2ZpbW1GQnVsUVlq?=
 =?utf-8?B?M1JJM1k3UnJhUEtlN0Fqb2xVeWlUaThSVm1RaVJVR2NtREIrNGlzcXBzZmpP?=
 =?utf-8?B?SStMS3VrdUNzQ1NqVWdPbkR4cm9Ec2ExekcwcmRqUWNMSEFzbnBnY1JQMCtQ?=
 =?utf-8?B?UU05UGJ1Q2twVUs5VUdIRkRjY1U4Z2hFZzcvT1dSZ2V4WG5yWjBzUUd2aHpp?=
 =?utf-8?B?MnVwMWNGMXVCQUdjSk5Xb0lhMXZ4ZitsRXJlQTJRTnUxN2tzYjkzOWpSYUMy?=
 =?utf-8?B?TjNVV0h1NmgxelR5S2dvZHI1cnRuakkySjJtOXNTaUtYLzNyQWsveXZ2UFoy?=
 =?utf-8?B?cTlCNnpPcjR2VkRLZDhzb2lFYVA3THdiQkgrZHlockZYSHBOdVl1QmZxQVlw?=
 =?utf-8?B?aXN5SFVHblFMaWV3ZzNHbk52T0haakxKUm5FNVU5OUZaMTVuYzh5aGpjWFVD?=
 =?utf-8?B?QW1US3BrdUtNcU9tYkNzRE8xQlRhSUplSC90RXpSM3JzOGNtZ2Z0dUxWbUtL?=
 =?utf-8?B?VTN6bTFza1VWUTdCMnhDSEhzdVdyMWRmYjJqc1czNWdkRVNaYnRvQXBZMEZz?=
 =?utf-8?B?RGN3cEZxTHBvOXM4aWJmTEFLTlJGdmN0MXphc0hmZVIyUXRTNUV4czRGaDJu?=
 =?utf-8?B?K0FOeU9lZ2VlTWdQNTY3eHRrazBoUk1scStTdGptd3NmS0JRMU9QR0t1M21t?=
 =?utf-8?B?MUtZbWVKVjZkSVpucE9iRGJVVmlCQWJLUEhkcmN2dlp5RG1RVGNqZy9vMXRY?=
 =?utf-8?B?RTZXVmRwN01kU0ZyZDE3a1A3c1Q5QnNtSk50bkFDWmR3SDJMclZFVHRGMUZ2?=
 =?utf-8?B?OURlT2RkTXl4eUFqNUZldFNsRVJsWjg4NWN3K0xlRG5iQjRTem42R29FMkhr?=
 =?utf-8?B?dVhud2k4elVnNnRlUENmQnlld2JZbzF0WXBpVDI3NktTdlNuNG9CUG9hS2JC?=
 =?utf-8?B?Sm9yNWZjYTBhb3dmam1RREI3SUZuRVlDSTUvZDhsL0ordnZDbjQzZkx6RzVq?=
 =?utf-8?B?Z0E0TlN0aDlWb3g0N2I5ZEc3WWtBbGQvRVRZMkliWjBxQlRUYnhtVHZpak5K?=
 =?utf-8?B?dHRiSVlzNmxyZFRzQytxSlh0Vjd1QTJ6OU5nUEcyQU8xV3RBT0piQkErdTNX?=
 =?utf-8?B?L2FuMUU1NFhMYUJiUGVsc3JqclQ4TzNiWWZUd0JpV1pxRVBESTFkRGFhQWt3?=
 =?utf-8?B?S0NZRG1QWXJ3cVJVNTQ5ME5RNU9kcUlvNUY1cENPMmRmckJnQy8yWDNvNXdP?=
 =?utf-8?B?MU5LY1lONXVGNWRWRWhzbEUrZk52WjNwc0RDQ3ZaZ1NWUHYxdFNCZmdkdDdE?=
 =?utf-8?B?K0JEQThvaTdDQ1kwbjduK1oxYTRMWmNOS3Zkam5sR2dUOWxlSy9reXEzUDk4?=
 =?utf-8?B?T2x6NmRWaytzWEhPdFUvb2ZKUEF2ZEYxZTI4WDRJRFBGK21NeXlNamhYQ01y?=
 =?utf-8?B?YWs3c1FmUUtUL3A2eXEvUjE0UXljSTFDNjlTSUlTMGt4YmR5aFg4UWM1Mlc4?=
 =?utf-8?B?WTdLVy9paWhNcTFPMkpVbTJMUlI0TkRzU2RSMFJST2tXWG1LLzFHQXcwQTJN?=
 =?utf-8?B?eVdUL29uemRKbVp4NmVZd0tDRkFZSkJ2T21jYnY3Nk9kSUc2YnJoWmFraG51?=
 =?utf-8?Q?/STBfsYnB853Y3/DGGxsEXOc5/rzXjJG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUNyRDVBYzByeXVzaCtLaVY2TjlUazVDR0pjaFNwL29VTGlWQjZXVThET0t1?=
 =?utf-8?B?T3o3SGNYVkZGWnI2MElkaEdpNC9aa1dpYisyNGxuaXQ4RDR5N0ZqTVU0ODR6?=
 =?utf-8?B?V0U2VTRoYU1scmlHcTA1c2poWldXMU5QWEtPR0k5eG5XMVlFdjNST01wNGU2?=
 =?utf-8?B?TGpUZHRaYXJIOU9FY0FmUUpEU282cnJKNm55NXM5NSt3UVFSMktVaTBxamJR?=
 =?utf-8?B?dUYyQ29uR2JWbUFpYVg2d3pJbk1nY01IVnNFWkdCcERsQTlBdmxwUzBEU3ps?=
 =?utf-8?B?a0FxTkltTFFpcm51SEpPcUQ0MFMrclZNQVF6cTRFVUVENmNxTGYyeGlKVytC?=
 =?utf-8?B?dFkyRVBUTnlYMEVaclVrSzRBRXBUL2psYlVpZXFUQWUwekpCMkcwV1d6MnNi?=
 =?utf-8?B?dlF2QS9aUjliNldzcnpoRVh4YjZCYTZYRUo2UkppUXJLRC9oUEMzQmxjdmVq?=
 =?utf-8?B?TFdNNGwyZWdCUEhnVG03bFNJU2dxZE56Ry9iZlJ0RkJSUHdtNVNDbE9Sb3FI?=
 =?utf-8?B?dzVZcTh0ei9udHhxWi83QWpCVEl4RjZFa2RQcDVjNy9TT3N3YU04MnIzNVli?=
 =?utf-8?B?T3BkWExnaHZIZUYyMXI3TTJGY1dKTkdDS2c0TkE1Tk1qb2FhV1NzeTIyTGtt?=
 =?utf-8?B?blhIQzdwRE0rdnpPcjk2a2VBYzVlQnBtNEpJLzM1TXVrdHBYWFZiZkdEY1V5?=
 =?utf-8?B?bCtWanB5ejU5c25wbkppcis4bkl6NTFTNitUT0NrYklIQ2d4ZGE0QkM0RTVF?=
 =?utf-8?B?cVRnQ0psWStZYnFld3UzUStyVWs3UVlSNGNseTFRZjB3bWtnZWtwSjJ5S2N3?=
 =?utf-8?B?UVBwMTU1T3AxR0NEMVVlbUdhRGFWa2poNkRoQTVBYVBVVEFTbGd4V0NTNjVF?=
 =?utf-8?B?bXZRcVpGbmFjNDNRZ2Rmd0Y3MmdhbW5odWZ1NGZiNFVEUFdLMll1bHBJODNh?=
 =?utf-8?B?cjAvVFI5RjZaMWxET0hhODdVejQ2OWtuWlFzTjJOTEcxWGFOZmhJUFU3UkN3?=
 =?utf-8?B?Q2xKM0xEakRmdlE2SUsvaWx0dE5Zd0NPZ0UrVm1HMTRHZlU0MWJOVHdGQURq?=
 =?utf-8?B?cjlBOUR6YVdDclBtMVEvUFRiK1FkT2k2alhBeEhVYWFJRUV3TW1Hc1NlWDE2?=
 =?utf-8?B?MWk3d1RIYW1tRVBXT2ZDQSsrc0Eyd09DYTVGYW16azBHaDF5ZlVSNVd0UXlQ?=
 =?utf-8?B?MDZRaHJoV2Q0NXZXQU1YNWV0OGp2STQ1dXFkZ3dNaFA2R1YrcmRQeWdIMnJs?=
 =?utf-8?B?WXhJemplWkk5T0ZSNHVLQkh0VXdQRFUxL1loVExoU2RmeVVONVBNc3ZKdFl3?=
 =?utf-8?B?ejJCSnBUYlBBZEdZTlZTK1VScHRpT0MwNFBFaWVRNjNFeHpvTENrZ1hhNW1j?=
 =?utf-8?B?aXRsb0pDa0pkYzFMa1RtdjhEbWFQdUR1anl0dDNqRkRocVdURWdSdzROcUFD?=
 =?utf-8?B?NUxORGp2c0IwcXNhaWRyb2N4VDZpVVJYQ1ZTRjFwbWRLZWtZdHphQmtFcGln?=
 =?utf-8?B?eTZLK3RFYTZQWWNXdEYxOE01SVRXNjMrdXBKWTJFWUliM3JjZzh3SWp1ZmZH?=
 =?utf-8?B?cjh1VmlQYzNiUUVIQWUrVTBTVURjc0xmNmlhQXk4Q29GbXViZnNsRDh4OS9H?=
 =?utf-8?B?UUVhWElucmRGSGxHeEwzbVdqZmpmVXV6NzdmcHk3cnp5OWVRSkF4cVVuVVI3?=
 =?utf-8?B?MUdVNlBtSmcvS1B4c0VsR3creUNaWktkKzlHa0RIWDlQdzExSFI0cGsvTkZX?=
 =?utf-8?B?K2s1TUk4Vy9XNmJUTkduOTdxSjdoa3JIM0VrcHZvRmxjOG1FYllVS2NIY2ZI?=
 =?utf-8?B?dXM4L0FpVGlqVUw4bzg3T3RVTTdEaFZhK0dJSTgzNkdocW1sZ2hSTHU0TTMy?=
 =?utf-8?B?QjByMUl1bjM0OGFzNlNIcTNPcVU4RGgvcnVYNGNrcUh4UytTLytjZlp5MWRJ?=
 =?utf-8?B?Y2lhVS9OdHlHcmZDK0tHekJPMS9kZzFqVjZ6SXlWMTZ1dCtUWnpvS3h6VGJH?=
 =?utf-8?B?allXQlE1MGovdEJsRlpUaTRyVFJ5Qm1JK3AwVzFkOExrVzNwdi9OL29BczRB?=
 =?utf-8?B?TFFjaFc4NDNKaEpabHl3L080dW9pdUdGbWlUMmhTZndwTGRnakpXL1hSN09U?=
 =?utf-8?B?dkZBMHFWSEtrR1FUUzRJYlVjbUV2OGJvVnU3NkZlZURrZE1SbGxnSjlSV0Vp?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 282a42f7-75a4-4c8c-0499-08de188212a2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 13:33:27.3801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYb4y7K4bzJoONoPVSMkHgMpBEcmSJe+rCE77V40a8J2axLz5xzua851DHX1Sy03rsiwSzKnpirBHLa3UJ/wxYoD28a1pIIaORszR8NvMWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

On Mon, Oct 27, 2025 at 08:58:37PM -0700, Matthew Brost wrote:
> Stub out the new page fault layer and add kernel documentation. This is
> intended as a replacement for the GT page fault layer, enabling multiple
> producers to hook into a shared page fault consumer interface.

Nit: this patch and others in the series have been modified since the
previous version, for future revisions please include a brief changelog
in the commit message to help review, thanks.

Francois

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile             |   1 +
>  drivers/gpu/drm/xe/xe_pagefault.c       |  65 +++++++++++
>  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
>  drivers/gpu/drm/xe/xe_pagefault_types.h | 136 ++++++++++++++++++++++++
>  4 files changed, 221 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
>  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 82c6b3d29676..b35021e5b9eb 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -94,6 +94,7 @@ xe-y += xe_bb.o \
>  	xe_nvm.o \
>  	xe_oa.o \
>  	xe_observation.o \
> +	xe_pagefault.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> new file mode 100644
> index 000000000000..d509a80cb1f3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "xe_pagefault.h"
> +#include "xe_pagefault_types.h"
> +
> +/**
> + * DOC: Xe page faults
> + *
> + * Xe page faults are handled in two layers. The producer layer interacts with
> + * hardware or firmware to receive and parse faults into struct xe_pagefault,
> + * then forwards them to the consumer. The consumer layer services the faults
> + * (e.g., memory migration, page table updates) and acknowledges the result back
> + * to the producer, which then forwards the results to the hardware or firmware.
> + * The consumer uses a page fault queue sized to absorb all potential faults and
> + * a multi-threaded worker to process them. Multiple producers are supported,
> + * with a single shared consumer.
> + *
> + * xe_pagefault.c implements the consumer layer.
> + */
> +
> +/**
> + * xe_pagefault_init() - Page fault init
> + * @xe: xe device instance
> + *
> + * Initialize Xe page fault state. Must be done after reading fuses.
> + *
> + * Return: 0 on Success, errno on failure
> + */
> +int xe_pagefault_init(struct xe_device *xe)
> +{
> +	/* TODO - implement */
> +	return 0;
> +}
> +
> +/**
> + * xe_pagefault_reset() - Page fault reset for a GT
> + * @xe: xe device instance
> + * @gt: GT being reset
> + *
> + * Reset the Xe page fault state for a GT; that is, squash any pending faults on
> + * the GT.
> + */
> +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> +{
> +	/* TODO - implement */
> +}
> +
> +/**
> + * xe_pagefault_handler() - Page fault handler
> + * @xe: xe device instance
> + * @pf: Page fault
> + *
> + * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
> + * service it. Safe to be called from IRQ or process context. Reclaim safe.
> + *
> + * Return: 0 on success, errno on failure
> + */
> +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> +{
> +	/* TODO - implement */
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
> new file mode 100644
> index 000000000000..bd0cdf9ed37f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PAGEFAULT_H_
> +#define _XE_PAGEFAULT_H_
> +
> +struct xe_device;
> +struct xe_gt;
> +struct xe_pagefault;
> +
> +int xe_pagefault_init(struct xe_device *xe);
> +
> +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> +
> +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> new file mode 100644
> index 000000000000..d3b516407d60
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_PAGEFAULT_TYPES_H_
> +#define _XE_PAGEFAULT_TYPES_H_
> +
> +#include <linux/workqueue.h>
> +
> +struct xe_gt;
> +struct xe_pagefault;
> +
> +/** enum xe_pagefault_access_type - Xe page fault access type */
> +enum xe_pagefault_access_type {
> +	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> +	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
> +	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> +	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
> +	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
> +};
> +
> +/** enum xe_pagefault_type - Xe page fault type */
> +enum xe_pagefault_type {
> +	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> +	XE_PAGEFAULT_TYPE_NOT_PRESENT			= 0,
> +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
> +	XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION	= 1,
> +	/** @XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION: Atomic access violation */
> +	XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION	= 2,
> +};
> +
> +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> +struct xe_pagefault_ops {
> +	/**
> +	 * @ack_fault: Ack fault
> +	 * @pf: Page fault
> +	 * @err: Error state of fault
> +	 *
> +	 * Page fault producer receives acknowledgment from the consumer and
> +	 * sends the result to the HW/FW interface.
> +	 */
> +	void (*ack_fault)(struct xe_pagefault *pf, int err);
> +};
> +
> +/**
> + * struct xe_pagefault - Xe page fault
> + *
> + * Generic page fault structure for communication between producer and consumer.
> + * Carefully sized to be 64 bytes. Upon a device page fault, the producer
> + * populates this structure, and the consumer copies it into the page-fault
> + * queue for deferred handling.
> + */
> +struct xe_pagefault {
> +	/**
> +	 * @gt: GT of fault
> +	 */
> +	struct xe_gt *gt;
> +	/**
> +	 * @consumer: State for the software handling the fault. Populated by
> +	 * the producer and may be modified by the consumer to communicate
> +	 * information back to the producer upon fault acknowledgment.
> +	 */
> +	struct {
> +		/** @consumer.page_addr: address of page fault */
> +		u64 page_addr;
> +		/** @consumer.asid: address space ID */
> +		u32 asid;
> +		/**
> +		 * @consumer.access_type: access type, u8 rather than enum to
> +		 * keep size compact
> +		 */
> +		u8 access_type;
> +		/**
> +		 * @consumer.fault_type: fault type, u8 rather than enum to
> +		 * keep size compact
> +		 */
> +		u8 fault_type;
> +#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> +		/** @consumer.fault_level: fault level */
> +		u8 fault_level;
> +		/** @consumer.engine_class: engine class */
> +		u8 engine_class;
> +		/** @consumer.engine_instance: engine instance */
> +		u8 engine_instance;
> +		/** consumer.reserved: reserved bits for future expansion */
> +		u8 reserved[7];
> +	} consumer;
> +	/**
> +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> +	 * by the producer and should not be modified—or even inspected—by the
> +	 * consumer, except for calling operations.
> +	 */
> +	struct {
> +		/** @producer.private: private pointer */
> +		void *private;
> +		/** @producer.ops: operations */
> +		const struct xe_pagefault_ops *ops;
> +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
> +		/**
> +		 * @producer.msg: page fault message, used by producer in fault
> +		 * acknowledgment to formulate response to HW/FW interface.
> +		 * Included in the page-fault message because the producer
> +		 * typically receives the fault in a context where memory cannot
> +		 * be allocated (e.g., atomic context or the reclaim path).
> +		 */
> +		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> +	} producer;
> +};
> +
> +/**
> + * struct xe_pagefault_queue: Xe pagefault queue (consumer)
> + *
> + * Used to capture all device page faults for deferred processing. Size this
> + * queue to absorb the device’s worst-case number of outstanding faults.
> + */
> +struct xe_pagefault_queue {
> +	/**
> +	 * @data: Data in queue containing struct xe_pagefault, protected by
> +	 * @lock
> +	 */
> +	void *data;
> +	/** @size: Size of queue in bytes */
> +	u32 size;
> +	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
> +	u32 head;
> +	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> +	u32 tail;
> +	/** @lock: protects page fault queue */
> +	spinlock_t lock;
> +	/** @worker: to process page faults */
> +	struct work_struct worker;
> +};
> +
> +#endif
> -- 
> 2.34.1
> 
