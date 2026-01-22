Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A87D3EE63
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 13:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0FE10E99F;
	Thu, 22 Jan 2026 13:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISZYFe6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C52A10E99F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769088490; x=1800624490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uKQ8AcIO7TsjMtkf6bN/pGYF/b/haBza+H3FA6zjf9I=;
 b=ISZYFe6+dV1q5ATvb6olEYChsVLNsgJUFSFoYCheDY+k7dyb7pNoBaPB
 nnKUDHvMH3Q+MQvH7nT/HUB0LtjMfKAONu/JBr0KJcp3NjMxVAXrmie0K
 tIwcPybcdGLhx3oBiZYCIG607jhBiGr1D+885mi7dWrkD4o/mMKuVLOyJ
 +nXim9uQ7Zwarsx8BRyRxkamQHSATG3PEITixBqU/x8wR9a0Nbx71jE5d
 z+EVGc7keG8RPBI8WAsE9bwXHX3tiY3SUeIppyRUdkYcCxtZ6nOWuu9mw
 pLZuS0/sItZtZN9gVnDQwYVA6ai0Mu8vhBGh1Pi3lkmp2loJK8aipKR4D w==;
X-CSE-ConnectionGUID: vp5kqDRHSqqaPuy3ZgUi3Q==
X-CSE-MsgGUID: sxRbyaFUQTSby4TsWxwOyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="69523752"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="69523752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:28:09 -0800
X-CSE-ConnectionGUID: y0vNJmeETMKVu20JFDppfg==
X-CSE-MsgGUID: f+4GTTtZQq+kAV+56GUGOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="205856301"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:28:08 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 05:28:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 05:28:08 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.20) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 05:28:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KF+zw7pJKx+97mNRCQ0Pk7S0PdZcn+TqYw39HEpuKDlutDFF5lAE6dEcz1LQ7TOWx7OwnwWk2m2L8PXdggUCYrZ+CmBl8Ih6oanmSIlc3i4rTop5+ExPJ1sLuAOq7queeXvbsKyH0rabmKEDYDPYjM5GnmgHdY2W4ImbNYbzUsIjrbD3LeLN79k5kqNlbBAzsKDxMiLhZKmFR9BJgArigX9vGDmiIglHWk1MG7RXhcDxJ8nYXpTWwbUertWHD5LSHCYbUyMtwIOZobk9ncQD3Q0MzT/n8HS15aGWLC6FLzcdVX1i8QWJYJ/QbE4+ZkcquckSXkFbiBtRpAt9XSYmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgQzsbpdKN7obNDId+iAxIwViHxu0Pvu1qGOBqfYJA4=;
 b=SyjA4RKox57DSvrRMP2UOQAZeC9plpUbB9b3jlySA/1pEv52VM9nVyw5IJ5QA/XeoZlHVrfstqqwsGkR1316w7BnkjQH7Q7j+8KUf58lJLmFYDNXOTPhWdp0du7VJ9eLxz8DKXdeS79S3y9oor3t/K3IwuPPu+Ir9/lLNGWgb+d8y1Q5Ro0H2D46FMGv7ZTRGmUcdUFgoYyAxpHTNHmR3s4OyLdizLdDxnXf9ZFNyDArXHLVXi/xF8yR6k5siU9Rx8Jge/pfsWMvYbTimafmT+ZQrdxPmyeVaMxYQNrectdm/9OH2bTT9J7TIXESUGmePqSyuS51lcIy/RZ9gxg25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SN7PR11MB7420.namprd11.prod.outlook.com (2603:10b6:806:328::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 13:28:06 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 13:28:05 +0000
Date: Thu, 22 Jan 2026 18:57:58 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p
Message-ID: <aXIl3iPfPMmUIrCp@bvivekan-mob1>
References: <20260121143732.523081-2-balasubramani.vivekanandan@intel.com>
 <bb14af79-4553-43f0-b7a0-fac2e7f943c1@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <bb14af79-4553-43f0-b7a0-fac2e7f943c1@intel.com>
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SN7PR11MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: c59b843a-c3d1-464b-221b-08de59ba12e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjJzWHJpRjI2aXU0cjB4aklzNTJ4dWJzbVhQclNaYXpBbFRhZU9uaHFPSU16?=
 =?utf-8?B?K3JPNEp4cmRacDlzaFk2N1h6QWxuS3BXUEllTTF5UkFYR0liS3c4R2tMN3VJ?=
 =?utf-8?B?TFVmV0Zqem1TcmgrWFhPOXJteUJabW9XQ29JdTc3SEs5RFNOSC8vaGp2Vjl5?=
 =?utf-8?B?RkdXOFdLSkJSSGF0bmVFWGR1TTdyVlVZUGpnbG1FR3dDWmNyeC9nSGJ4RXNy?=
 =?utf-8?B?dEdvZGZPZytWS2xIeXQxb2luWjZMQ1pxMkJjSTFVTnU1YjVQbFZDZFNMam52?=
 =?utf-8?B?UGN0ckFkV3lrbUVxb1pLUUJXb1BVY0FRR2xuVzdCRHBXeFZWdkc1eHdiTFJJ?=
 =?utf-8?B?RkovczlJZ0JGbXluR0VrYXEwOTlvYWJ5bTdWem1XWDhHcmlyRkluVkJzTjV1?=
 =?utf-8?B?UjNodXhzMDU3N0JLR0EyY2hGY29zTlJYeldSdTdjakRoa01DOVBzb2NUS25D?=
 =?utf-8?B?THRzQ28vOGtOdXE1NStCRGZvUUZvc01aWjVkZ3h2Vm4wajk0a2M4YlE2RzFn?=
 =?utf-8?B?VTRKSElOTkdLbXF4L2lnSFhMWkdwYUROa09yZFdKRjJBOUlyWnZGdC9YSzJI?=
 =?utf-8?B?eld6cXlDUDB3QW5VVnA4N2ZlMm4rSWVyVEdYd1pZb1lpd0t3R1c5UWRMaGtS?=
 =?utf-8?B?VWpMaVQ0TlpjRE1TUWNvSFY1YUZPbFNjeExFdlRYTEJ4YXBId0xRcEVyN25T?=
 =?utf-8?B?OFZrYU9OSDNVL3R1Q2hQZzVqQlZFUEo5YmlEejNwbmxXY0krVlNDaFZiKzVO?=
 =?utf-8?B?K2dBQUNHOHpiRlR4cmxPRk96K2tRVlNGQ3dSNmZiRmU5MXp0K0J5elBiOG1r?=
 =?utf-8?B?OE5xNWFTdEQ5QzJ4MXdDYzByczZLUVRDc2tXSzVndmdDR1h2OVVMVGVLYkFi?=
 =?utf-8?B?NG1vM2VzRklEcjRiNCtrMndoemdQZDdaRyt4T1FiQmc5cTZQTHllOXk0VmRu?=
 =?utf-8?B?dXlnR1lZTDhDUXlmaXdMaUloem1DZ3E4eWw0NDhuM3RaWnNudlFxamhPRzND?=
 =?utf-8?B?cFYyL0dGNUsvK0U4aFR0M0RHMVk0S0I2bmVObWJlRmU1aldnN1k4c0ZKdWNq?=
 =?utf-8?B?c1RNazEvcGtuQ01oa0M1MWs5a3UzSWRzLzc2M1I4Q0tsU0RtUEUyTm50ZWw2?=
 =?utf-8?B?cFp1ZFdSWi9zVlZNNVArSGVGcjZCTTRCRFZSVHlTV2ZFN1ExaU9iM1RNbVZV?=
 =?utf-8?B?WWFjeXJuN0wxeHk3eHRFbFMydUFnNFdHQWdTZGNqendVTXd5VkQwaVRQRy9a?=
 =?utf-8?B?R2xyNEljQ2ZrN0xjQTZ5NFJWWWpKbjJMejh6cnZSMC9EZHplZEJzejZOdm1h?=
 =?utf-8?B?T1pPT3BHd1hwakJEWDY3U1ZXVEZnSUMzNERwZ1QxTXdJT0gyQ1k5Ui91QWll?=
 =?utf-8?B?cDRIWmplcW01eUhMRlRNZDNSNXNwdTl1Qk5mM3kzeUt5L2M4QmM4U1B0Nzls?=
 =?utf-8?B?UFUwTHcrcVpwUzkrWU5pVUpXbk5xekV4WHByenJVeGxldkZ2QVF6KzNrZDY2?=
 =?utf-8?B?NjN1S1dyMktVVG50VHROOTVPOWdqSVVqekl6QTJ1TCtqdklzeFF4MHU1OFNY?=
 =?utf-8?B?dTBPUmpNYnQ5V05CVkUzRHYxUGh5NGREMWlMZVd4T2xrM0QxVklVQTY0QnFD?=
 =?utf-8?B?THowK1plZzdhbVVxM21oQVIrRjIyT2JubENXbXU3VHRQb0tjRWw4RHRLV2py?=
 =?utf-8?B?ZHNMOU85RitvY0pTR0N6bk9EenNMZzV2M1NiT2RCb0JUQkVIR2MyQkxYMWND?=
 =?utf-8?B?QndZQ09PWkIxeERsQXU2VlVydUFRbytUeXVwN1NaUUJqREZCeWJKbnIyUmhw?=
 =?utf-8?B?QmFzQVRxd2UwS3dYb2VGb1pKcUhOVnNWeEszbE1YREhmMHYrWGlQM2ZZRnQv?=
 =?utf-8?B?M25ibVlDdjViRTc5Sk84VWdZTTZVRTFPRHNmcVdqZk4yVzBaTHFQTVZxbHN4?=
 =?utf-8?B?SGt0eUVxMmNVaHNXeEdNUTllL3JCT2tMUXRXQzMzSTBFYnNuZ2c3Q2JUeTBr?=
 =?utf-8?B?YUxvMHlqdERjNUdLbjF1VzdHY2o0WjhaSUFUU1Y0THJWQWxiR3FqU21tMWVk?=
 =?utf-8?B?R05CR1BzRWdiTStKdTZlTXhHWHlVTmhldkNsL3pmbVI0TW5Na2c1K2RONjND?=
 =?utf-8?Q?WWMs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk10VW9venVoM3lucWpwZm5ZWGxlZkI1VkJ3TVQyL0RGUzJkNDhJY1kzRXNu?=
 =?utf-8?B?ZlBEUU5hOWdmcmpRblVOeStGajV0MEgwV1lFT2xHTmtFTndGd3FwYVhFS09D?=
 =?utf-8?B?cEROUWxEVGxMUHo1TURLMTBva2dNV0ZOZmx6VUxnRnFEcmhuMWlPNzVDZkVY?=
 =?utf-8?B?RTloSktvZ3ZpWVI2M09DODEzNktpMURBNFFxek4zY2ZIa05xV1dpNkZUNTJ5?=
 =?utf-8?B?QStWMTZ6cFZQRC9wMlZPSVF0UWc5YjFOK3Y0SXFqYkM4QXp6MHZMMXJybVNZ?=
 =?utf-8?B?K2djK0RJOWVsSU5MMkJ1anhscVoybi9WOXIyR1luUXZlN1B3dzRvcUtDVCth?=
 =?utf-8?B?RGlvNWNBbjZBa0NraHJlMWkxa3VXWmNCYXdnRDkweW93bnpReUJoU2MvOHdW?=
 =?utf-8?B?R2VGdFQzMXpDczFxbDg4c29qemFldzdsN3ErRllvM2JNellqdHphUlJhR0FB?=
 =?utf-8?B?NkR4NXJDYlFrMXFQWFFIMVpCVi92a2xwazNVN1RiVHkxcUxaT2ZyVGg0M21Z?=
 =?utf-8?B?ZGIwTG9pNkJGZGdUTGYwWFVZWkp6Q3JoaXJHWHhRd3JFWURXamVERVBPVG8z?=
 =?utf-8?B?M2o2WXVBL1d1ZnpKR1BlWm9KWG9aYlh0SUI2Z1ZoS1dVZEtaSktyKzZyd3ps?=
 =?utf-8?B?Q1ljUDhXWFhhQlc0a1JNeXN3S3YwK3h4NVRvazJyQVlMTGV4U1Q2enpJK1RD?=
 =?utf-8?B?bEhaZkprMzJLK0pUMFl4Y0FONU1acFlRRXR5bmVEUW5uRE9OV2c4dU0rMnM5?=
 =?utf-8?B?ZzdGWi9rREVaYWxRT3BSa3lRNUFqUWZVWnlZek5QbjJjcFY2bFhqZFYwaDNx?=
 =?utf-8?B?czFPK0MyU3ZHbk1JNFNjMVRhWmVJT3lCdDA2L2tsWE5xRDR5MFlod3dHaXJI?=
 =?utf-8?B?Q1ZBWVZJa1JzVUdtQkh2alp6azZOYUo0ZUtJaVZkK3dXSk9GUTk5ekRJQzBE?=
 =?utf-8?B?Ym90T3hmMFEvQ01NcUYwZm13WWNFNE05ek5DdmpjNHJhcUNCTW9jUVJleVhU?=
 =?utf-8?B?Tjh3NXBvaUFpUlZoMnozUlRqNU5HR0QvWi9UZHQzcTZyaVJvYzZjRFhJcTRq?=
 =?utf-8?B?VDJiUzl5ZExrcUdSZGo0L3JHWUtvdWhISkhvUVNHRjVTcUpGL0NTM0pJTEMr?=
 =?utf-8?B?QVB4K01PaCtoUHlzaGp1YlFKUjBzM3ZsQzVqZi9lOEJ1dTNBMFdTN24vdDVW?=
 =?utf-8?B?RCtlZE9zc0tYRk9EUzNtRVV3RkhDazNGUTk0UXordUgvcUNHaTRaQkdSNEp6?=
 =?utf-8?B?bC9sbWYwSnN3anJmSm5YUTVwMDVOMVBzd3NxZDNMYU1PRXMwNTlna2xPcHJH?=
 =?utf-8?B?TWtwT3EyWDI0dHJiNFVQa0hPcTA4UFF6MFFQdERRcm1YbnZQU08yazlqbWw1?=
 =?utf-8?B?N0RzZjRCZlp0UEFIWU5Fd0Vic1lQMGcwcVlJM3FqTUJLVTJBcjg3N3puNWpw?=
 =?utf-8?B?ZytjSytOeEJheFBPdVFxMFNjS3VkUlJLMmVrWTV1NjAydTIzNHZlWjQ1eFND?=
 =?utf-8?B?OEYwMHRQUWowWmdKeStueWJ4TjNFQUt1SCsvVkpDbjZFbStPSXlYZ2xTclI5?=
 =?utf-8?B?Sjlya2s0d0dFeGIyRDcreXJ0WXp1R0JmRGhVcXl4UkxWRVRwNGtqZ3RVWWh0?=
 =?utf-8?B?WFllaEd3ak40aGlHYXhsMkJiRzFncUVSbnYxclhxcmVrdEdqZUxsaCswV0Vk?=
 =?utf-8?B?U1BiV0NhSmJmSng2blBLNklsMjRmRS9pRC9aYnhxR1NTOFp4ckxFaTV1T25J?=
 =?utf-8?B?b0JWVHJySzB6S3ZOdkNsSG8wS2dNOTFwOEw2N0luVkVqbytWOHhGQVNhaTd0?=
 =?utf-8?B?K3lXbmdldmNvZmZZWFdWSTAzaFVvK3FMR2FNNlhtYSthN0JlMEhPY29pQkpY?=
 =?utf-8?B?eHRxZlhPdW5ZN2VXSWpjL1htQ3dXcjVpSkxjU3VQcGNUWUFvWHhkZzlhOE5X?=
 =?utf-8?B?Rm9rVUpaSU51SnA2U09PVzFQejZGc0pzdE91d3JRdklsbUd0c3BWL2Ntc3gw?=
 =?utf-8?B?cXdzaDRYcUxVSFVaUW9xWFh6aGF3TVM4K2x3UkZrbXAwMWZxcnl4bWY3WTRv?=
 =?utf-8?B?ZUFqaEhhblc3VWorRXF4SWxzNWpybkxsY0kxdUJlRExaZ2hrMVlUUDc0MFVa?=
 =?utf-8?B?V1pmM243aHNNb2NOMVd3eXZ0ME1NeGJwV0xsY2dQaEhoc21UcnpZR3h3Nk9y?=
 =?utf-8?B?MHdxT0JIZmhmY3hxbUxkSlo5c2diVXVYamhaNU52N2Y1SFBNcFhOOXJEYUJ1?=
 =?utf-8?B?em9JUkxhbmFTY2w3RWdodS9OMDZMbG02TG45alNROWFBNG1yRTYxcUxFa2xB?=
 =?utf-8?B?d1VQSEo0UlExSm1ybDVnTzM4R3VURjQrNGNjQ2dHemhNd0xCSlM3MnMxMzgw?=
 =?utf-8?Q?UzyE+un9HniwwFbDOim7vJPG+3YScAvAnCnBz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c59b843a-c3d1-464b-221b-08de59ba12e5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 13:28:04.9908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvPSwDG9hWMLsEfuK4BnVc/oT1fJQaBXiZdPJELReJRAQjvKd22th+IG/QG6jgsX3Ba8lNTZGJL9e+yoF4RyVXeTSxUNKaPc5C+japqsnGi92Px+cOioHcejMCaZ0TBT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7420
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

On 21.01.2026 13:06, Daniele Ceraolo Spurio wrote:
> 
> 
> On 1/21/2026 6:37 AM, Balasubramani Vivekanandan wrote:
> > From: Gustavo Sousa <gustavo.sousa@intel.com>
> > 
> > The Dynamic Inhibit Context Switch (ICS) feature is not currently
> > supported on Xe3p due to conflict with multi-queue feature on the GuC
> > side. Disable ICS so multi-queue can be introduced for Xe3p platforms.
> > 
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 44360437beeb..e350ded92544 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -608,6 +608,13 @@ static bool supports_dynamic_ics(struct xe_guc *guc)
> >   	if (xe_gt_is_media_type(gt) || gt->ccs_mode > 1)
> >   		return false;
> > +	/*
> > +	 * The feature is currently not compatible with platforms with support
> > +	 * to multi-queue, even if the feature is not enabled/used.
> > +	 */
> > +	if (GRAPHICS_VER(xe) >= 35)
> > +		return false;
> 
> This has been fixed in GuC 70.50.0, so this check shouldn't be necessary.
> Are you seeing any issue with that GuC version or newer?

okay, I wasn't aware it is fixed in 70.50.0. Thanks.
We don't need this check then.

Regards,
Bala

> 
> Daniele
> 
> > +
> >   	/*
> >   	 * Dynamic ICS requires GuC v70.40.1, which maps to compatibility
> >   	 * version v1.18.4.
> 
