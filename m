Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC0ECCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 14:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C71F10EBD3;
	Fri, 31 Oct 2025 14:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dv9Eadid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC09410EBD3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761921911; x=1793457911;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LIsLmNS+C0M3ylF5lUGLeF2w/Os2jDlcoMwnmSZtBC4=;
 b=Dv9Eadidu0koCLxqJNQVkJqTP6NP3MqxJcdPSMKu8HWULP1DZ6rRp381
 gWa2EroQTk2mNUuHzLbqa5vXXIRipkRiE0z9Vgs+YvoIFg5r8B1Al73ta
 5+P2TJBJcpWKekhTT58Q9smY30Kse9XopM5YzLgOhzbBgLL4dU8hOcS0h
 694lpmtdva4uTNIjFVPQt2/PfN0zdpnJHBhUj5+UfC8b2aqsOR+7XMjl0
 hN25soLorGjEqRK079Vt5czpB9NzQOLJw8PikyRhudBp9y1pw8+NX6uKe
 zq1U2AoKSgFuAbQJidodsUtwn0tZWNgaghBumg/0DJ6rEKNRBPYFG8oT3 g==;
X-CSE-ConnectionGUID: 0y4RMWEXR1SCQrqJZ6YLag==
X-CSE-MsgGUID: /5pG8ZPXTPa+TN6EqOl7GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="66697250"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="66697250"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 07:45:10 -0700
X-CSE-ConnectionGUID: EEulqptBREqSxtXYtP5M6w==
X-CSE-MsgGUID: le0gKxV+QxqagSOsRcf10Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185912869"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 07:45:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 07:45:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 07:45:09 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 07:45:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEDqxOxSSSFoX06t9sicBrlwut8CGnP+iftk5TjYobpBfhA6B8K7KvVodLUN12rv0yAa1/vudI3QrT/ponqIQkoCWC+cNu3qACTcuOXs+CgeVgp2q5DmyiJWK9flZ1e0SSZldoC51J0GgVvAJ46s/2bjbVKYxANL4obyOPdqlEue96qQV9vZYTZdQOiYIOjcqyrA3Up+Y4P1/iekMFmD0MrR1MLq411W3dzZuf5yolEGnWO2tnSKxWaENxAIq7YRIsHtnlAPc6ncR3tLchSeYih7UxjkDUAhbjSH1QhGY26lsiq9dmymDxFbjNbkWNFoXLPtqECrb//9py1MIw20uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd13z4ZO4ZBr4KU7F1ycdwUpUgH1TRX2t+qbxgG2f+w=;
 b=u0AsizgMncCKlmcyzDURIJyf1wZVeJQWEJsHu1Xf4FaIpRSMIwmuptYWyVps7Uf0p+0jph2spXn0TzBaqKBVnXL3dj3gBCs+sypGDQmn2FaT8YC9e6FU6G03A4QqLeFOOvbN6Zkph33MrjGbfo8MNi8ZWfV2UQxjzIN1lCL7X0/VgD8s6UTAvzzZnlf68sDFY7fPhoqF1evXTppuNEJhbHMplnVJsvYEbrzQOqj3X43sVT/vNmxcCHsMkPPmgm4zcCFvSLoYDlRILA63Gm2mzVlgn022DVdsYNSWTOS4GNp+CXdZsD4kh32TnfcbwMqWbrO+1Kwa/dPvMgJSKCIlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 14:45:02 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9275.011; Fri, 31 Oct 2025
 14:45:02 +0000
Date: Fri, 31 Oct 2025 20:14:55 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Synchronize GT reset with device unbind
Message-ID: <aQTLZ83wKHHNriZz@bvivekan-mobl1>
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
 <20251030151122.3021436-5-balasubramani.vivekanandan@intel.com>
 <b3d8c801d84a807fab0e53d1e6134e3234024b44.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3d8c801d84a807fab0e53d1e6134e3234024b44.camel@intel.com>
