Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C03CAC5B0
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 20:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA0310E39D;
	Thu,  2 Oct 2025 20:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOPtq78R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D0510E848
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 20:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759436366; x=1790972366;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=cn6ULyxaUGeEd6u5l2b03ZvoINNmKvKWM29tjohtEqo=;
 b=AOPtq78RIlM0HqBq5oPsT+azFkjXNBgsp8Xhi4HDVw9yacftPLHJBZGU
 uiWodZH7UjVR9DYpjdBQ9o3skSwbYE8+8R+HNW8bBfyVAv3NAbDUuJe83
 O7QCuQpOppb3Vg3KK8gh9vkWhe5HbFmOe4I03Z5dQkziUcrypZOCcpnmj
 1HKmDNegRKGROaW7E4eHx+F9QP9uE95WP7T3jTyUHDu+SU0IAtfXDO48I
 2ZFoDV6cUfLnFB/URnAigphS+4vRtbXCqKIC2c4lS7tu91ZlJy5otDBNL
 aOGEdhMU5Os/v01EndWz7HZFOTadlcxM4nds9cqQVnpBL3B4R+e4w8A4r g==;
X-CSE-ConnectionGUID: ESj4qLaXQSK3JCAnKUd5Pw==
X-CSE-MsgGUID: Gjw5vRzNQeeRxRXdSVJbxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79378284"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208,217";a="79378284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 13:19:26 -0700
X-CSE-ConnectionGUID: SoxGuQv/RgakNWEfUzuARQ==
X-CSE-MsgGUID: EZyH/5hbSCq4RjrkH+gV8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
 d="scan'208,217";a="216246704"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 13:19:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 13:19:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 13:19:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 13:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1HuVjAnfRVdjm5DG3MrOm+8uGUpdAFJWnKWzj+XTphBWkeFC4TGs2Tl15Qhgb7g/VzeQLGDazDkgGMn8As2Di5MK1kZgIu5jFRCgg2llA6nRF9dSD62X4kez6Js2GZmJt4gTStjuA0T+uzhH/mEJUdlvWwBo/Schlzc4Q7Gf8qBYgPtU1OjiYYQI3zRaTMQVAeFNoljxquktIHZn9vVibr2mRmeA4Fz3LeBY8z4+ONAYb01cGvzGMSqTUwnola/UWewddWOhtDM3grF3iDVeUV4g+kTfIl94gLzoTq0iHFwNN/NqzNS2tS+zl8m/9rzC2+jwEv4SuKHSL63lJ2Dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldIEDF78UV1F5PERe2eyeqNP3sGUbNCtIc7kET8d/CE=;
 b=fInz8H12wKSgJzuglpdEfBYuTzo8WwGR8502pBDD01pv7bdExc4o50RVmtlQ+k48NfC7aG5StFeaAWDaXXA0yMDcTQ4Kfms1c44OikgPMzI9Wr7YoQ9V2nBfbLwahUdL+agVmllUHIT1xJ5UC9IZnG2f4kmTzkjag/VdQy4SVyOhZYlXTeexswc/mxFPbj69leL0GKJN8Be5dtlsE5MLHhcY4BylIBgLhBQPirSasi9xNIDoaXkopmVeyw+jGZCniZy587IW4fILKi2j18oGJ3EdpclHpr6o33d1I2RFr9DvBcOfo3YsvWmD118fdIhVl/xEHbJ2seLt4gBgwQsptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DS0PR11MB6421.namprd11.prod.outlook.com (2603:10b6:8:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Thu, 2 Oct
 2025 20:19:21 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 20:19:21 +0000
Content-Type: multipart/alternative;
 boundary="------------aGhGH8sdWp4eoYmuROVStXFj"
Message-ID: <56e84aa7-6d69-452e-99a9-a1685e5b3cc7@intel.com>
Date: Thu, 2 Oct 2025 22:19:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 32/34] drm/xe/vf: Ensure media GT VF recovery runs
 after primary GT on PTL
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-33-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20251002055402.1865880-33-matthew.brost@intel.com>
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DS0PR11MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e4fd8e-f6d2-41a8-8dbc-08de01f0f8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amZZZXlBVTFlcUVINWtpK1NlTXpJeW1mNE5FWldBcUpYZ1lnNXJMNERwMEZG?=
 =?utf-8?B?ekwrOUZ6YmRBeUovUm82OHBRUzA2VWlIcDNjSFk0RWVMQnB1TkRXQURpSFMy?=
 =?utf-8?B?UW15cERwTmNjSGZuS3I2eURlR0xxYnA4ZUxpRVc1V2U4Qmg3ZEpFTytkdWlS?=
 =?utf-8?B?Z09ic2NGcXVkQVhETGNOR0pVY3QzMG8zNnJrOXEyeHh2ZlVUMVQwZzB3OHJK?=
 =?utf-8?B?UWtreCthZERPNzZWTUdGYnNoY0ZhV0RHQ0Q0YmJta29QR08xeVhNR0dNOFRF?=
 =?utf-8?B?SXVuZ3pkb3lmU0JLUmsvS3QvU20ycFdQc0FBazZPTTVnMDU1ajVhbkZRVFpF?=
 =?utf-8?B?aXgvbFB2a2xvS1ZQdTdBM0I5dUFIVG5LN2pLYVF0R0JFK2lqOFZ1d1l1VXNj?=
 =?utf-8?B?aVpjaFVaSWNVNmZUMzJHdXRwbVZmRXEzNEMzamsvTXg0MS9qUlVCdUQrdmpS?=
 =?utf-8?B?Z0p2ald4bFlOcmxxTFBBR01UWjY5UjY2RHFqbE5LVzE1MjhkTmtNSTNMQ3FQ?=
 =?utf-8?B?U3FqNDRzdlY3SFdmeldhbXhtYmpiTGJBMXRRbmtEUVVneXBPaTJGUjYyc0Uz?=
 =?utf-8?B?WlJBSkdoMHNlR2JIZWFzTlhIWUliVjFnQ0x6amRrZzYwdHJZdno4MFpuRVlx?=
 =?utf-8?B?QkZsUThFdzFFazlCN1lwL1pVeWMzZnNhb0xaVjRMTWpGMm1GVW5lZGlEWkJj?=
 =?utf-8?B?bFpKQXNVMTJaNThUQWFyYUZ6Qm0vYjhLMENpWVBLdEVJbVlPNFVnT3dVZ3hS?=
 =?utf-8?B?eDlwNklDZ0hTY3V5bmF2emhBSU1WWnRhUlpJL2VhNTF0N0xZY0pQRUxwYnlB?=
 =?utf-8?B?U3NSUkFvdXplcklxT1lIMnVUQ0xnbmJUNlEvVEdDQTJpdlB1M3hoYlhvTmNn?=
 =?utf-8?B?d3pTa0luR09iT21ZL1lKS2pGa0R6TEttdkIvNHN6Nm5JZG9GdlN5V3U4c3p5?=
 =?utf-8?B?eVcwbGFOdHZqYkovRjI1L2JtZnJvaTNKaXhPR2RzVjNpWk10ZTlHai9aWnpU?=
 =?utf-8?B?dTRKamZIM0RpOHB1QTlUdHYzSzk3Y09kcW9ib00ybnNxUklEUm1lNFA0cTdW?=
 =?utf-8?B?TWFSRmNGNjFKN0YrcU1PKytERGNZbWhXdHVpK0FpOWNyWTJYLzJVOFNjeTZu?=
 =?utf-8?B?eEQ4SlBObVNGUnM3dVRWaFM4MkdUYzNXWUUwUk52THB2cC9jaGhTUEUvYXls?=
 =?utf-8?B?YXlmY2F2TWYvV3BZUFVTajlzcVZKenA0RTF1Vlh3c0szYXpmUTJXbGhiTlVC?=
 =?utf-8?B?WEdjUm5nRFhUVUFzeXpKakt0WlUzQlBuY1l5VjlhdUptM2FHV21KZ1lIckMx?=
 =?utf-8?B?UEpCbDhEcFVDUU5NUGE1Ulh4Q2M3YzhHdFh3MEZLVFdxS1VJVEJtSnZneVEv?=
 =?utf-8?B?T2JYTFgvdFI5SDlXN0tWTGZKd2g2RUQyL2dDbWNESkFFR0VaUWo1cThxei8z?=
 =?utf-8?B?MHFLbUlaSUxaWVg4cjBkQXZjUkJFL1pZRmdmV29FR0RZWXVEMVdoSlhsVTlN?=
 =?utf-8?B?MFRBVHBJRzBOQ2FaMlpOUVRGODdvWGg2b0R3MFpXSlJsdUhIWDdoOWRZVlly?=
 =?utf-8?B?S1VSVFhPeXkwcWd6UlhUVGdsMmNSM0xYRllUM01QYkpnZSsreDRkamtmR2pK?=
 =?utf-8?B?SjBJMEFqL2lqeWhVei9zMWYxeU9KK0o1eVM2THM0NFVsRXRBV29CV0QraVhD?=
 =?utf-8?B?elM3TU1DSmVZTVdyN25TZzdmNEYzVzBRVmVuOTM0TG9QR1MrZXNBbzNMbXlY?=
 =?utf-8?B?Ni82amZmL01oS2oyUXM3UnFnUEhrVHM4UkpPQUtXSUo1QitYQm5RaWJ4QlpZ?=
 =?utf-8?B?UlJTTTJ1QkVHMmI5QWJhTjBxYWVEZWo2RVpwc3Q4blZoZk9GbmY5UXcveWdX?=
 =?utf-8?B?VTduTlZJS3pmTG9CSFpTVmk3QmdlelZzaTRoZWxxRTc1TlNKTGtGYnhGd0pX?=
 =?utf-8?Q?0ulxm2u6TzdtW0Q0G3d1Wg2aMRq4Q3XN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmp0YlNzUGZ1MEFTbEFYSkZCajBKZ0NVQ3p2YjVMUVZjL2dzMWR0YklUbXF3?=
 =?utf-8?B?QSsreHQ1a0QwWVNEZGdGTHByVGhEUU9hcjF3czVGbERkUjZ3U05KNUVjUXdP?=
 =?utf-8?B?YXVGeTlRVHlSdGxIS3dJaG5BL0R1UEV0NGZlZHpwdDlRZnZUeEtQRm1nUnFv?=
 =?utf-8?B?OTVIbEEwdGhGUUJoZ3R2NEh4UmNZbmtCeEx3VnR1VURIVndESTNPZVBxRUNW?=
 =?utf-8?B?ZWlqYlhSRmVTTUVlSmFqbTJ4aWN6SW9mZ1RYWDg1eDNlSzNQWm4rZ0JjeXlW?=
 =?utf-8?B?MjJBSHhpNVpUR29Md0FJdi84aUxIeU9XN1VOL1BHNXZGdlhTT05WOU8veDB6?=
 =?utf-8?B?ZHBoeVV1UjhEWDQ4d0ozZVRJc3JmQVFiVkw3a0dHR0RQRExmOTVyd2ZhK0Jp?=
 =?utf-8?B?aGFqK3FsK3grTWJlREU5UmZuL0EvRDRqLy81Wnc1ZVJpWXJVWlZxQWZ4b3Vp?=
 =?utf-8?B?UzJQckxHcGpXTFMwN0NKTFNjVWZyejEwQ1dLdWg3SDhQNmVWbFptOVQ5b0lJ?=
 =?utf-8?B?VFV6NlRqTVhxUk9zYjJVTGcvcmMxZHlqdzUxN0RzTDJBLzlFdnpNeEZLbVlr?=
 =?utf-8?B?QXVheDh2aVdyVDZ4ZkNNMXZWenZkQ0FEZmszUEMyYWhocjVJUm90cHZINHBx?=
 =?utf-8?B?TDRqY3UrdWJXaXJlTm1PK2VTVW5GRTV6Sm5OcW9mTkQ2MW9TUTRzSWRITVRP?=
 =?utf-8?B?VnBIQW1IWlI0K0Z3eHJLYTJwOGV3UGw4OHhva1ZCR0xETFE1endJTEZsMjFP?=
 =?utf-8?B?WjB1QmxrbG80akpUckcxbDlKWkxLcGtaeGtSVXRpQzd5RzRPbmRCWGgvV2Qz?=
 =?utf-8?B?em10VVZZb2pDQUVBSjEzUlc2SVJBSjhOclFtYU91ZTE2eEJ1d0xpYW5DRDV3?=
 =?utf-8?B?RStsRkFTRjIybHdNa2taVUpUMkdtYjBWN2xpcGtqeWNxUEFVQnhqaUxSYUZw?=
 =?utf-8?B?bDhOcUwyNGpJK1VjZjVYZGI5ZjErTUx3ekVscDlwanl5cUdqdFZaemtlL3pP?=
 =?utf-8?B?Rnd1bHlNek0xZmlGTjBtODhQazVOejZEMGpTaHErSjAxb3ZqcDIxWDIxRUJ1?=
 =?utf-8?B?emEyRndoZCtoNDNEeitmTHZEMTV1YWJ3ZXNFWm9JQjk1R1VRVW4ybEVNaGdK?=
 =?utf-8?B?dnFwNTV0NzRWT2lBTVZvZlpXSURGdTRGUjVEUXVrWU9aWUdtaDdkRENVdHls?=
 =?utf-8?B?Yjd1aXJxOFBEZG9RM3VUVWlQdDJhYS9lUS9POVdna3p6cnZ3UDhIekxhaTF1?=
 =?utf-8?B?bEZpd3ZiMzdlMkpORXpRdGVNdThHUjN5T3dBZjAxRTNqTnpNUnVxUEhuY21O?=
 =?utf-8?B?Q1lEYlVnc2ZPMlgwK2N3SjBZY28yL1JoV0txY1pVdlI4T3MzL2MxVUt2dHRS?=
 =?utf-8?B?aUdVazJtdXROK2h6SGw2Z3dFQUw1NUJOVGt3ZVlLdFM1aWJFN0VFMzhBdGc2?=
 =?utf-8?B?U0c4amhqenlYbElOcGtXbVR1OEpzWmVzTnlkRUNKQjFBaGYzL0FnWE9PQ09M?=
 =?utf-8?B?elRzTW1xeHEyL1NlaWMxTC8wOEZaeGVVS1FQendxRElweDBWT2txSGFNbGw5?=
 =?utf-8?B?RGluaDNFRitJaG05Q2NvckJybkdsVEF0TlFqcVoxWlJFZm1qZElMRE5peUVn?=
 =?utf-8?B?S0g3OVNDWmxzS0gxeXUxOExjcDg4ZTNpNHZMVmdua0VaVEFLMEZTNVBySiti?=
 =?utf-8?B?a05ZVGc4emg2bG16MEttWitVaUkzWjRmZ3NsSjQxd3RpWkdWOG9ST0hMT0hH?=
 =?utf-8?B?bUpVcGtQV25OTUVYNmwxTmpqeHhibEowbWxQeTgvUFdodlR3WFN0R2VBUmJ4?=
 =?utf-8?B?d1B3UmJWMDN5ZzNHc1VWMTJMNkFqWVBTKzNlQVU0MUJHS01BZWhOU0Fxc1My?=
 =?utf-8?B?V0g3RG8ySS9nZkI5T2QxOC9SMm5jNjRKVjVzVkdmTGt5SFhCcEtrdUo0SnpM?=
 =?utf-8?B?N2Rwc0oyY0F6eVlyQ2hLZTR4SW5CYVdRZW9pQlZ2L3U2WGdsUFNYTHFiQ05u?=
 =?utf-8?B?UEJRVmUxUXJudlpINlExWWdVbWlLU3dFZ1RuWmk3a0VWMkJVdUlnRUhidGhD?=
 =?utf-8?B?ajl4MUwyOVRoRlhEWCtYbHhhUXA3VEdCS3hYWE5oajVldnREQTVrSTluc2Rp?=
 =?utf-8?Q?np25WwNwJuBihb+hM3nhRVixU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e4fd8e-f6d2-41a8-8dbc-08de01f0f8fb
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 20:19:21.6545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/goUfHE+CoMJeenKOSNsvp50bfkDHbfYa7F4A4Ve1pZWkXS8alKsWD3BMp6Wrlk0MkJ3CgZlXTtMbA9Zq3AIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6421
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

