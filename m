Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61E3C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 07:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD5D10E9BE;
	Fri, 16 May 2025 07:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWWImSs+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F33610E9BE
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 07:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747380081; x=1778916081;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y5wx/6D+pZn8pvDvv8nIg2mlclHEGU7E5Jj/Ny7QuVQ=;
 b=AWWImSs+PaMiLPYjVTW8ZJMdoZMoyuSCRLdmy8iSps6EP89mwLnfgTAV
 UXhWL8NkMbVsVosNJ1sURD5OfiJ0zwf70nyDK364zlT95LJhbg8lEALcM
 Q5pnLofaRkYJNbTKFIiPSWOQ+IeFpKRPC3UeFDkQ64/vRP85m17qA8HQ+
 eHUZN8lTiqEB88rS47BvLHM+jfILMRUvt1ezWo8rmp/LTroyMHVPOQN0c
 PVg0E4aGRUHx+7UMpnYFW63nFy45UcBZdRW+5h3cfH3eKIJBzjKXg5b8h
 euMlPSAO17RiJ9P8IUn8nVVij6Kyca4nbhBx7rduT3mt184T1rn93OfN+ g==;
X-CSE-ConnectionGUID: gnsnMdCUQGiQCbOs1dxXtw==
X-CSE-MsgGUID: 0W/w5Ga6T4G4rgEKWHcptg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="59997420"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="59997420"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:21:20 -0700
X-CSE-ConnectionGUID: 2GGnH1r1Q1KatO9//lWNYQ==
X-CSE-MsgGUID: C1MxzThoQoKuQ1s+RxwY6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="169668083"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 00:21:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 00:21:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 16 May 2025 00:21:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 16 May 2025 00:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqQwj0Tkpdf8BQv55FHdCq/dNe6+Mzj6QA+D9zSpOekWoA15aeP6ZlrX+VhXmB3+0XVrypHYsFDsgaYsrrPaRYa2kPndZ8YGnJNA2kZRda8N+uCINRuTs1w1GQt0PUElJow8c3f9RuKAWXWLjJ/VUkXjrhAYly2+RojDlmWR3ipKOfpM9qKpXm45WRvf6HYANW9+al5MiruBbdwxEiBwzrS06nxzeio5nhzGqt8DI6dmvvPMmEX3ouZQJmHbTZQJ65HMiP9c8PGrnBfrJzK/KNCYQI0Q279ie/J6lUEUaeOwVVDKS3OOMNZ5khhzk/b0gyl08m9VbbyPhz+CWoVRcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hU3Jji1v6eytWweE66HL0lHOmoPwpvFmVYhygo/o91Y=;
 b=hp2ixxfrIiVZNbcqrTglrI2bCbF0MXgHe4EGQ54MFL/sRIhWEKGv2W/FAwVsutuwdEP53QCkenzi2x3twVhtRRlamqi43xxjI4FX5V6MBh4WvEp7ghTnwgHJuY8lfZ2FkhD06kcXmFF0Qy8zK0FuIt+p/7qfnsx9pWxGnDfd0uIkEP6W912SR6MR6sj6tVkd1myPg3PBaqiaAWJoxj3TzBQHza4z9N4pfoy6gMvdi4NYKL7xNxIaf/MOeB6Mp4aS153rXrmTUBPkm7BQsyzgvTJ06CKSU2ZsqGUc9jpF5bIu8KTiL+T4QKrhGMcdwhLQPFpCC7dF0k/i+2gnTpCLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 07:21:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 07:21:03 +0000
Date: Fri, 16 May 2025 09:20:59 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJtL3hlL3Bm?=
 =?utf-8?Q?=3A_Don't_allow_LME?= =?utf-8?Q?M?= provisioning if LMTT isn't
 available on the device (rev4)
Message-ID: <20250516072059.kmthcuhpe3c57hqc@intel.com>
References: <20250513071321.700464-1-piotr.piorkowski@intel.com>
 <174720023313.77193.16536499241552379885@c664b1dc75d1>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <174720023313.77193.16536499241552379885@c664b1dc75d1>