X-ClientProxiedBy: MA1P287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::32) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ef35aab-2aab-4f0f-a4dd-08de188c12a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3QxQkN2dTFlZllZcy9aNlVnQ21hWXRkYkptZ2tkOElPUmlBVzBTQm41VE45?=
 =?utf-8?B?czhUc3o4L2RoQ0draU5nUE9FbTZsdGpLRW1IVWZNcG1kYWtkUUVKSnR6Wm0w?=
 =?utf-8?B?bC8zSHRyTmhJaGI5bDlhZy9aOWFPNmhGdm8wTnBHdFRVMGtGWkJGU1doQ0Vn?=
 =?utf-8?B?akpXNW9XSzBMc1pjbW5aZEI1dUl3TTd6dGwwVkRybS9SMUkyakk1dFRxWnk0?=
 =?utf-8?B?YlN4b0NqNTJXZUdXYmdIWTZIaE91N2U2emxJQkFIWmVPVTB0dWxuY1Eyd2VS?=
 =?utf-8?B?UEltamQ2enIyM0RSNjF4S2VZcU5oRm9TclFDdDJya25XMHJTdGxVYmZLMjR3?=
 =?utf-8?B?dGZqdXdkeFB4dmd0UU9ydUJGNVdJeGw1M1crc1F6eTNXdHlzNEh5VFVoNnJ0?=
 =?utf-8?B?MDFxYlgzK25YdGVRNmt3SUhyUmRUc1NtbSs2QzRiNmVwWFRKTlZma280NlFU?=
 =?utf-8?B?K0RGdXQ2MUtJQ254VkMrVmxnSGxLZkR5WjhaU1dEaC9iRjdhdnZUZjBDWldV?=
 =?utf-8?B?bXFlVXpoS0syYjV2L3NQSHF5K2hFZnJGbmtzTitIaUwwdTFvbnVKMEhIS2xG?=
 =?utf-8?B?eE1EZHZRZGkwSlpJM1VxNk1yTWZaRVMwTUFEODhWYmF2ZlJLK0tTa1c1OFg2?=
 =?utf-8?B?Z1J1emR5OENGbUc0S1NmaVVHbTR2QTBrWXI0Ky9hNUVLYkdOYjVwVFpMTEpV?=
 =?utf-8?B?SDdRSHoyaWlnVi91TlBsU1p2Y1hiRkZKWWpDQm5UWEhITmVyWGRwK0NvZmNK?=
 =?utf-8?B?MytNV3VkYlBoOWIzUTdkMWgzd2ZNZldJSjgwVXlsRENYWFp3ZmJvZ3RML1g4?=
 =?utf-8?B?QTAwaDJNVTRnaWdVWVJ0M1haYXNDRWlONHY2T3VTOU5yY2E4QzV3SFM5aUtL?=
 =?utf-8?B?cDJmTG1FeExET0RJUGpnVGNmSm9aMnR1REJFS2ZDQjRkTWlIOXoxdVdLempT?=
 =?utf-8?B?b0F1eDhGd2Q1VE1TWXlBaERVRzRwczhRbHphTzUrakpmQTJ2SG1iNmFJUVY5?=
 =?utf-8?B?cWR4RlFoNWNxcmdFdk4rdDdBL2ZiVGdCdDRTVmh2RFM5cHpJWDBab3Qzd2hJ?=
 =?utf-8?B?QXh5aEtIM1VRYlRTbTh2RXRRc3VqRUxyWkNXaSs4YytMK0pIUy9aWlNrZjVz?=
 =?utf-8?B?Mlh2VUVBcU5Za3pTMjZ1WkJLSC9zalU4enNBSmdnTTZFOHBsaS8zd3hkU3lZ?=
 =?utf-8?B?aDR6SkVIOW9GT09lZzdHbUFVczJMYlRlRXBKVWw2Rm1IWEVIK3QrTXlqWG9L?=
 =?utf-8?B?ckpvUnRCWGg4Z2I5dS9xaERWRjkxWnJZdUk5bm5jdU9sY2Jwc2s4cGpSNU9R?=
 =?utf-8?B?cCtMMFpWV3FGNFhIZlJkL0lHYVJaT21aQU50ZmlLdXF6TW82RTE5Y3pUWG1y?=
 =?utf-8?B?KytVTjJ2RWttYlNqR1BuSDVwb1BEV2FUc3Bnak1mNSt3RjI4WnVEWEJOaGpD?=
 =?utf-8?B?N3RFWjVWNUo0aVR3NXZFMTdHeEdtN2ViNWh0MDNmaGluYmt5UkMwbHNYci9D?=
 =?utf-8?B?enZIUVJOc3hUSjVpclFDNkpRUzU4TStzbVV5eDQ2RUQzYTI3eWtSbmhQUzZQ?=
 =?utf-8?B?QkxFM2o5aWMzL2Npa2NLVWE4ZDRJZXVvdG5tOWlZTDczTXFjVTcxYnVNRWR4?=
 =?utf-8?B?NWNCblpCaXhnY1BSemd5azUvdDQ5elpPQVJFTUIvejR5OHE0L0Q5WWMvdzFh?=
 =?utf-8?B?WkJ6TUFGYjd6NEV0TzJLTXREK0ZMZnBPbFNUTjB4a2hQOHgxcWIyb1hRTHhM?=
 =?utf-8?B?RkVuS3RXUmJocGhHNzV2bUNHM1JPTW1RcE5aZFhHK1lOek1rd05jSEU2MTlC?=
 =?utf-8?B?NzBXME0yeUR6SjF2bVJrSXFncHlPWWwyR0NuaVpGajUwMitSTXRyNW8zQ3ps?=
 =?utf-8?B?bnI0WjZWcGZLd0RURm5qaWo3ZGprOXFGN1JUMll2bUFnZVBvNFk1QXJlNkFB?=
 =?utf-8?Q?hYlNj6khj6lNQ3Byo8QOVTPNJ04pI2OX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjB3NU9CNXRUUlppaG9jWWZid3RiUlI1SzZ3VGthclIvOExYZkNNRVc1NU9T?=
 =?utf-8?B?WmhjUHp0TGkzNHF5SE4vUHJqQ0lxdTJZMVlZK21Ba28zTXN4cjd3a3FTR0d3?=
 =?utf-8?B?SDVhTWRlRGpoL3cxaG80OHNhdFZvODR0NlFWSWordUx2OW9iQ1V3UUszSVh4?=
 =?utf-8?B?dW1XWEU5ZWxZamZhRWZNODQ0aFJxMWxDSzRUUVVNamxMTEZrM2lEVmFQcjkw?=
 =?utf-8?B?QUZmQ3hsN0N3b0JIalRRdUh5MDMvRGFmalBFMXNXa050eHJOeHgvM2FPbXZy?=
 =?utf-8?B?aEpta0xibmFoT01Ud3NpbEVBcXkyYms2MTZOTFNKLy81RGRnTzlyVGpYKysy?=
 =?utf-8?B?UWhYTVFoSzZkeFFVTnc4SUoxcmFXbWdVTXdqVk9XNHp6dWNiV2M4RmRDVDAv?=
 =?utf-8?B?aUt4ZkNIZmg2UGIwRTVueE5Za0R4ZU9ucE9EYjJ1V3BveUJuL003ZjFlc1ZR?=
 =?utf-8?B?L1lsUENzTWxaYVY4Ump6ekNZRlNLSlYxNnRIU0lkMEhaQXpSd2VMQlY4bFdp?=
 =?utf-8?B?bXlSM0dmaDRMcXRKUTR4SGlCR3B2RWgwV2NONnNKbDUydG50ZUw5dG0wWFYr?=
 =?utf-8?B?ZmZtKzVlakZzK1YvYXI5U2kwOTFnWnpGZHJBaGpXZmdNMC9CdGUzUFIrNkVh?=
 =?utf-8?B?dElyOXVmdld5eDd4eVJvcFhueVl5YmQ4YW9NWk1iK2pKOW9leFZhMG54c3V0?=
 =?utf-8?B?U2Y5MVRrYzZaeTZpcUdYdUVFNDNMRnZPaGJVQ2xmNmpRMm02QVZDNFF6QTBr?=
 =?utf-8?B?RTBCeHVPZUtzOWxpL2RseFBEQnIzdExFL2x2bFMxNTdiaFBBVmRuY0lDT3BQ?=
 =?utf-8?B?bmE0TUw4MklSVmx1UUNGSWM1cW9QY0cydFVKR21sVU42a2krWHJ5WlU4U0lz?=
 =?utf-8?B?L3hTbkFLWEo5UDgrdWliV1B1RmhQWmQzcjBBUzQ5WUVwS2VtNGg1by9PenVx?=
 =?utf-8?B?UnlqZ3BRM2RaTzBaREZ5dU5mQTEremhYZUxTNFBFWUhlUHREQUkxeUNMY2tN?=
 =?utf-8?B?TmJMOFo1RDU0NGJMQlJ6N3BzTUw4bUZmSVRjRjZ2SjN5dEF2YlZxSzV0bnc0?=
 =?utf-8?B?TGNPU1V3RDZpcGVyQ2JLaDdQN20ydm1BQnJNMUJvYmZOcHVNdXV4d2lxdEgr?=
 =?utf-8?B?K3A0SHRraVNtT0lLbHdUeXdpNmhuLzRLMUVIMElaT1RWemJNVFkwWkRtbFB3?=
 =?utf-8?B?dHpDbGJTL3BENkt3UUkrV0xMbmJOWkp4b2Fxc3RLZVdxaGFabVV1bnkzRmNU?=
 =?utf-8?B?eTFJS2ZNcDNIT3djT1hBaWtiVTh3dGR4dml3RVNqTURxVmYzbTVtbFczZU5Q?=
 =?utf-8?B?aSt5akZOcXZnVzVvTVpyelREMVlVUGJaVmpPbzFVMHRqNEJRbDNxNmoyd0xP?=
 =?utf-8?B?WnAxbEV0T0pPd0JGWG02aUY4bHJnMHdoWkFKWjZLbWZRU2pwdzNndDNwTGFL?=
 =?utf-8?B?NVd4UHVDVS9FRGNLMk5jM1hoUGxDOGliSWxRSk8xQ1MyZ2g5VXJUYzhnLzZi?=
 =?utf-8?B?SnVpTU5jRDZySFFBQmlRUDdSN1V4eHBYVXRDK3pHakNTK0JsV2xXT0FIcFpP?=
 =?utf-8?B?bTh1bXdGLzYwcmVIS0t2TGt2QUIyUzZDdXdQdFRtTmZvU0Vnd2hjbHFYc1VB?=
 =?utf-8?B?c3JGZDhVaDM1L0RsYjV1dzBUR3oyaGhqMjNvU1BVYXQvQXFPOGwrVUxoN0ZO?=
 =?utf-8?B?Mkpmb2tnOGM1emc5RFAzbXB3UThKR2pQUzhUZEFpbnphYUEvWThaMkQvV2Ry?=
 =?utf-8?B?Vit0NGxxczRvakMwUURFcW9VODd5YkZ5cFE4akJWU2dKbmtKM0tDUFNZSlpQ?=
 =?utf-8?B?dDRlSG5aUEdvanhPTkV0VjRiUTJLTjNmb1NEWjhZaUxvS1p0VEJnM2dMYzNH?=
 =?utf-8?B?M2UwUHJTZGVuU3l5ZWxIdmh4ay9NU2pKSkR3WWZxRHgrYzcxbkVjTEl4dHJO?=
 =?utf-8?B?bDg0WFBnNXBwVmNrd2VCalgrc1hSdjM2VzdvcjVVOFVOT1N3VFo2c054RzVU?=
 =?utf-8?B?TlNibE1neEI0NFpBd2FBMFFBUW5pSFJLNlB6QXdTaFIyUnNqWCtNUTJTNlY2?=
 =?utf-8?B?T0l6N3ltRDJRM3NYcDZ2L3JwUEdhODRTS2xuWFF2eFJuanZGMlBLQitGTU9S?=
 =?utf-8?B?bk1YTmJla0pBTlcvcXRFVzJDK2d4WjNwTmd3bUVGY1BjdUxQTW1LOXVCcWg0?=
 =?utf-8?Q?3LQIw6UVdUZrI/Dnl/ObQQ4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef35aab-2aab-4f0f-a4dd-08de188c12a6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:45:02.5000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nvYUTAvzSIcIXR6DmtYhmMKZjJCJx0L46lsBkjnsbcvWm9mibxjLUUxnFP6tpMYDRwPiTlYL0OFy9JZI38JLccmmY7pv6ePHU78hNDoLaNBY1ybBKtrPL3DxTulMup9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