--------------aGhGH8sdWp4eoYmuROVStXFj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/2/2025 7:54 AM, Matthew Brost wrote:
> It is possible that the media GT's VF post-migration recovery work item
> gets scheduled before the primary GT's work item. Since the media GT
> depends on the primary GT's work item to complete CCS restore, if the
> media GT's work item is scheduled first, detect this condition and
> re-queue the media GT's work item for a later time.

One print related comment below; other than that:

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

>
> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 49b68a4a1f2b..cc77a763c0c2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1110,8 +1110,22 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>   		   pf_version->major, pf_version->minor);
>   }
>   
> -static void vf_post_migration_shutdown(struct xe_gt *gt)
> +static bool vf_post_migration_shutdown(struct xe_gt *gt)
>   {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	/*
> +	 * On platforms where CCS must be restored by the primary GT, the media
> +	 * GT's VF post-migration recovery must run afterward. Detect this case
> +	 * and re-queue the media GT's restore work item if necessary.
> +	 */
> +	if (xe->info.needs_shared_vf_gt_wq && xe_gt_is_media_type(gt)) {
> +		struct xe_gt *primary_gt = gt_to_tile(gt)->primary_gt;
> +
> +		if (xe_gt_sriov_vf_recovery_inprogress(primary_gt))
> +			return true;
> +	}
> +
>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>   	gt->sriov.vf.migration.recovery_queued = false;
>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
> @@ -1119,6 +1133,8 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
>   	xe_guc_ct_flush_and_stop(&gt->uc.guc.ct);
>   	xe_guc_submit_pause(&gt->uc.guc);
>   	xe_tlb_inval_reset(&gt->tlb_inval);
> +
> +	return false;
>   }
>   
>   static size_t post_migration_scratch_size(struct xe_device *xe)
> @@ -1193,11 +1209,14 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
>   	int err;
> +	bool retry;
>   
>   	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>   
>   	xe_pm_runtime_get(xe);
> -	vf_post_migration_shutdown(gt);
> +	retry = vf_post_migration_shutdown(gt);
> +	if (retry)
> +		goto queue;
>   
>   	if (!xe_sriov_vf_migration_supported(xe)) {
>   		xe_gt_sriov_err(gt, "migration is not supported\n");
> @@ -1225,6 +1244,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>   	xe_pm_runtime_put(xe);
>   	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
>   	xe_device_declare_wedged(xe);
> +	return;
> +
> +queue:
> +	xe_gt_sriov_info(gt, "Re-queuing GT recovery\n");

In every other message we call it "migrationrecovery", let's keep that 
consistent; GT will be already mentioned due to selected function.

-Tomasz

> +	queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
> +	xe_pm_runtime_put(xe);
>   }
>   
>   static void migration_worker_func(struct work_struct *w)
--------------aGhGH8sdWp4eoYmuROVStXFj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/2/2025 7:54 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251002055402.1865880-33-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">It is possible that the media GT's VF post-migration recovery work item
gets scheduled before the primary GT's work item. Since the media GT
depends on the primary GT's work item to complete CCS restore, if the
media GT's work item is scheduled first, detect this condition and
re-queue the media GT's work item for a later time.</pre>
    </blockquote>
    <p>One print related comment below; other than that:</p>
    <p>Reviewed-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a></p>
    <blockquote type="cite" cite="mid:20251002055402.1865880-33-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 49b68a4a1f2b..cc77a763c0c2 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1110,8 +1110,22 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
 		   pf_version-&gt;major, pf_version-&gt;minor);
 }
 
