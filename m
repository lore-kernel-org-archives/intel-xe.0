Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03FC87FDA
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:49:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3600610E032;
	Fri,  8 Aug 2025 17:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IRxnhNuY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A253610E032
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754675369; x=1786211369;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j6Jp/xnkTzwmYwle0nvvqEozl3zDYbP8y8z5nl0h6mo=;
 b=IRxnhNuYqM674xk4lauuIRflXRccF7LaJkj9nW/MaZrdLQRqjfdmAMnf
 qFQMCfneMYyBu+VG6TvbRCXi+oi4H8hfB8UPrOkaUOxTwI5GhyE1Iesiv
 EseNx12RgKIbdAzNiqkeF6i4IUVu0Ay1/W4n3H4eH/lWK9N2Bf9x0GdLB
 iQC1UVXccPKzyJsYKOrv24V3CYGckyiI83Tiakm0YcJxcBj5fRr5xi4pZ
 R4Am7oTKFwo4FTOT096y2yOfehhubNgUyBHU+PTtEgiJSdVENuVQnBJu2
 ZjawHvZRGTNb0hlzNx4kKIvbcOU/LUPT+FRs+DfrVzskXH16y+tFDv0iQ w==;
X-CSE-ConnectionGUID: iOdj3bbKRJ+Y6ong5kknqQ==
X-CSE-MsgGUID: aOTM+CFWRki2RNrDR8r/DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56064321"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="56064321"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:49:28 -0700
X-CSE-ConnectionGUID: 8HxJ0jGcQBy2Srp1fHOSwg==
X-CSE-MsgGUID: TZJoMtWdQCu7xiCDroQhBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="202567942"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:49:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:49:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 10:49:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 10:49:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NsUgVrH9QxOWZwIQ2LveatoQnDvS8SXy5IQray1Y1jdxIbcm9j3si972Fwixy1RouU+8GQTORRu/qmD/Rj885sbqFayauuq7Md8LhLBwfANB3jnN9+eKsbmSV1kRihAo4DvX+5TV4yVNIJ7+brKhRET93aFpMmEhInKN6ESmOxM8lf7tdmezt8EpGuHNYsl768jrmiFmPb+PT+7T4PoDdh8N1iin5zW+WC2vx1+nuV3mp9JfdC51Jxi6IYafAizzDt6N4zep7kNOfRNGQKZv0/jGBE3bA2+/YO+e67VNmCkCBBqps0LKR3KG66xQnyohGe8pK9hjF8NAxKorHb/n8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDZTqNSCOurmnLGv2A0vj16gKI/5v/WTc6AqmS82dPA=;
 b=n/hhKNfvkfZ/fxGN9pUhKp1I3daZfh08l7CwLPHnwBkckO1QGGH4+S+47o1c9i/rUiegVA1Obpz7eRMyVmpqZ5zo8S6DC2nhtq3LagYqTxQbcywX6hDFU2OCuK3T1JvTYT38hHAH57f8g71oYG0pCKVtusUDt/0vL/EwHbjMKCWYdTYOul7Mf+L0OSEydgGcfT4VXhkCAjI2HQ1SqZkSXGIJOABoHUcmwrC87IUzcmddHskTFHBK9KPkBPEja1jHG83imr/DrKvLCaJE9WSrKWVGmlNUqo8jtcwW4IyvjBuXW2041MPq9KjdwHg56ZVwSOVM4sSyfasKLZNPAwzfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 17:49:20 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 17:49:20 +0000