X-ClientProxiedBy: VI1P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::9) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB6289:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2717d1-8ee4-47e7-a766-08dd944a36eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjF5d29ON1N0aFhMT1FGbUhEb01xcnZHK1A3UWNCMnhGMm5XUk9yQVJSZEhK?=
 =?utf-8?B?Y05Va3d5UER6Nzc1MTdxZXhWU0dTM1RvWkVFUXNRcUc1UW9zcVZUL3lUTkFG?=
 =?utf-8?B?a1dFUEF4ZkU1NlBsam9Weld5a0cySTNCVzNhU0dCWEhmRTRIUFFLWFhHZ2xV?=
 =?utf-8?B?NE1TdmdCMTZjRjNzM3RhNlBSNjhHQUhUNDRERHpLTm1aVU9mbnR4UDZXUCtP?=
 =?utf-8?B?WUsraU81RkZCWjBESys5WjBIcGNpRWdSa1h6YjhvRDlONnF4aDRkaHIxNXBu?=
 =?utf-8?B?d1lPRUJNcmdmUWZ5MVp4MmZuU0lkNGJVUjlRZ0lNZmpyOEpiQ3NRWUlpWjJ0?=
 =?utf-8?B?ZzBUSnRWbGM4dENTdDFoeWc4c0M1V0Rsb3ZtQzcwSnhTS3dZWnA3c2o1a05S?=
 =?utf-8?B?K1NCMFg1SWlJVE01Yi9GT0s5M3lhc3JiS1l4bUtyRk1pcWxtR1lRS2lOMnQ3?=
 =?utf-8?B?MC9YT0ZoNHlrdW9UdDJMcjZhdndHRHhzaFhtaFhHeCszbHlvR1JJTDdHRytG?=
 =?utf-8?B?RWNPYWhBYnYrVXFqRk9CeGtuaFFqcHJqQkJ3Z0xZWmszSFdiT3M4ejUyN3Vr?=
 =?utf-8?B?Z1lRQmR0L2cyQ1U2NWo0T3ViTjN6MDBIWkp1N0V0TStvSzliU1NFWDNTQjVN?=
 =?utf-8?B?cTBXdkF2bk85VGVsd0x2UTF5QkdGYzJicXZDQWZDcTcxdXFyc1dTcXpwZytP?=
 =?utf-8?B?dGN5UnVOQ0dDdDdrclNFWTRyckN6OWY3aFM4ejQwN2xXKzdyMFJpNXdaencz?=
 =?utf-8?B?b2lmY1NJS1NTeUlkOUhvdGZ2K2lEQ081blZLVjFoU2wvajFGUU05WVRPMjBK?=
 =?utf-8?B?TmRmOEN0bnN2N2h6TUI0aktBbUdOd0RYZnJ1VVdrNlVpR2UyYktyeEgyNzlU?=
 =?utf-8?B?MW9PNkRxVnV1RzZyNWU5dE5ENU9OekJJMndPckdObXBtSWdTbHNPUHJTTkNr?=
 =?utf-8?B?eWlkVklVR0tjVG9KcUlNelRhYVdqYTZBVlY3bEh2cHc0NUdRQWhCam8vaytN?=
 =?utf-8?B?WjNkUmJGZGFXTkJBbFY3eEVmaEg3Y0dFL3RtY2MwOUh2U2tuczExdWd2MjB5?=
 =?utf-8?B?ZzJpZzlPRFA3YVNMUFlFUzRpTzZKOXNvamxsN01aZ0szbndjcVJoQlE0eWVz?=
 =?utf-8?B?MEJVcGxSQTMyakNxM08zaFozd0c5SVNvMUp1UGJ0MkRlRG1PQnZNdmNSVitl?=
 =?utf-8?B?N09UQ3RGZzFlTllsNzZkNFhqNmVRLzVlZFVyQXpNajN5WE9rMU5qOGFSeFRn?=
 =?utf-8?B?RFpEaFdYcHZLemhWVml3endRRk9MYkZhQTFKcDF4SEs3aFZYenkxeDIybW1o?=
 =?utf-8?B?VlNHS1ZIcDRRUVBUblVaRmdVYXFjMFJYcXdjWWdheFAvekwzL2pwQ1ZuWWNS?=
 =?utf-8?B?eWd4RUFUNFppL010NFRpSk1qV0VPV0p3YUVjNjdzaFJGZmNhTnBucnFyTHVD?=
 =?utf-8?B?ck9KSDVMTmN1Vlh6dytzUzlicGZSV3lTMm1lS1FOU2poS21Ca3N0WGU4ZStU?=
 =?utf-8?B?SWdVUUhlM2RDSHhJa1hKcFVweWg3N1d1UXpDM0MwL3dGR0ZWMDl6YmJ0K2Iy?=
 =?utf-8?B?VmVraTBCZExzMGRoL2JyZi9KUGdoTlpOVnNZMFNvTE5CaDNFT1hvK3RkQm5T?=
 =?utf-8?B?UkhXNk9GM3A4M0lQcGVJQ2tXbUxPNHcxcjZ2dHhKUHFzVnZxVW52YUs1d3ky?=
 =?utf-8?B?dGVNK3YwSStzdDdKUmJVclAvTTJXblRjdG4vT1ZDcWhWa2xkbVp2Sjk2djF2?=
 =?utf-8?B?a3BFcnFQZVZFSmkzcTBxUVN2YUpOVEg1NzlySGU0TEVEN3l0THNXR05uS05l?=
 =?utf-8?Q?A8LhfVTVTx6cioSCT9U+Hl32kOuNHIPD6XRLI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk0xQzZZQ29zVVVRbXhOZzRpK1ptMXlKUHdweTg3a3g5YW92SmxmWXRPTjVv?=
 =?utf-8?B?STZXMjQ5czhNZDhOTmZ3SVBjL3BObW5Fanc3Qk1HNi9oR0swMnBENUxxdUR3?=
 =?utf-8?B?N0xMQWxHRGI2UEE2aHdETGMxTlRIaDJDR2NheEQxSUFSSi8rKzN6YlNlVGg4?=
 =?utf-8?B?ZWFFUzRtSVp0T3hHUll6RFNIVzFPVFVpMy96MEFhWXFNQVlQTk1wQ0pKK3Nz?=
 =?utf-8?B?SHpVMmwzdDdJSmxPazExZlhCYWlaZGxKWUpTZXhKS0FrZ1pDOWVTUkFIajYx?=
 =?utf-8?B?YTY3RVdJK2k5VGlZOHR4c29pc01pMDZYbWZENE9ZR2xmQ1VWcUsrT1h2K211?=
 =?utf-8?B?VXorWDgrRlVmZTd1d3kvQi82c1ZCNWxpZFM4alljbzg0czBhbG16SndSQW8z?=
 =?utf-8?B?bUZtdlhOQnJnWnZPOHR5SFVYaXZBSU9ncEE5UGs2Wkp3aXkySFNmK1ZCVnkr?=
 =?utf-8?B?UUhrWGRnRUYrU2hhVVpVaHVrazlMVTcveGFERzdYYURVU0dEYWdjNmM5QlFI?=
 =?utf-8?B?OGhhM2NXWENTalljVGtoMmlDMTQ3QUZUZGtzRXY2RkZVaWc1Ri9HeEZNNThH?=
 =?utf-8?B?YnRFTzBNVUF0c0xSVWxJeUJGWVNpVFB3WnJFZnZjVlpFYXlBVzJ1V1RMN0Js?=
 =?utf-8?B?MWJSd29rK2JzTi90cGw5bGw5Q1BPNUFmcUt4UitYT21TRDU5WU9JMDdQSXJ5?=
 =?utf-8?B?UUhsbkpMTGpzelQ2ektNRjU0dEY2amJvTjhHdlYrMzU0S09JUG1KQXdDaHRT?=
 =?utf-8?B?Slk5cTdRMUdiKys1TjZiZFFwbW1ScWRzeFVxZEdabWNYcmFveVdiaG1sZW1I?=
 =?utf-8?B?Vmt2VDdVcFdyT0VjOTRuRnlLWGp3c0NvUHNiWHVya0VTRDNtbXBjaU1tZHNj?=
 =?utf-8?B?L1lvT2RDTVdjbWM5VmdCNU5hVExPeVJQK3d0OUhkZGdYbzZIcHFReVMySWk4?=
 =?utf-8?B?ekxVTDlaMkJQUUViRVhsMU1neEMwK2lRc0o5bXRMblR4bGJqbGF1U2p4aVlG?=
 =?utf-8?B?c2hMQ3prNUgrbm15clJ6UkY5Z2R1dzNiNWZvTTNDb0Nzb2Q4YnpPNHpBSGUw?=
 =?utf-8?B?cXJ0TjJra2thWVVDTG9NUkFSM0E0WmlzRHZFRXRqZU92TVFMSnJFSGJKK3JG?=
 =?utf-8?B?N3Q2TGpxUGVJakNzRjN6ckxGblYwMktmL01BZC8vZUN6TjNUMTd0NG5TR1Bt?=
 =?utf-8?B?ZUU0YlZOdGoyRnRXTnJqc1JwTG13Rmt2cnpGTnpuay8rc1E3ZmJocGZIbHdY?=
 =?utf-8?B?a0pxQkZnby8yTlNOVjVXLzFxVVNVTXlvQjh2cmwzNzRSeElhSlRXTFdReXNr?=
 =?utf-8?B?aUpIT3RhVERCTTFLWk9HWm5FRzF5OXRNYjRpY3FiQUNjNkM1Ylh0SGQ1Qkhi?=
 =?utf-8?B?YkwzVUxZMmRCZnNXRTZVLzBWbG9xOS9uN1V0ZzlEU1dubFRBcklaM2pOQjRq?=
 =?utf-8?B?QTd4OFRiSWM5RUozMHkrY091NEcybUF1alN1UEFiSDZXenc0dU5QZktQYjZE?=
 =?utf-8?B?czZZdEc2dGwzanlDdlR3cy8wQ2hrTUlJeUUzSnNXdklNR0dtaGxWallnaFh6?=
 =?utf-8?B?WWVzQWlMR0F0UW51dGdwQ3NFSGxHUHVWbndUNmVrcjdxbjhKQ0pTTUhZSkNQ?=
 =?utf-8?B?cGlXMk82MjNIWlF4RlRTcktZOEFnK2lxTGx6Z3lUU3lyeC9vQkVMRmR5MDlX?=
 =?utf-8?B?OXJPSUNtOUl6RVFjK3Jra0UyUDBMRHZwRTAvL2E2SHJiV0xoSEtGWjlNVEpp?=
 =?utf-8?B?UTBCd2pvLzdlTG42Njkyb1hBMnF1VXBFVmlUN20raFRzbzBEdURhNHpGeGtT?=
 =?utf-8?B?SmVqZ1R3OXN1Q1QyOGxUUEV3dnJGb29jOHhYTVBPaEZZOFU3VktQWDBFdWN4?=
 =?utf-8?B?MFlrZ1hyYWtJN2hYL1ozVlJWaTY3QTBPa3gvdjBYR1FTdmJzNFV3YzZnVk5C?=
 =?utf-8?B?eGhlZmg0dnJzRlZzOFZIbXJqcW5STEdFK2dYQUtaNW5NZ0pyTmcwTkhPVmU1?=
 =?utf-8?B?YlpZUm9zZ1Nzc2dieHlrU3MycXo1S3Q2VW9ra3NhSmVQeVJEN0U5Z0pDMEM5?=
 =?utf-8?B?UG1ocmgvbjYrTDZLUXZ1MWh0UXdaOEc2WWw3UjZHcE1tczBsSjJGNm1SdU1C?=
 =?utf-8?B?MFI2UGVmVGpXVjdVbE1QZ0V4Tk9GcmpCR0p2OHJ5RE5EdVA0SlovTXVKWHZI?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2717d1-8ee4-47e7-a766-08dd944a36eb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 07:21:02.8749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OT41epcn9qvuKnNNIV0eLQvsTX+0GnP8/6/Cjw/mNektyHsg6LndHGYaGEMepODuu7E+XLxXPcoewjbbfcdIjq3cc20aApzyD3vvTTtQUoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
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