-static void vf_post_migration_shutdown(struct xe_gt *gt)
+static bool vf_post_migration_shutdown(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
+
+	/*
+	 * On platforms where CCS must be restored by the primary GT, the media
+	 * GT's VF post-migration recovery must run afterward. Detect this case
+	 * and re-queue the media GT's restore work item if necessary.
+	 */
+	if (xe-&gt;info.needs_shared_vf_gt_wq &amp;&amp; xe_gt_is_media_type(gt)) {
+		struct xe_gt *primary_gt = gt_to_tile(gt)-&gt;primary_gt;
+
+		if (xe_gt_sriov_vf_recovery_inprogress(primary_gt))
+			return true;
+	}
+
 	spin_lock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
 	gt-&gt;sriov.vf.migration.recovery_queued = false;
 	spin_unlock_irq(&amp;gt-&gt;sriov.vf.migration.lock);
@@ -1119,6 +1133,8 @@ static void vf_post_migration_shutdown(struct xe_gt *gt)
 	xe_guc_ct_flush_and_stop(&amp;gt-&gt;uc.guc.ct);
 	xe_guc_submit_pause(&amp;gt-&gt;uc.guc);
 	xe_tlb_inval_reset(&amp;gt-&gt;tlb_inval);
+
+	return false;
 }
 
 static size_t post_migration_scratch_size(struct xe_device *xe)