Message-ID: <9a5322f6-5891-4fae-bcd7-21779945204a@intel.com>
Date: Fri, 8 Aug 2025 23:19:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Add SW clamp for power limits writes
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
References: <20250807140602.3247853-1-karthik.poosa@intel.com>
 <625144eb-9b3f-4d93-860f-3b200400bf5f@intel.com>
 <13c29a0e-040e-4212-b51d-33cca1e2746a@intel.com> <aJYDopiZjcosG71i@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <aJYDopiZjcosG71i@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: dadb7666-0ad7-4449-aa07-08ddd6a3e722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHYyYkJwNFdmNGZpaE5PUWcwWXZENVhnK3VSUmR6b0NOUlFmMXJQaDQwQW1a?=
 =?utf-8?B?S3p5K004bnJXSEFHQzBTcC9qWDJTbWRydEwyU0w0QkQyZmJQd0tFMG9maGhz?=
 =?utf-8?B?TUZabldidmFPd3R4b0V0S1RvcHBiSVhrTW9YTmVmbEpvSlJSUldqTGtad2hC?=
 =?utf-8?B?NEpxT2piR0tUZk5NR3N1VTBOaXNqUDRmY3IxWithemZMekd3dHlEU1EzOUsr?=
 =?utf-8?B?Nng3eE1Rbm4rbnEydDRUa0pSY3ZmNFRRc2JtMk50bjFYSU9Fc05sNFVIL1g4?=
 =?utf-8?B?SHpDbCs1N3AwNUZ3VnpESVZjUGxpblF1SU42ZndET2tWMit3d3oyWmlOY1ZM?=
 =?utf-8?B?blRuN3JGbUpIOVZza1c5V011WU5Pb3MyYmtnck8wQXV5bjZHU0c1a3UrT2tq?=
 =?utf-8?B?QlBLbFVvTHhtd0VKU2tTL1JveWJzRVNIR1Z3d0d6UG1SemtRTW1Qb09RT1NV?=
 =?utf-8?B?TDZGUnpEZERKWDRoTjFMOXVtNGJOMStGczVXaStIUm9QaitiQVNUV1gxaXNM?=
 =?utf-8?B?RW1nbkJhMFpoMWgrbm13VjNkdlpid3c1U2twM0xJL2JsV1RXRFBzVWhETHNF?=
 =?utf-8?B?d0I4a3BML1RaZWRXTXBXZkxKQTVOL0xXZW03ci9LQTU5MmlwbzlvMkQyZXJa?=
 =?utf-8?B?Y3pya2JqM3ZGbEdXQ1NLZmFDRDJ2d2g5M2RJOFowVnlaMlNZRmlXaUFoekhH?=
 =?utf-8?B?TmRhSXpocnRZRFdVQmVMLzJHWTcvNHRLM2FLcjYvajVQTEtLNjJUYzZVVlpt?=
 =?utf-8?B?WThaRFoxd2RnTGxXZTcwQ00zN3RGTVovUkFiY1VOc2UwbW43Z3p3MkpFVGJS?=
 =?utf-8?B?Kzg2elpDZ3puRWR5S2I5ZDI3MVM1a3k2Vk4yQjdGSzZvTUREMGpLV0JRSkht?=
 =?utf-8?B?UXF4bHNyUWdNeW1uYWtqSklSVHFxL3hadnZCblZ3VGpyRFFYZEpuc3BIdS9o?=
 =?utf-8?B?YXJJbEZaSWxpWC9lY1lKNXZlZHRWOGFXVFFpMWlVL1l3YkFCL1dnd3pEV1Z5?=
 =?utf-8?B?WC9FNkdZcGxQMUEwcyt0Sk1pa0RzaENsN0ZPZ1d6aEp0V0RIc0dVQ0VZblZp?=
 =?utf-8?B?WE9kWEpySDRVQ21qdFNyaEhhV1BuK3Jlc092a2g1M2s2VGRCSkRBVnpERTZQ?=
 =?utf-8?B?N00zSUlpR2JEOE9JR2VjR0FkNGVvOEtuMnpqdFRFRFk0U0JoeU13bG54RDN1?=
 =?utf-8?B?VCtuVXg1bjFCdTVQOG8xYmZadnUwQzlLV2pkUVl4YWZJeDNWbVB3d0t6MFVY?=
 =?utf-8?B?U0hxMUJ5Zmo5M1hJL0FNSFVtY24zbW84U3RNNFZKOXJ6QXhGbE81MTVjUGdT?=
 =?utf-8?B?QjVzQ2tLNGJIZGVYSmNsajVTc2hJbHB0WEd3azRDQXpiYi9ONmFwbWdPWEVn?=
 =?utf-8?B?cWlRTk1ZWUlaaHlnMkpsYkVGUnVsaDdBbU5QZU5mR1ZjSlNZS1IrU0NBbXlW?=
 =?utf-8?B?RlRIOFgwdDV2WWMwdnVuYkIxZGZqd2ZPaWJrc0RYQTF3R1A3ejMrb29JWFpa?=
 =?utf-8?B?dWxvVzRvelhTK2h5enYvOWwyWVFOdDhnOGZVUThOOFNxd0V3bU9BQW5QKytD?=
 =?utf-8?B?ZkpZc3dZRlNRUkpkL1FOOHN6TG4vWFJHNzdJUGUzcFhrdXZaSnVFY2NGU2U2?=
 =?utf-8?B?cWh2Q01iRjhVUG8rZzRtUkRaOWcxVXBtNUNRTGwvOEZLRmhJTmJhdlRmWCtn?=
 =?utf-8?B?OVh1WXhBVlJJRDRibDRlYm5hTVUyeTV1WWtCU2hyVEZlbGoxdnUxeXpQdVNW?=
 =?utf-8?B?SVVyNUhuaXZialJ4eUlPRWF6bFZmejdjdEgxZldkRHRwczFGNU5raktKdWRG?=
 =?utf-8?B?MVNVTi83bEZVT2pEKzlhVXdyS3R0QjRab0t6OEdzaDlCZVBPWVh0OHdDNVlr?=
 =?utf-8?B?RFBZTmNWUmRqbGw0VG85Y2lZTGN2M2tsWU5PbCtvVEcxaVgwQmJPNlNNZW9k?=
 =?utf-8?Q?kT6fuVj4Vt8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW51Q2sxUE9GVTJNbFdHSDg4dDUrZVZRMUNVVmJ5UThCelEzVlNLalpoc0lO?=
 =?utf-8?B?OU9ZdU0rcFZudndsZ282dXZoTko3OG1vUUM2VE9rZUNGd3oxN3RCMTN4UDZp?=
 =?utf-8?B?cGhTcm5lMFpRZGIyd0JUN0NNVjlRSXdEWFVzM2FSZnV5d0ordWJFM2R2aWNH?=
 =?utf-8?B?M2lYTVoyVmRvQkxPRGxJbm1wUnF5VnZpSFQ4bENpT1FDOUtPN1Q5U1ZYRDFE?=
 =?utf-8?B?Yk0wSEpTR1lUTGdaaHh1U0VsUldFWXlua0djT0NvSEZtS0N6ZE1ianptbkN6?=
 =?utf-8?B?OEx1UjNSVk8wMGtNMkZRWnNjOFl3eGtteGFoZlpWSjlPN01NTDJFeTZEeGc5?=
 =?utf-8?B?b3Vjc25PeUx0eDQwTkpZdHFMeVhDOXBNZHRMT2hiMWY2QXFvcUREdzkvRU0r?=
 =?utf-8?B?dEtBSm45OW1iRkU5VnNjSUl6K1RkNGlvRmx4M1dIV2NLYUV1ZkZqZzU2TU1H?=
 =?utf-8?B?elZ1RUl4K2RmZ29aNFMrSWppbWo1TzVUWVRPLzluaDZDaE5PejhXR3RZRFRV?=
 =?utf-8?B?QnF1MVROelliUUVZeDFtTGFicUR4Y2RZZ296aEFIcEh1SjdqZWlIeU9WVXd0?=
 =?utf-8?B?c0dkRElScGNwUDdtd05zRzZra2pMWS9hNjFITlQ1VE5mNExRM05KUzNKY2tr?=
 =?utf-8?B?dHlGQ1NEV2xMaHRvZGFGemRRUlQvSzMzSnFyZHlETC96ZlZ4Y3RrdGhGSUQ2?=
 =?utf-8?B?RlIyT0tvVDUxZ21SaFZzMmMxSTBWSFBYUktpSG5BeEVmSmNBaDhPNStLcDcy?=
 =?utf-8?B?Y0Z4MUpleUJ6Y3cvNU5vdVFuMWxFYzh0d2pIL3hsMkpLeE5JQnYyRkNOQStB?=
 =?utf-8?B?U21SR1FzU3h4bUFwbEE2MzhJeXZsRVNpWnlNZ2w1TGVTNFphWmlQZFF6NENC?=
 =?utf-8?B?ZFBqeUxHVW80TTdoQ1RMZmVsNm1pTjd1QjVhNmJSY0k2bGxxSjRWQzFVZkpx?=
 =?utf-8?B?N0dJZmZEWFRtUzNFY2RYS0doWkNmOElhcnR2Tyt1a1NkQitSSGIyVlBwTHVO?=
 =?utf-8?B?dnl2OWs5cnJsYWhHTWpyWG8rVWNJcVRYb2VDbW9HeE5JTXdKMmtHZ2ZLNmtQ?=
 =?utf-8?B?RTZnSDRlaS96Qzd0NE9QNkNNR1l2dVNUNWpHRzhzOGE2bXlqQnZGTzNLU292?=
 =?utf-8?B?bllsQW1mNnE1QUNNeFBLQi9VTDBHK2pFaVp3M2loSWsrNFV2Z25iL2l4c2J4?=
 =?utf-8?B?ZjU4cFZDK2szMytqYUc0U29lelhUc3N4MXRza2hnT0tadkl6ZnpvaXM1cW9W?=
 =?utf-8?B?SmtwaXVsS3NuRGQya1pYUFVSTHl5SjNuUUxKaDVwTUQxUWFBVGJ0Y1BGWDIv?=
 =?utf-8?B?d2lwN0JFL0M2M2I3R3RQVzQxMHpzUVRVbXBqRVRITFZSUFExR3N0ZmZncXhW?=
 =?utf-8?B?M1lXUURDc29NWUFEU1ZielpBRllOVTJiZVh2SVRxZW5zdG1lVUNMbDNWQVM2?=
 =?utf-8?B?Q1ovRk1TMnI3dXBaTFRNS1V3WjFPL053aXEvam5lZTVQN3Y1L2FPUUdEUjFC?=
 =?utf-8?B?T0ZNREIxZEdQQkpVTG9VVGtDMGF5ejRYd0kwSFRUaGxCa1o0SlFLWXNpVlM4?=
 =?utf-8?B?ZU9uRk9DUXBiaXJhTXFHYXVLZk5XV0sxa2NRVmJuZzliNDVBeWlDamRmRFdU?=
 =?utf-8?B?ZXBJSUlsNTV5Rm9WSGlnYkJIUzdWbzNlTjF6eFRkNHdQVU5XUUZMWUE5aHZE?=
 =?utf-8?B?dmJWOHhieVB3d0R2dHB5UWpkRmFUYS85cGdpbkl6NzlsR2pJQ3F5T1U0bEZX?=
 =?utf-8?B?ODI4WmRNYzhoT1pFTlZGbTBZYVd5bFkwNTNtc1NRd2xYa2tpSTVhVkhVQ2Fy?=
 =?utf-8?B?ZSt2VjlKZWpBRVNZRW8vOGtoR3VsbitLWVJSRkt0aHZFdkVJL21CRFBtOGJO?=
 =?utf-8?B?VWsyUCtEMElGZnNtckIvUHBXUHlwRGlsbVVsOTNHRFB2ZVFhaWV4R2xoRXh4?=
 =?utf-8?B?OVB1ZUR3aVREMjRiODdITTBrRHhIWTZ5NEVLd0lMSUtHSGJxM3BLUXVpK1gx?=
 =?utf-8?B?aHQvYktxbjh5RmgwendXaGhUR2VjeldabmFOVzRXa2xvV1FpOFg4VlpKUk9w?=
 =?utf-8?B?VFlXcDFCVDRtVi9KWVltSnRNY3R6eE1QSUw3WVRMUDBqMDFRMU1mSlRKUE5j?=
 =?utf-8?B?MFV5Q2lzSnc3NDQxQmhSNDhwU0lPUnZWODc1S3FQbS9uVndDZVNhUURNcDhm?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dadb7666-0ad7-4449-aa07-08ddd6a3e722
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 17:49:20.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jLP42Y5ZVlB9o59tl4i6CtJuuO5J7giuxOorjjjfcySTsxXb8mULzXsZyVrqY/F0ZoIZLqkD54H9dMMk9R26hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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


