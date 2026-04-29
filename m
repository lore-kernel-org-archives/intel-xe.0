Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D9ECCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 17:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758E710E2E5;
	Wed, 29 Apr 2026 17:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBmUxUgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0BD610E2E5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 17:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777485428; x=1809021428;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=st1aw8HMVSEkC3XdQbkqRnedHrSZIArF3AmgjIGaEpg=;
 b=iBmUxUgxvrI4Ji2hkGklZojoo9rR7zSWlfJdm4/i0IMPUtnAUNFJkTcC
 M+BegU1hulXax8l0miNfQtQb/5fLH1GtMOFFNwiSzZe7c+DYEtKjKddP/
 yLuTW4PoA6nBNqzLrbZT6u4fXt7O4tKh8L0rWMllvdXlpj8DwsHr/6nkA
 XQlbRDJqPZfJIC7ieCHpvXXzdQZjFWpO5IRygriMUEjVxTradZEaAnkJf
 WcfKEm2e4lROhoGpz6JEPmB6eCeFvfRseR/hRjCm+rrWTCKLhfKoc8QNk
 gJ4aK+d2JHbJXcwl5nJ4oA0W57Tm5cTQaLrGAJVmytWSO/wkpiKbDPL4r g==;
X-CSE-ConnectionGUID: kDkad+QSQ8O1j2OSKNqrjg==
X-CSE-MsgGUID: N23/DYgPS6GNEbry0DGPMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89512091"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89512091"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:57:08 -0700
X-CSE-ConnectionGUID: OkcUFfRMQx+hZ/+MHObyGw==
X-CSE-MsgGUID: kBRzDHDtS0WUEdtf82QIlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="234365913"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 10:57:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 10:57:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 10:57:07 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 10:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H31R9YC1RenLLa7wSEXPCXrNrKRyiqHWQ3ngq6ASDzh3NXenFz4tb4DRcNiCbATxv+CDbTJSjwJ6oZp4ZOTJMyDu/5VZ3PgGDEz8VnGGDW4ZR4Tv9NojRp2dAtjholGraPXalC3iqmdWTwjwg096O/n2G2Cp1EpkzGgrxLh6vkkogOpBh05MNXt9qqZksQADsysOl2IQDvxwAA6uYE9SqASRaKDMNGNxSEnsdzqk/Xip86TVYRvxAa+JORgWzUtKEAhV2VjXl68saVBMwBbZsApF5APGtULWBcBSRreSEU5brsm4nLy0rUgZgwp94kVQYBrsXvfGRwuf85Bm9pbxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5k/NjrfrlYiJk3kPBVRs9Mw6BjG01ODKDUk0Fm19zE=;
 b=WCj6TqStZpn8dnN8VawAlEnxZvHkEScquFlTazJz6PCLG9cHEu9Id0P5rZ3CnTM8lAqR8Bey9dxvz71uVK0irYfmUZwUdlOGB62Ww2obZmcMv7gHA1/PO7PgHCpg7Ez2ZZDfkACvPG/Z9RIdveGDZTryNOI4YaL6kOwhCypVMTEc8dC05CUzys4ILbnk7UPbGO4A4i/9EfDWdimQ4z4AX7nLn70pOv/ptGvm0no3VWmFV57YFQFqqLKYUMt9Ju4SVhSu8Uft5iBr5UOSh2DYRj/h7HIZF7tSanJ7CPetNkfh0PR4BkjY2GR7luLcWzWHDcYTkJHl1cmOvvV5u9l1wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) by
 SA1PR11MB6919.namprd11.prod.outlook.com (2603:10b6:806:2bc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Wed, 29 Apr 2026 17:57:01 +0000
Received: from DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::9e76:813f:9cf4:5c6d]) by DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::9e76:813f:9cf4:5c6d%6]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 17:57:01 +0000
Message-ID: <8af80c3b-49e1-40c5-a983-afc300a54cee@intel.com>
Date: Wed, 29 Apr 2026 10:56:58 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZS9ndWM6?=
 =?UTF-8?Q?_Test_GuC_v70=2E65=2E0_for_BMG=2C_LNL=2C_PTL_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260424203007.2370832-2-julia.filipchuk@intel.com>
 <177741562872.22650.14230295676040962754@5ab824fced77>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <177741562872.22650.14230295676040962754@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::6) To DS0PR11MB7831.namprd11.prod.outlook.com
 (2603:10b6:8:de::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7831:EE_|SA1PR11MB6919:EE_
X-MS-Office365-Filtering-Correlation-Id: 94cf4151-c8ac-4229-c87c-08dea618b6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 1Z55ZW16K/k0aIqx3YqKm+tCIvPMohy6OQo/aBTfznvb2mZKUrDKp+NP1475eFSzzQYNtSJHsZvhcyWPV32QZ0FhRuSPHIL3a6R4VV94wTaHxkMhknUgOhBt0UFnU2g8Q3oMQEmKnTU8ETYA3XLpphy42kqySl+X2NCvKPnOXQIHvB6ufzrMDYP9TwEYpPukWGoGLUqoGiU1nihFegoAPy/JDvMcWnZWJLLSucoCB7+/9W/yU0rCOddXHzjmBsu/irOVJwIEPnswRw7JaRlgtXAF1BT5+3BDS/JoERlYwVtKym308ju69FWn5xQKo3GFV3OU6es4MoXW8WLVnzEn1+Y0qp1I1ye1+lgaYEOj/MPu19jmk3yA8PSRBLcpa9U7qyvhqL8+NVdeZRIw1JeiXZ2FnLV2x8Gm0YFgfIDbsGXScOrRxTCJ/kM112C9zZIiut77ce8eD8710sezV3jhgunbrFRQeg3wNZ1r5Gw/Q2azdiDUjgmd+BxwmTmUxgwKBe73olfNiY4rq3P/+KgB7Qe87wuFUPirZar+SThBK3AuG9KJu2CIWoYo9LYdApM2XH0u/F4FKqycAiC6Qru3fY8XAD7e1nu2A/IjZnWIpnvh2wHnE638fdyCwZBt4G7XF8x4Pfr8eHlGdQTxRcZzIHxvzFBx7bHxmFGasawIWLO9x7kiucHXp8GIhxfJDXGd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7831.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djgvU0txbmgyNmN0TVpOUTQrQnFBdEsyWlhaODR5WVFmd3k3NG8xV0E3Zmp1?=
 =?utf-8?B?V05pbUJyWVI0QnY0YmZQVjhBRUtMaEIzZVpCWkt5RFJzUFlONzhLdjAzSzRr?=
 =?utf-8?B?anhvcTA1R2FxcVBrTU8xK2k3QXVQLzc1R1JlNHZtSFlxQkJiWjJZL0w5ZG5T?=
 =?utf-8?B?dWR2NHBnK3ErRm5sRHREMzBMSUlFL0NMU3JscDRZTXQxdUtPaEVwKzlQWXZB?=
 =?utf-8?B?ZUlRNCs4NGszOUlSWVlKQWorLy9rK05SRnRsWW1PczMzRTBlZS9rVnR1ZlhH?=
 =?utf-8?B?M2pyQ1BxNlIvdzZBdVFlYW9PZHdPaFJyU2VTbVJwNGhGZWdrNjAzMzExZkRL?=
 =?utf-8?B?cGdwVlpvSFJ5RlZQRnYxazE0K2pFL1liRGtOZ2xDT1pwWk9qR3VrMzg5ZVgv?=
 =?utf-8?B?OUw1OXpkR2lEUE16Qjk4QnBWcVhzdEFrcWZIVXNVVHNGYXJhRHVDbkFQaDJh?=
 =?utf-8?B?NmxxSWRGT1ZObHFsN2lnTDByWGI0em9QRVd2b1pibldZRXFuVFkyYzFLcWNk?=
 =?utf-8?B?V2dPTVFZMys2YWV5MkJ0SUh4cHhWTlJwWGVaT01uc3BoMU1IUXZqeW8rV1p1?=
 =?utf-8?B?bWZ2UHBYdG1QejNndDI2RThwMk5OdExlSEgza0Z0OWNIYzRMNXU0S0daZUd3?=
 =?utf-8?B?NnUxWnZrUU9YL3lZU2NCMC9PVndqQ3FiREZVbWcyZThnV01yMlRyaE5KSDE1?=
 =?utf-8?B?K3ZFYzJrekM2UWwwcDhGQnlDUTBuUThtVU9LdkhkRGUrSjltc0Z6NTNxQS85?=
 =?utf-8?B?Z0JzZTJqVkl5ejV3Y2JVU3NtSnlxREl2OU9xSW1DVzRpd3pPWG5FTG1FNy9M?=
 =?utf-8?B?ZSt0bGFnRC9nd2lvZk1OYzljZG1wT0pjS2VGM0RQMnBEaU00V3lWTEVHeGpY?=
 =?utf-8?B?V2xoRjU5ODk4ZXFvdHNVVXJFMHdkRnVZOVpKMU5qa2pKUEFSWlp6TklGQkNq?=
 =?utf-8?B?UHBCVjRqQ3ZvUkVNZC82RVI1UXVGK3JkVS90b2lBbUozZWtzTDR6Y1pBYW0z?=
 =?utf-8?B?QzZMMVlCdmdIeEd0Ty9HSU54enZNbVJlZFVzTUxtWU5hc1Z1YWVaYUZlSFk4?=
 =?utf-8?B?TFdLZld0RlBJQXVrUUFLcDRWOG5jSVdHS3ZtT0hhSjUyUThRdHJ3Z1dSaHpK?=
 =?utf-8?B?ZGhNdFRXTEppMlFyK3Bhb0pTZEd1OG4wOUJtVkhaYkNDVlFiQjFUT05ZNC9u?=
 =?utf-8?B?Y215WWZLUnJncFNJeHBRQWtBWldaRTc1L051dGdQWDAxSFh3MEdNeTFQOGph?=
 =?utf-8?B?OUNPa25lUEg1RWRpRU1HMUM5OXRvNGE0b0FJYTVIdEdWUWVuWVczYTJyaC9C?=
 =?utf-8?B?NEJ0UitaQXJReENsM293UkQ1Z2xDWnBVODIwcHVrc0lpTlJ4bTQ1SGlNQXdZ?=
 =?utf-8?B?R3RONy9XS0FIY3lYWEdnT3dzOG44Z2dqMTZMd096clRqU0pTWjNlZmJGSFd6?=
 =?utf-8?B?RmJuOGEyVFJqd1pnV3gxSlZZNXIwWFdlTXRXbE1UaUJyVDNmVkxJM3VaZExP?=
 =?utf-8?B?RzVhdEhHZmFqbXFOa09JM1ZmZkJiUklwcytSRC9IQytBOWFpaklOdXdRbE00?=
 =?utf-8?B?dWdPbWcrclhkL1VZY0RtZ3YwSGFPRml4WWFiblo0dlZNZVFHRWNoakxlWGZt?=
 =?utf-8?B?NG9lejdxR0t1OFZnMS9CN3BxclFLVktYMWczNmJJSVpCNW84dkZGUkxyNEFh?=
 =?utf-8?B?N1NhRmZoRHhuT3N0cnE5V3V1Nk42aUJSNi9hdG44S1JMSFpSekpLRGtpYkwv?=
 =?utf-8?B?SjBPM2ZlMVdZY1R1cVF0OTlXOXRQVGhGOTFjN1k1Z2NZNDl4by8rNzNKL2sy?=
 =?utf-8?B?M2ZlV3dLTXpQSzFNN2ZJeXRGM09FeXp0NEtGaElFWmJSbThhUWd5UWJEOGdo?=
 =?utf-8?B?VVNxWlVPSFN2NDVFVlhxempnUnhWZGJjS3ovVWYrbE1zWk5IVEFYekh4bFdK?=
 =?utf-8?B?OGRQbm5OTjRlOW1tcXQzY005OTIrbDBzTGlMS29SQ0pPRWthZVpvQ1REQm1u?=
 =?utf-8?B?REV6UHErK3ErR2JPdlF5eDk1dTZOejNKY2Jra2VMelVHbGNwQzZ3cWdRa0Zq?=
 =?utf-8?B?QWtuK1BtZHBtWGdaM0Y0TnBRQit3ZVQ4RkxKT1liNWlsamdRVGt0Ump1NVJS?=
 =?utf-8?B?UHZOZmlRMWMzcVZNRmFZL3I1eUpkYnEycTAraXB2amZFMEw4Q3lOU3lLVjU4?=
 =?utf-8?B?SlhidmVNcEo1QkRzT3BFcjVDbGVCTHpFZmErRHRLcHd3NEs5b1h6d2NBNHoy?=
 =?utf-8?B?TnZGMlJ3TVdjMDhnSW92anZRMGhhbDZKWmU1NjlEYTA0M0gwa0FYd2xnaEdL?=
 =?utf-8?B?anIvbjMxZGFSYnFvcFNCMEU2eWhXOE5iQkVwMlVleUhQcUFSSjIrYkREQTNa?=
 =?utf-8?Q?RXIruedryoec75tY=3D?=
X-Exchange-RoutingPolicyChecked: S0tZNW7vIKcxmVwY/mfD2B2f0duABsL69ur0T/SxYyH227ftqlC5fhSpa1Xl2SSoMRf3iicOcXkDdz81K0F3pfM9xSBgbHb1rHSKqlmnR87ldd+GJe5JW/elkL2BWXVRgLR/wUNAY3bgjPH14VAP8MjPbJj2FvV3NWH48vqwA+KUif5lIJF6m0XOCV6KHA2paprZOAvRdSvxtrMTXDL6r1uEKDbbhOiFWmx8920jRhmLJIu7hLM8rKq3Y4H8bPbnoGnJvG3Ce66rJSRBJkBgpM0pX5piC+zfW41H1w3SqVbU/4suFHCpYpS3cizul3eqC40R3/ifY1mC6R6yOApEGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cf4151-c8ac-4229-c87c-08dea618b6fc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7831.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:57:01.4827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzEWnoTVtBM90QZOJkX4MFfuwidWlPRO93BI2aJ3Jt8BtRlUYClTquSEY++0UDWRDXTAqmJriuAo0Kb+Yprtabt1BWpsfRXk5DvDS4C8fqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6919
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

On 4/28/2026 3:33 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Test GuC v70.65.0 for BMG, LNL, PTL (rev3)
> URL   : https://patchwork.freedesktop.org/series/165457/
> State : failure
>


> 
> Participating hosts (13 -> 6)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in xe-pw-165457v3_BAT prevented too many machines from booting.
> 
>   Missing    (7): bat-ptl-1 bat-ptl-2 bat-ptl-vm bat-wcl-1 bat-wcl-2 bat-adlp-vm bat-adlp-7 
> 
Previous runs of this revision passed all bat tests. Ignoring this fluke.