Patchwork <patchwork@emeril.freedesktop.org> wrote on =C5=9Bro [2025-maj-14=
 05:23:53 +0000]:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available =
on the device (rev4)
> URL   : https://patchwork.freedesktop.org/series/146941/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a7429=
7_BAT -> xe-pw-146941v4_BAT
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
>   **WARNING**
>=20
>   Minor unknown changes coming with xe-pw-146941v4_BAT need to be verifie=
d
>   manually.
>  =20
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146941v4_BAT, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
>=20
>  =20
>=20
> Participating hosts (10 -> 9)
> ------------------------------
>=20
>   Missing    (1): bat-adlp-vm=20
>=20
> Possible new issues
> -------------------
>=20
>   Here are the unknown changes that may have been introduced in xe-pw-146=
941v4_BAT:
>=20
> ### IGT changes ###
>=20
> #### Warnings ####
>=20
>   * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
>     - bat-lnl-2:          [ABORT][1] ([Intel XE#4624]) -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9d=
a3d8af23f7067f7f4e5a74297/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-a=
ll-entries.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/bat-lnl-=
2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

<3>[  261.672642] xe 0000:00:02.0: [drm] *ERROR* GT1: Force wake domain 15 =
failed to ack wake (-ETIMEDOUT) reg[0xdf8] =3D 0x0
<4>[  261.672908] ------------[ cut here ]------------
<4>[  261.672911] xe 0000:00:02.0: [drm] GT1: Forcewake domain 0x8000 faile=
d to acknowledge awake request
<4>[  261.672932] WARNING: CPU: 7 PID: 90 at drivers/gpu/drm/xe/xe_force_wa=
ke.c:205 xe_force_wake_get+0x8c7/0x8e0 [xe]
<4>[  261.673019] Modules linked in: snd_hda_codec_hdmi xe drm_gpuvm drm_gp=
usvm drm_ttm_helper ttm gpu_sched drm_suballoc_helper drm_exec drm_buddy dr=
m_display_helper cec rc_core drm_kunit_helpers kunit i2c_algo_bit hid_senso=
r_custom hid_sensor_hub hid_generic intel_ishtp_hid hid intel_uncore_freque=
ncy intel_uncore_frequency_common x86_pkg_temp_thermal cmdlinepart intel_po=
werclamp spi_nor coretemp mtd mei_gsc_proxy intel_rapl_msr kvm_intel wmi_bm=
of overlay kvm irqbypass polyval_clmulni polyval_generic ghash_clmulni_inte=
l sha256_ssse3 sha1_ssse3 aesni_intel crypto_simd snd_hda_intel cryptd snd_=
intel_dspcfg rapl snd_hda_codec intel_cstate snd_hda_core snd_hwdep snd_pcm=
 r8169 snd_timer snd processor_thermal_device_pci spi_intel_pci e1000e proc=
essor_thermal_device soundcore spi_intel realtek processor_thermal_wt_hint =
processor_thermal_rfim idma64 mei_me processor_thermal_rapl intel_rapl_comm=
on ucsi_acpi mei intel_ish_ipc processor_thermal_wt_req typec_ucsi processo=
r_thermal_power_floor thunderbolt intel_ishtp intel_vpu
<4>[  261.673109]  processor_thermal_mbox typec binfmt_misc video int3403_t=
hermal int340x_thermal_zone intel_skl_int3472_tps68470 intel_pmc_core tps68=
470_regulator clk_tps68470 pmt_telemetry wmi nls_iso8859_1 pmt_class intel_=
hid int3400_thermal intel_vsec acpi_thermal_rel sparse_keymap pinctrl_intel=
_platform intel_skl_int3472_discrete intel_skl_int3472_common acpi_tad acpi=
_pad dm_multipath msr nvme_fabrics fuse efi_pstore nfnetlink ip_tables x_ta=
bles autofs4
<4>[  261.673145] CPU: 7 UID: 0 PID: 90 Comm: kworker/u32:1 Tainted: G     =
U              6.15.0-rc6-xe+ #1 PREEMPT(voluntary)=20
<4>[  261.673149] Tainted: [U]=3DUSER
<4>[  261.673151] Hardware name: Intel Corporation Lunar Lake Client Platfo=
rm/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3223.D92.2502282207 02/28/2025
<4>[  261.673153] Workqueue: gsc-ordered-wq gsc_work [xe]
<4>[  261.673223] RIP: 0010:xe_force_wake_get+0x8c7/0x8e0 [xe]
<4>[  261.673285] Code: d2 75 03 48 8b 17 48 89 55 b8 e8 94 d1 32 e1 48 8b =
55 b8 45 89 f9 4d 89 f0 48 89 c6 89 d9 48 c7 c7 00 0f 23 a1 e8 49 02 5b e0 =
<0f> 0b e9 2f fc ff ff e8 5d ad 9c e1 66 66 2e 0f 1f 84 00 00 00 00
<4>[  261.673288] RSP: 0018:ffffc9000043fc38 EFLAGS: 00010246
<4>[  261.673291] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 00000000=
00000000
<4>[  261.673293] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000=
00000000
<4>[  261.673294] RBP: ffffc9000043fd08 R08: 0000000000000000 R09: 00000000=
00000000
<4>[  261.673295] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000=
00000000
<4>[  261.673297] R13: ffff8881512c00e8 R14: ffffffffa1286c59 R15: 00000000=
00008000
<4>[  261.673298] FS:  0000000000000000(0000) GS:ffff8884eb696000(0000) knl=
GS:0000000000000000
<4>[  261.673300] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  261.673302] CR2: 00007211fd695000 CR3: 0000000003448006 CR4: 00000000=
00f72ef0
<4>[  261.673304] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000=
00000000
<4>[  261.673305] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 00000000=
00000400
<4>[  261.673307] PKRU: 55555554
<4>[  261.673308] Call Trace:
<4>[  261.673310]  <TASK>
<4>[  261.673311]  ? mark_held_locks+0x46/0x90
<4>[  261.673321]  ? trace_hardirqs_on+0x1e/0xd0
<4>[  261.673328]  ? xe_pm_runtime_get+0x68/0x140 [xe]
<4>[  261.673416]  gsc_work+0x89/0x1300 [xe]
<4>[  261.673481]  ? lock_acquire+0xc4/0x2f0
<4>[  261.673484]  ? process_one_work+0x1ee/0x6f0
<4>[  261.673501]  process_one_work+0x22b/0x6f0
<4>[  261.673510]  worker_thread+0x1e8/0x3d0
<4>[  261.673514]  ? __pfx_worker_thread+0x10/0x10
<4>[  261.673516]  kthread+0x11c/0x250
<4>[  261.673520]  ? __pfx_kthread+0x10/0x10
<4>[  261.673523]  ret_from_fork+0x44/0x70
<4>[  261.673526]  ? __pfx_kthread+0x10/0x10
<4>[  261.673529]  ret_from_fork_asm+0x1a/0x30
<4>[  261.673540]  </TASK>
<4>[  261.673542] irq event stamp: 7101
<4>[  261.673544] hardirqs last  enabled at (7107): [<ffffffff814a80d9>] __=
up_console_sem+0x79/0xa0
<4>[  261.673547] hardirqs last disabled at (7112): [<ffffffff814a80be>] __=
up_console_sem+0x5e/0xa0
<4>[  261.673550] softirqs last  enabled at (6186): [<ffffffff813d8a6f>] __=
irq_exit_rcu+0x13f/0x160
<4>[  261.673554] softirqs last disabled at (6177): [<ffffffff813d8a6f>] __=
irq_exit_rcu+0x13f/0x160
<4>[  261.673557] ---[ end trace 0000000000000000 ]---
<7>[  262.203195] xe 0000:00:02.0: [drm:intel_power_we



Problem on a platform that does not support SR-IOV and LMTT.

<3>[  261.672642] xe 0000:00:02.0: [drm] *ERROR* GT1: Force wake domain 15 =
failed to ack wake (-ETIMEDOUT) reg[0xdf8] =3D 0x0
Tiemout not related to my series.


Thanks,
Piotr

>=20
>  =20
> Known issues
> ------------
>=20
>   Here are the changes found in xe-pw-146941v4_BAT that come from known i=
ssues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
>   * igt@xe_gt_freq@freq_fixed_idle:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#2464]) +2 other =
tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/bat-adlp=
-vf/igt@xe_gt_freq@freq_fixed_idle.html
>=20
>   * igt@xe_mmap@vram:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][4] ([Intel XE#1008])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/bat-adlp=
-vf/igt@xe_mmap@vram.html
>=20
>   * igt@xe_pat@pat-index-xelp@render:
>     - bat-adlp-vf:        NOTRUN -> [ABORT][5] ([Intel XE#3970]) +1 other=
 test abort
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/bat-adlp=
-vf/igt@xe_pat@pat-index-xelp@render.html
>=20
>   * igt@xe_pm_residency@gt-c6-on-idle:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][6] ([Intel XE#2468])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/bat-adlp=
-vf/igt@xe_pm_residency@gt-c6-on-idle.html
>=20
>   * igt@xe_sriov_flr@flr-vf1-clear:
>     - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#3342])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/bat-adlp=
-vf/igt@xe_sriov_flr@flr-vf1-clear.html
>=20
>  =20
> #### Possible fixes ####
>=20
>   * igt@xe_exec_basic@twice-bindexecqueue-rebind:
>     - bat-adlp-vf:        [ABORT][8] ([Intel XE#3970]) -> [PASS][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3083-dac27c03b365c9d=
a3d8af23f7067f7f4e5a74297/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue=
-rebind.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v4/bat-adlp=
-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
>=20
>  =20
>   [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/10=
08
>   [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
64
>   [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/24=
68
>   [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
42
>   [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/39=
70
>   [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/46=
24
>=20
>=20
> Build changes
> -------------
>=20
>   * Linux: xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297 -> xe-pw-1469=
41v4
>=20
>   IGT_8362: 8362
>   xe-3083-dac27c03b365c9da3d8af23f7067f7f4e5a74297: dac27c03b365c9da3d8af=
23f7067f7f4e5a74297
>   xe-pw-146941v4: 146941v4
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146=
941v4/index.html

--=20