On 30.10.2025 23:07, Summers, Stuart wrote:
> On Thu, 2025-10-30 at 20:41 +0530, Balasubramani Vivekanandan wrote:
> > When unbinding wait for any GT reset in progress to complete.
> > Unbinding
> > will release the mmio mapping but mmio operations are performed
> > during
> > GT reset causing Kernel panic.
> 
> Do you have an example kernel panic you can provide in the commit here?
> I've seen similar.

This was the callstack reported. But I have seen some variations as well
but always arising from the do_gt_restart function.

Do you really want me to add this to commit? I think it adds more noise
than any help.

[ 2935.688873] BUG: unable to handle page fault for address: ffffc9000500c000
[ 2935.689773] #PF: supervisor read access in kernel mode
[ 2935.690464] #PF: error_code(0x0000) - not-present page
[ 2935.691154] PGD 100000067 P4D 100000067 PUD 1009b8067 PMD 0 
[ 2935.691955] Oops: Oops: 0000 [#1] SMP PTI
[ 2935.692506] CPU: 0 UID: 0 PID: 91 Comm: kworker/u4:7 Kdump: loaded
Tainted: G     U              6.17.0-rc3-lgci-xe-kernel-xe-internal+ #1 PREEMPT(voluntary) 
[ 2935.694307] Tainted: [U]=USER
[ 2935.695508] Workqueue: gt-ordered-wq gt_reset_worker [xe]
[ 2935.696253] RIP: 0010:xe_mmio_read32+0x78/0x2e0 [xe]
[ 2935.696938] Code: 00 9f 0f 00 00 0f 97 c0 81 e3 ff ff ff fe 44 09 f0 44 0f b6 d0 c1 e0 18 09 c3 85 c0 0f 84 bb 00 00 00 44 89 e8 49 03 44 24 08 <8b> 08 89 de 41 c1 e2 18 44 89 ea 4c 89 e7 81 e6 ff ff ff fe 44 09
[ 2935.699299] RSP: 0000:ffffc90000cffa80 EFLAGS: 00010286
[ 2935.700010] RAX: ffffc9000500c000 RBX: 000000000000c000 RCX: 0000000000000000
[ 2935.700950] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[ 2935.701891] RBP: ffffc90000cffaf8 R08: 0000000000000000 R09: 0000000000000000
[ 2935.702832] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888134968078
[ 2935.703773] R13: 000000000000c000 R14: 0000000000000000 R15: ffff88813a340000
[ 2935.704713] FS:  0000000000000000(0000) GS:ffff8882b3ef7000(0000) knlGS:0000000000000000
[ 2935.705764] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2935.706535] CR2: ffffc9000500c000 CR3: 000000016365e006 CR4: 0000000000572ef0
[ 2935.707475] PKRU: 00000000
[ 2935.707866] Call Trace:
[ 2935.708226]  <TASK>
[ 2935.708547]  ? usleep_range_state+0x6e/0xe0
[ 2935.709117]  ? usleep_range_state+0x93/0xe0
[ 2935.709688]  __xe_mmio_wait32+0x7d/0x190 [xe]
[ 2935.710303]  xe_mmio_wait32_not+0x18/0x30 [xe]
[ 2935.710928]  __xe_guc_upload+0x1e8/0x7d0 [xe]
[ 2935.711543]  xe_guc_upload+0x5b/0x70 [xe]
[ 2935.712107]  xe_uc_load_hw+0xa4/0x3f0 [xe]
[ 2935.712682]  ? cancel_work_sync+0x50/0x90
[ 2935.713233]  do_gt_restart+0xea/0x670 [xe]
[ 2935.713808]  ? do_gt_reset+0xc9/0x2c0 [xe]
[ 2935.714382]  ? mutex_unlock+0x12/0x20
[ 2935.714893]  ? xe_gt_tlb_invalidation_reset+0x108/0x130 [xe]
[ 2935.715668]  gt_reset_worker+0x2a6/0x460 [xe]
[ 2935.716283]  ? lock_acquire+0xc4/0x2e0
[ 2935.716803]  ? process_one_work+0x1ee/0x6f0
[ 2935.717374]  process_one_work+0x22e/0x6f0
[ 2935.717925]  worker_thread+0x1e8/0x3d0
[ 2935.718445]  ? __pfx_worker_thread+0x10/0x10
[ 2935.719036]  kthread+0x11f/0x250
[ 2935.719497]  ? __pfx_kthread+0x10/0x10
[ 2935.720017]  ret_from_fork+0x26f/0x2e0
[ 2935.720538]  ? __pfx_kthread+0x10/0x10
[ 2935.721058]  ret_from_fork_asm+0x1a/0x30
[ 2935.721599]  </TASK>

Regards,
Bala

> 
> Thanks,
> Stuart
> 
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com>
> > ---
> > v2:
> >  - Use the managed resource release function to wait for GT reset
> > during
> >    unbind (Lucas)
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 89808b33d0a8..d0f8c40bc51e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -607,6 +607,8 @@ static void xe_gt_fini(void *arg)
> >         struct xe_gt *gt = arg;
> >         int i;
> >  
> > +       disable_work_sync(&gt->reset.worker);
> > +
> >         for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
> >                 xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> >  
> 
