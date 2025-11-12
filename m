Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDF2CD4849
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 21:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3B410E7AB;
	Wed, 12 Nov 2025 21:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bm2D23bt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336FA10E7AB
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762982204; x=1794518204;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=WfgRO5bDoE7kFJEyUPwJDOJzAdW1veIl8DeLZKzNhYk=;
 b=Bm2D23btjrhT9zGqaxQPShq9AwqS/huhymZMmWoV/AVngbloPnRkw05k
 R8k2ONIqLVmbhc0NFmafe6oK/fpDfkeyz1cWxbrYFnnvzalCeGPSYr6t8
 jJk9CExZ5e13xMyJjpK/dI3ihF+xkGmS5ZKFTu10cWCWYulcrGoM0GTuQ
 8ALo83VUOJraE5KRpCUSau5tR7RYzkwTaIGZeH2DNOE3UlwTxe72wuAyU
 raITa/JsOlI5dHHRrixTm7w67pYnBKyhXnhshLrgq8sFsNCmNiVUH8BYw
 kHdSZJ5DdM5FujMdeThaYXXcF54GBR+qTZUjlnIiCaqBbWA87oUD+pVrs Q==;
X-CSE-ConnectionGUID: PK9OJcfyR3a94JPkJPpp+w==
X-CSE-MsgGUID: 1KXeVR0wT4eAOpRRx2KjIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="76404076"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="76404076"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 13:16:41 -0800
X-CSE-ConnectionGUID: 5nG0u37gQQSu+xCJKK+RPw==
X-CSE-MsgGUID: L4tlQZsCSMCFbqhTwu2wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="193717488"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 13:16:41 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 13:16:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 13:16:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 13:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMEqVPOAV/of882dlMKbOwvkkQ8ADbEofN8RC8kOztZampqLRT/sxM6oLQma8G6ltp2GKitA/GNjecnFJ65JYw3oEgDXMtoMQmh96iuDqCjJ4BDYrfKugmNZ/eWt4DxISC+FdoK/mlDIZMb7sUap1hfESTOv7O2oDVRz+Y4ON/i1Wt4lbZl4aJIA7zaQwLp1EyAlDr/pGwxci6pYvmokXmdv3H7QejHOrtkaDtcFCAZ1EiuSJtS0KQ258v7boSxKd4qzfHbsn5ZadHlIsqzv9QyixQ8F6wfphFoEUywx67mwntV4OlrY3XoPrvSvOfmkxx0aaNlG2kxtT4Y56V8I6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLWtPZKLIkYCAr+i1uHgsOak42yhJjfLbxMKuP3XRNU=;
 b=oLC9w8g/vB2Ux8MZCIO1hAm3stJ4t/A7V4rdfvqUe6g7jjKXWBc4kwbbCBCmebX9TUsiBrhwzz3SddK/8YyRBfMCDE1flOiwMU84NxjAbKjKNNffYhEfQLyDe0xQ+YriK/8hYVJZjt0mdEEFFwgHcASnrk9nf+MZDVmAHErpF0SqHUZcx3pg77jrPbcbdWP9Cf8TDQOEtaarxNRB+9cSOC1uV2CTnP6y6tfvfD5kdyvD/gZGazNXP0WOdrA3wM/EZ9+fkS+Q0RaiYP9K1fjNHTZ6jYfDqjHtfdABx5Xy3er161Nm8AZ43vmDmwtCw+MVH3MUF9qSdXxVd3+90smhRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by PH7PR11MB7098.namprd11.prod.outlook.com (2603:10b6:510:20d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Wed, 12 Nov
 2025 21:16:37 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 21:16:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176297761536.3698.16687933098897289557@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-36-matthew.d.roper@intel.com>
 <176297761536.3698.16687933098897289557@intel.com>
Subject: Re: [PATCH v2 04/30] drm/xe/forcewake: Add scope-based cleanup for
 forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 12 Nov 2025 18:16:23 -0300
Message-ID: <176298218335.3698.11511282540488387916@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|PH7PR11MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c774e1-0047-419f-4051-08de2230c3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RElhMzkrbVErKzhpR1FrMkJtMGw2WS9xSGRIaTFjb0I4SVNIeHdPbkpnT0tD?=
 =?utf-8?B?Y1lMZjVxM1UyRy85Rno0UXhiYjQ2SW9ydkxSejl3K2k3MFU0TnpMTzNLZGJk?=
 =?utf-8?B?R1dmbEo2V0w2aHdKRitEVXY2dXdxckVWV1FXYlJ3TDlZYWJmQXNPNkNYRWcz?=
 =?utf-8?B?UFRCeHRBdXRYUXlHMU53Vk5ERXBUc0FRMGRGalZUVTdYK2pFT3hyWXFpbWFB?=
 =?utf-8?B?SVdEVWxma2hxODFzYkh1OFNVcngxUVJxM3JFa1drRC9LS01DVU5DbnRZbmxS?=
 =?utf-8?B?WWxaVEhLdng4bGJGelJHbGZqODRhUEZiTTdaTHNROC9GZmZwZTVLZ296eDg3?=
 =?utf-8?B?UkY0VXRzT0ZvcEl6b1A2Wkh2aktQcDhuNWxuV1NudTV5YWMwSFJzYlVnblVw?=
 =?utf-8?B?ekVNWCt0OGF2T1hmZnZSRng1T3l6UkIxUW1JSFlsT3UvOXg0UWN2OXpoZ3NQ?=
 =?utf-8?B?QjB0cGpkRzUwOXBvWXZNeXZnM2NyOGlQZC9iVVZpWC9KckZpZHpkSGpzNEkr?=
 =?utf-8?B?a1pWNUtueDUvM1VWblp1OFQvcWdCTUQ2S1gzQTJQSkU4TzdZTDJvUExkK0pZ?=
 =?utf-8?B?eSt0eUtTNE1CQ0VIMTJ5OHJmVFVHK3VmNGFnL2VCbExqb3ZaUUUySmd4clVi?=
 =?utf-8?B?YmV2VmdaWGVuaTlEUUhMN005d245ODAyR1lNejRTYWxhRFVjK1N1Zlp6VnAx?=
 =?utf-8?B?NytXcFQxaGdyeGc4ZTlEYmpOVGljTE1mZ1VpdjQxVUQrVXdMSXVUUDJGQWxR?=
 =?utf-8?B?Smc5VnBRRUU3NGI0YWlpaW9nTGFadHkwQ1VYN2lESzNva2J4Z0QrbFY1c2Z3?=
 =?utf-8?B?dUYrdWM1TVpZbDVFSnZ2Y3d1SEtUbkNQajZtTnJzME90WGViWWhXbXdHNFVh?=
 =?utf-8?B?ZmQ2K3NjR2U2aG1IbGdhMzhnblFIOU5tRVRoUnArdWZkWStocm0zZmtodGpX?=
 =?utf-8?B?YkFXb2dqL1dIMVNTS1dzY2QxWkpURDFTNGd4NTAybzJ1VWRVWDZ4L2VmK3Vn?=
 =?utf-8?B?cFlGK3kxZUhUaGpFTTBuSnRJOHBvbzhLSkcyTjNzdlpYZnJwUnUydG9Zb0NQ?=
 =?utf-8?B?VjBZbktOWkx1b25HYTNraVNUYWVvb3pQbSszaWJ4QndBOXZ3VWNuQkM5Skxk?=
 =?utf-8?B?REk0cXpqbUtzUW4wYUE2RWxWVDYrVVpodk5Pd2J6Nm9PbCtwRTdBbTRRL3VC?=
 =?utf-8?B?Tk1Wa0NqSVRvYSs1SjlTQ05pc1p5NkluU1YvUW1lcGo3ZEhOYy9LYVpOV2VQ?=
 =?utf-8?B?TFhLblZXeXNhNlFXZHJDQjViNXY5WnE4NWErYW1RR0hIVG1MR3N4ZjBzeFZs?=
 =?utf-8?B?UmpmNys3U3ZTa0hFYWZZRDdhMDVsZ2RUbnhpc1ZjZzFJc3MzSHdqaWV1dktu?=
 =?utf-8?B?KzBZK3o0Z0sxRkgveVFIdUpJemRWbzNFOFB5dnFWM1hvZ2pqUmMxMmExdXEx?=
 =?utf-8?B?SW1lUHh4OXliTFR0WGYzMWI3ZEZZaWs3MVYvUzIwcC8xT09mMWVVQUhORkJ4?=
 =?utf-8?B?VVNzVXJJc0hpdUZsWXMwOVJEV0w1ZmJvUmdRQzhPbk9yTC8zdi90aXBJQTlq?=
 =?utf-8?B?dFFic1JEUnB2Vzd2S0dzdFpaeUtvZWxBQWVFQXh5aVZUOXZCSEVyd3dQRm5o?=
 =?utf-8?B?REtLSU1MdHpTR3hBSlNTcXJITFhvaU95czB2MzVnVVJINWpaU2RYV3Z4b2gv?=
 =?utf-8?B?d3IxM0Z5MzRsODNEM1k3UmlpN2dIVlppVFBRdTV5aDNrQXVrK0lEcEZVWi9U?=
 =?utf-8?B?elF5NVhnK1NUbzAvL25lY0lFSGVFbkJGQVZUYlVyK01VSnJ0cGloVkJxb2Nv?=
 =?utf-8?B?UHBUVnJIM0RNWlRERDUxaWwxSDlmdDJYWS9hdlgvY1RtMGxoN2hZbGFiV0RU?=
 =?utf-8?B?ZFpxaUUzSDFUSHliWEM5eDlFdWdNRm1ScXdaVGJKNk9rNDdhZTZ1Q1o0YTR3?=
 =?utf-8?Q?hi0Yz9X3zG3mUl/n5l2jAMkgE81bbtZe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVVXeU1INGJNL1JxcVAyOTBCcm0xUVQzLzFPK1BHTnlXQUo0VGZQM1o5WE9t?=
 =?utf-8?B?QUU3azI0V2ZXOGNlNUZDK2E1eEZwRzRrakRyYkhYcGt2TzNtRU5laW84S3Rl?=
 =?utf-8?B?WWlJOHFibUMrcFpRb1U0ZUJXRk9jRHpMbW1UcWVWNklzR0NDRlhSOGo3VVJW?=
 =?utf-8?B?ejh3VkNzcFpXZVVGNTlOUjRDSVoxRFpMWUxETFlHcm5pUjZSZTNvZGJlN1JP?=
 =?utf-8?B?MW90OTYwT2x4WnhOSjZSOFZLUUhsZzZRdk1iWnUzaUN5QUJtOVRmWDRnOSs2?=
 =?utf-8?B?Ti9UZkxpK1ZpUGpXcnAzcE41aU1Bc3BSYllrYUFwSjBCYTF2Skk1ckRDaUFq?=
 =?utf-8?B?NHEzdlFYRVlwTHFXZ0t6YmhCdkhlbjc2Z1Iwa21tNmRLdHFIZHpDWmVzdFBn?=
 =?utf-8?B?dnhDWUZIczg0L2Q4YVBEd3FqLzF0OTc0cE9JZ3NldlBwVEVoMnl3UVZwV05j?=
 =?utf-8?B?VHRJOVI5U1VzUmQvbEdXTkVDN2t2M3dTNzZWZ1NmNit2YURXMXBERW5SL3k2?=
 =?utf-8?B?WHZwa2dXbUU0c3NndDMxeVBUN1k3YUNCSnRudnYzeXdRWG1NVWVhV29vajhZ?=
 =?utf-8?B?Q3N0QUpJM2d3U3J6YUxnVzk5N2k1QjZMTTFyR1lpQVNyQUhzMDlpNjRpemR0?=
 =?utf-8?B?ZmdBQlJKckdhQlpKbmM2cHpOb2duWVJlejJtVDI3SEF3SHJlc1EvaS9KdjB3?=
 =?utf-8?B?Z01VaGNHbEFiS0s2UU9aSysxb21sY3Z5UjJVVjNwOXdrMmZtclJGVE5EM29Y?=
 =?utf-8?B?cDJIRHBZZnpZYitOL1VJU2l4R0hKbXdpYkl0bUU3M2NQRkV2VWZ4aGo2YUhU?=
 =?utf-8?B?cDNTc0l6NFRRdzVLb1hqNkZVVldkUGZQSVNSSzh6Y2M1SWZLcS84ejZyUTJP?=
 =?utf-8?B?NUpXSDVnTVkvZU5DZ2JwS0JWVGJkM1psSk5NQ2kwK21tU2k0ek96eW1CUUVq?=
 =?utf-8?B?WjEvVENCMEdrNG5aVy9oOTYzK1JZdW01enhwcGRKYndua2pTalhHR0lpK0tz?=
 =?utf-8?B?UDlPNlZJdEhkb1BWSVZ5N0NFTmtZQytpVXpNWnRWVjdsdVRidUh3cEI2a1lP?=
 =?utf-8?B?d0RxK2ZKTGt3aEI2ZjN3ZUhOSWY5Ti9Sd1BNSi83VzJRN1h3QStmaWVCZVBD?=
 =?utf-8?B?ZEJnbDREZTBWN253eG51U2plWmtGQmZDVE51ZnJ1am1sZnk4WngwQmVvdldk?=
 =?utf-8?B?UDJtdFRLeVRzVnhrUmhMM2c5c2lmSlNuTWNqcDM2eHBMeWhyWUFqWUtzZUVj?=
 =?utf-8?B?amc4RmJoSzVEYkN5cDVUYmRvWXNUZ2t4V0lkM3hDbWY5aVdJdmU5a0hwTWdJ?=
 =?utf-8?B?N0diTTJ3NjdySFJXZGdwN0VTMUJ2UUgyT2xaMld5SGJKRDVxRnhSSEprc05x?=
 =?utf-8?B?QXdtNTU0RW96UXdNbkhhQmhpT1VQLzFKWVZ1VWNGZk1Idkw2SWJOU0dVdjUv?=
 =?utf-8?B?MFpHT1Q2WUdGcmxOREc1NWZsM05XWGF5dTdFemVqMk5NalBBWTJrVU9laGNN?=
 =?utf-8?B?U3pRQWF4eFdFS2pQOTF3cXRsTHRvcG15bXlpakRqcktNTEtYUER3VklEUVEz?=
 =?utf-8?B?MG41MGxBSUR2Mml4a2EzemdhTG56SW1QMURZcm41ZmRiQ0M1ZGJBYzJEcjQz?=
 =?utf-8?B?aFBrQ05Hd0kycnhnUTJVSVZJT0k4eW5Cczh2dkpoeC9vSmVERkkvTnNycDcr?=
 =?utf-8?B?bkxRMjBNNnVWVkZVZGpvRkVNcUtmK2xCYzZIeENZYzJKUlE1Z09BZHBUdVM4?=
 =?utf-8?B?azRNdnE1RVJIU3MwaHJiNWliOE1ENDZzTkRVdjdjRGpRcEVFNWpxY2VSVlNp?=
 =?utf-8?B?aCs0am81bXozWStrajBkQTlKQVQ4Q2RtMlNLWXVjQTMvRXBueW1jZXNzSHJW?=
 =?utf-8?B?akYyaU5CSGNqZUVmNVVRNjBodXIrYUxINkV0bVAzQVovZ1FBUnArdzRoVm9Y?=
 =?utf-8?B?dDNYeUxDWlpsTzBwNDFla1BZR0xUcEFLTkJnT0h1YVNzRkdhbzZDVDRsdTVQ?=
 =?utf-8?B?anN6a0dGdlFVMUtnQTFEOFJQcVNqVS9UcC9wbjMwMzZERENBTnVrS0cxWm1G?=
 =?utf-8?B?bUtkWEpEbVB5Qzh1Q20wWitvV2Frc3BRMUZHS2NZK0NmZUVDUElBSU9qcStN?=
 =?utf-8?B?TlQyeHJLVjVFaDE3T1kycmwrUDBxUGx1elI3UlNuSTdDTWlGMGpGZlVPMGJZ?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c774e1-0047-419f-4051-08de2230c3f4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 21:16:37.7106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPJ8iLkoLz+rFNzANfGxGGgbXvzr6XhlXzbayZEiTvPXOiWf2r64TXQQDELjf67PP6fbVoF14Sc4MlzH5CNhSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7098
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

Quoting Gustavo Sousa (2025-11-12 17:00:15-03:00)
>Quoting Matt Roper (2025-11-10 20:20:22-03:00)
>>Since forcewake uses a reference counting get/put model, there are many
>>places where we need to be careful to drop the forcewake reference when
>>bailing out of a function early on an error path.  Add scope-based
>>cleanup options that can be used in place of explicit get/put to help
>>prevent mistakes in this area.
>>
>>Examples:
>>
>>   CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>>
>>       Obtain forcewake on the XE_FW_GT domain and hold it until the
>>       end of the current block.  The wakeref will be dropped
>>       automatically when the current scope is exited by any means
>>       (return, break, reaching the end of the block, etc.).
>
>Looking further down in the patches, I see that fw_ref is only being
>used to check for success.  I wish there was a way for us to do
>something like:
>
>    if (xe_force_wake_require(gt_to_fw(gt), XE_FW_GT))
>        return; /* ... or whatever that handles the force wake error. */
>
>, but I can't think of a way define such a macro, since we need a
>variable in the scope where xe_force_wake_require() would be called for
>the cleanup to work properly.
>
>>
>>   xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {
>
>In display code, we usually have with_intel_something().  I wonder if we
>should follow suit and use with_xe_force_wake().
>
>>        ...
>>   }
>>
>>       Hold all forcewake domains for the following block.  As with the
>>       CLASS usage, forcewake will be dropped automatically when the
>>       block is exited by any means.
>>
>>Use of these cleanup helpers should allow us to remove some ugly
>>goto-based error handling and help avoid mistakes in functions with lots
>>of early error exits.
>>
>>v2:
>> - Create a separate constructor that just wraps xe_force_wake_get for
>>   use in the class.  This eliminates the need to update the signature
>>   of xe_force_wake_get().  (Michal)
>>
>>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_force_wake.h | 28 ++++++++++++++++++++++++++++
>> 1 file changed, 28 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_f=
orce_wake.h
>>index 0e3e84bfa51c..0204503b53a0 100644
>>--- a/drivers/gpu/drm/xe/xe_force_wake.h
>>+++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>@@ -61,4 +61,32 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum=
 xe_force_wake_domains dom
>>         return fw_ref & domain;
>> }
>>=20
>>+struct xe_force_wake_ref {
>>+        struct xe_force_wake *fw;
>>+        unsigned int domains;
>>+};
>>+
>>+static struct xe_force_wake_ref
>>+xe_force_wake_constructor(struct xe_force_wake *fw, unsigned int domains=
)
>>+{
>>+        struct xe_force_wake_ref fw_ref =3D { .fw =3D fw };
>>+
>>+        fw_ref.domains =3D xe_force_wake_get(fw, domains);
>>+
>>+        return fw_ref;
>>+}
>>+
>>+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
>>+             xe_force_wake_put(_T.fw, _T.domains),
>>+             xe_force_wake_constructor(fw, domains),
>>+             struct xe_force_wake *fw, unsigned int domains);

Another thing: I think it would be nice to have a note in
xe_force_wake_get()'s documentation about using CLASS(xe_force_wake,
ref)(fw, domains) and xe_with_force_wake() when it makes sense.

--
Gustavo Sousa

>>+
>>+/*
>>+ * Scoped helper for the forcewake class, using the same trick as scoped=
_guard()
>>+ * to bind the lifetime to the next statement/block.
>>+ */
>>+#define xe_with_force_wake(ref, fw, domains) \
>>+        for (CLASS(xe_force_wake, ref)(fw, domains), *done =3D NULL; \
>>+             !done; done =3D (void *)1)
>
>I think it would be good to use __UNIQUE_ID() for "done" here, to avoid
>shadowing any existing variable from the outer scope.  We could do it
>with something like:
>
>        #define xe_with_force_wake(ref, fw, domains, done) \
>                for (CLASS(xe_force_wake, ref)(fw, domains), *done =3D NUL=
L; \
>                     !done; done =3D (void *)1)
>
>        #define xe_with_force_wake(ref, fw, domains) \
>                __xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
>
>--
>Gustavo Sousa
>
>>+
>> #endif
>>--=20
>>2.51.1
>>