On 08-08-2025 19:33, Rodrigo Vivi wrote:
> On Fri, Aug 08, 2025 at 05:15:29PM +0530, Poosa, Karthik wrote:
>> On 08-08-2025 11:07, Riana Tauro wrote:
>>> Hi Karthik
>>>
>>> On 8/7/2025 7:36 PM, Karthik Poosa wrote:
>>>> Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
>>>> powerX_max, to the maximum supported by the pcode mailbox
>>>> when sysfs-provided values exceed this limit.
>>>> Although the pcode already performs clamping, values beyond the pcode
>>>> mailbox's supported range get truncated, leading to incorrect
>>>> critical power settings.
>>>> This patch ensures proper clamping to prevent such truncation.
>>>>
>>>> v2:
>>>>    - Address below review comments. (Riana)
>>>>    - Split comments into multiple sentences.
>>>>    - Use local variables for readability.
>>>>    - Add a debug log.
>>>>    - Use u64 instead of unsigned long.
>>>>
>>>> v3:
>>>>    - Change drm_dbg logs to drm_info. (Badal)
>>>>
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical
>>>> power")
>>>> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
>>>>    1 file changed, 29 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> index f08fc4377d25..a43bc8b91fea 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct
>>>> xe_hwmon *hwmon, u32 attr, int channe
>>>>        int ret = 0;
>>>>        u32 reg_val, max;
>>>>        struct xe_reg rapl_limit;
>>>> +    u64 max_mbx_power_limit = 0;
>>>>          mutex_lock(&hwmon->hwmon_lock);
>>>>    @@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct
>>>> xe_hwmon *hwmon, u32 attr, int channe
>>>>            goto unlock;
>>>>        }
>>>>    +    /*
>>>> +     * If the sysfs value exceeds the pcode mailbox cmd
>>>> WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
>>>> +     * max supported value, clamp it to the command's max (U12.3
>>>> format).
>>>> +     * This is to avoid truncation during reg_val calculation below
>>>> and ensure the valid
>>>> +     * power limit is sent for pcode which would clamp it to
>>>> card-supported value.
>>>> +     */
>>>> +    max_mbx_power_limit = ((PWR_LIM_VAL) >> hwmon->scl_shift_power)
>>>> * SF_POWER;
>>>> +    if (value > max_mbx_power_limit) {
>>>> +        value = max_mbx_power_limit;
>>>> +        drm_info(&hwmon->xe->drm,
>>>> +             "Sysfs value for ch %d %s exceeds limit; clamped to
>>>> supported maximum\n",
>>>> +             channel, PWR_ATTR_TO_STR(attr));
>>> Why semicolon here?
>> Used it as I've joined two statements here. This should be okay.
>>
>>> Expand ch to channel. Unnecessary to mention "Sysfs"
>> Line was length exceeding 100 chars, so kept is as ch.
> What about
> "Power limit clamped as selected %s exceeds channel %d limit.
>
> ?

this looks fine,

but in xe_hwmon_power_curr_crit_write, %s wont be needed as shown below, 
as PL1/PL2 is not valid there.

+ drm_info(&hwmon->xe->drm, + "Power limit clamped as selected exceeds 
channel %d limit\n", + channel);

Also as function name will be there in the log, we can know that it is 
for critical power.

xe 0000:03:00.0: [drm:xe_hwmon_power_curr_crit_write [xe]] Power limit 
clamped as selected exceeds channel 0 limit

>> Sysfs is a comestic change, I shall take care of it during merge.
> We do have some exceptions, but we should always do our best to avoid changing
> while merging. Taking the patch directly from CI ensure that we won't
> accidentally introduce build issues (yes, has happened in the past) and also
> will preserve best the history.
>
> Thanks,
> Rodrigo.
Okay, I shall raise a new patch revision.
>
>>> With the above changes
>>> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
>>>
>>>> +    }
>>>> +
>>>>        /* Computation in 64-bits to avoid overflow. Round to nearest. */
>>>>        reg_val = DIV_ROUND_CLOSEST_ULL((u64)value <<
>>>> hwmon->scl_shift_power, SF_POWER);
>>>>    @@ -739,9 +754,23 @@ static int
>>>> xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>>>>    {
>>>>        int ret;
>>>>        u32 uval;
>>>> +    u64 max_crit_power_curr = 0;
>>>>          mutex_lock(&hwmon->hwmon_lock);
>>>>    +    /*
>>>> +     * If the sysfs value exceeds the pcode mailbox cmd
>>>> POWER_SETUP_SUBCOMMAND_WRITE_I1
>>>> +     * max supported value, clamp it to the command's max (U10.6
>>>> format).
>>>> +     * This is to avoid truncation during uval calculation below
>>>> and ensure the valid power
>>>> +     * limit is sent for pcode which would clamp it to
>>>> card-supported value.
>>>> +     */
>>>> +    max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >>
>>>> POWER_SETUP_I1_SHIFT) * scale_factor;
>>>> +    if (value > max_crit_power_curr) {
>>>> +        value = max_crit_power_curr;
>>>> +        drm_info(&hwmon->xe->drm,
>>>> +             "Sysfs value for ch %d exceeds limit; clamped to
>>>> supported maximum\n",
>>>> +             channel);
>>>> +    }
>>>>        uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT,
>>>> scale_factor);
>>>>        ret = xe_hwmon_pcode_write_i1(hwmon, uval);