@@ -1193,11 +1209,14 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	int err;
+	bool retry;
 
 	xe_gt_sriov_dbg(gt, &quot;migration recovery in progress\n&quot;);
 
 	xe_pm_runtime_get(xe);
-	vf_post_migration_shutdown(gt);
+	retry = vf_post_migration_shutdown(gt);
+	if (retry)
+		goto queue;
 
 	if (!xe_sriov_vf_migration_supported(xe)) {
 		xe_gt_sriov_err(gt, &quot;migration is not supported\n&quot;);
@@ -1225,6 +1244,12 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
 	xe_pm_runtime_put(xe);
 	xe_gt_sriov_err(gt, &quot;migration recovery failed (%pe)\n&quot;, ERR_PTR(err));
 	xe_device_declare_wedged(xe);
+	return;
+
+queue:
+	xe_gt_sriov_info(gt, &quot;Re-queuing GT recovery\n&quot;);</pre>
    </blockquote>
    <p>In every other message we call it &quot;migration<span style="white-space: pre-wrap"> recovery<span style="white-space: normal">&quot;, let's keep that consistent; GT will be already mentioned due to selected function.</span></span></p>
    <p><span style="white-space: pre-wrap"><span style="white-space: normal">-Tomasz</span></span></p>
    <blockquote type="cite" cite="mid:20251002055402.1865880-33-matthew.brost@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	queue_work(gt-&gt;ordered_wq, &amp;gt-&gt;sriov.vf.migration.worker);
+	xe_pm_runtime_put(xe);
 }
 
 static void migration_worker_func(struct work_struct *w)
</pre>
    </blockquote>
  </body>
</html>

--------------aGhGH8sdWp4eoYmuROVStXFj--
