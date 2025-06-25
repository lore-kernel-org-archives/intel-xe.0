Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF08C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5930810E232;
	Wed, 25 Jun 2025 15:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fvZ88ZPX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0567110E232
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750863904; x=1782399904;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JQRJ5RKio9FzlkQ7IpoErKcgwmNBNTuflHOi9hxGymc=;
 b=fvZ88ZPX9O/WiJVPYj4qzklE2x+cFSX1teo6BZaWcR5yVLu0gkr0lFJl
 DQRdT6jPzFLNRIT9Wj6oNJUs5DhizaXFk+VmT2WmEb2p2QPDVtsZU4tDd
 qtu3mvSkWxhOLhtBH+O4wb/tmyHnnx39UKPuma0fgAU6kvdEX5M52um5o
 Pbh+x5qN7LkbidEFUIIXsBFdml4SqvD6E81VvdG77BcHfqchjAopecO5H
 gXL0Imh7DC1LroyZUb/7EypTRoGkYZvSQdwftiDrEqJrZ2njSvmSNFQQ0
 IiPKj+Clb4O+BYq6IxasMdqBkMTdxUn0Nj4YfnXOBWLXgD3qlFlnOgGUe g==;
X-CSE-ConnectionGUID: SY363k0KSiWN7u2fE78tQA==
X-CSE-MsgGUID: O99O1ZlPRd2j3tYqgLvDsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78567153"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="78567153"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:05:04 -0700
X-CSE-ConnectionGUID: LHr68sMTRu+yZmx4+rq7cQ==
X-CSE-MsgGUID: Vai8ERdwRmyeNYz+WS5i7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151671389"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:05:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:05:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:05:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.84)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:05:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E45YU5cQIlfyNIkR3ANIdh6u+tOB6y8n3zsWU+oksSPdY6qTjAAK940ZJHwmbie8mvpDpIU6gSUpFR9dMokYQyzgET1KOr0guidrVaMQuBdLfz1vJwxQYcyEFhHjSY9kN6SC5faHtxKZ62BeH9NEL9H/tvoOqBva/ouzmeDdSz5bRZwcnIX780aegA7sTjx0OgEq6IV3FZ5hMBGCrPT4YnHcps5kE/sdviejMZMPvVsS5SItdXHvbrpgbYdZo3lx7ktQFLJB24mac87Bsyq5Yuy8WzUK9dZXqP3u93cffIi18pruiF6wkpYM7T9w6ovJ4y9a0N2bVC/ZNCmJDWgEtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p9Ljrfrp+jEazQLNPeErJTOCyONQ9AiXm9pwe18A2PQ=;
 b=ZFTWaFozimYM57kYVtQxoA6ANQ+OhGuyrTnCq2pQFm4QjuSUzUruZHQpMlVEKOpi/zgvXvXfYIpDLj/8sg6ClOadiasOuQ48WR9Km6vf50m58yVNZncNIamVSM2uE10Zo8yzas4Zh6MJDsuWcwwqivBSn6Be2hO/ZS1TDmBvX4VNoUjkXkbJgwsYy0E0Lj5jcm5fbnZqxUusV4hZgMQEEGbwEGvYu3I3U7thaoeyz+sMCGzpjnGgQywb4WxTHAs+1Tkso7VwmvpKV027RIc+Ga1LVtUE8iW+a849cVzErXWJ4eX99nZBBTgf9ELrs660wQr5PU8hPW5xWIMhC9v6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB7610.namprd11.prod.outlook.com (2603:10b6:806:31d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 25 Jun
 2025 15:04:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 15:04:58 +0000
Date: Wed, 25 Jun 2025 17:04:56 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/xe: Combine PF and VF device data into union
Message-ID: <20250625150456.yst6brf63h2d5rqp@intel.com>
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
 <20250624200923.1348-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624200923.1348-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB7PR05CA0012.eurprd05.prod.outlook.com
 (2603:10a6:10:36::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0a2f65-cc80-4c7c-51d5-08ddb3f9a706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckozYzVYNzgweFpsVGVhTU5ERkQ1L0dVbC9vd2tsU3p2MG1FSE55V2M1WnVx?=
 =?utf-8?B?R0g4Z0RyUHVFaFNBWnlqRzhnM0JIaUI0eDRTRG1yaWdiOVFEaDBreU9maUJ1?=
 =?utf-8?B?NlR6MmdUZm9RdnRpSHcweVNYSFc1QjdPY1pac0FKZnl1RkNJemtjRENYSVpD?=
 =?utf-8?B?TkpOSkhic2Npc294UWJaRXdVcVlHRXUvOVJBbDdWMnhNZmJlMHhSRnd6TTR1?=
 =?utf-8?B?RUxmdWNUakJUeXVtRC9ISmt3bTJSRlg4OHVDUDlrbEQwUG1rb3hCTzEwa0Jj?=
 =?utf-8?B?Lzd2UnJwNUNpanJFQTN1MVk0SW5JSlEvY3hSRnZ5QklhS0J0UDJCbkE2ZFd3?=
 =?utf-8?B?RVRzRWRiRWtvUDZGcGVaVi9tVE5XYS9seUhyWUxTaGRPSlZIVVdzbTdnZGow?=
 =?utf-8?B?ajcwVzdUT240eFlOUHlEc0ZJUk9yVHcrWXdFZThEbThXVmdZL3M0Y0wrTmNG?=
 =?utf-8?B?aUJpSEZoQVFZOFYvNGNHUGhJblZ1MkpXTm83eWRuKy9LdlU5Vi9oWllJWU4w?=
 =?utf-8?B?dVhvcFJvLzkvOG1iNlpEbVFDMXgxbDFVQmJYdXdicHFRVVpjZXcrQThtb1cy?=
 =?utf-8?B?VXlHa2lSZ01FRkZFY1RHYmFzSWFnNEJ2Z3VnSXNEbkVWK09lNXhyZjRWVVZB?=
 =?utf-8?B?NHJBalB4QTBGd1NpZzIwRnZvNVRFVWpScFRuUzlPOGUyTHdNVmxQNUttMVdo?=
 =?utf-8?B?cEVjZVJ4bUlSYzEzbElUa0NTWmRqS3V4akU0RndBRTBuci9CbitnWUJWSzRa?=
 =?utf-8?B?SExMS2pOZjd6aWpLWUVIQXZPc2RCNGxWQU1ZWkI5ZWRHTTNkU3IyR2tTRDU3?=
 =?utf-8?B?RVpmdjVDcFpRUVRJYmRsYUdNMmUvTXhneUlZR1dZand4NUxpZC90T1M4WXpX?=
 =?utf-8?B?N2F0ZWF6bEFqQWxUMGQ4d1llbkU4QVMwMFlzazRIMGFZMG51N0dpUVQzakdO?=
 =?utf-8?B?TTVIRWJDUktBQ3pNdHpwdjBSVlFlS2dha2JMTVpsRHhnQzN6WXR5Kzg1a1ox?=
 =?utf-8?B?RmtySGpiZmFiWmRabWdHNXRGWUV5OWRId3JqRVJ3cXdFMm5pMzQrSk5yb2Fm?=
 =?utf-8?B?cFFkSi92ZHZxMTlsQXJhamEwdjRHMmY1dHVSd3dCT3htZVM0U3lQam9tK2lF?=
 =?utf-8?B?NU9rQ2NkdlM1dzN6WVE5WWdvRlNSZTU3L0Y3bHArcVREZHdOVUV5dDNYSW5u?=
 =?utf-8?B?VEExbE9WMXdrMUl2YS9sY2lwenlNcjBNN2JQRjdMek5FYUozRGtJT21JbjZN?=
 =?utf-8?B?OVhrUHA5NHpLOC9rRm5EZUZabXVQN2RyUERnWVhHZWxwVWZJSDlzWlREMU5O?=
 =?utf-8?B?ZE1OQy9zY2pxYzlLUjluYXlVdFlyOU1zSU5xaUhBNGZ4bTVPeXdKbW1hWVdI?=
 =?utf-8?B?dkMwQTBaczBITGdhMnFka1A0NzhwWGpubkUxSXBMY3VDNWd4UGZpblBobUl5?=
 =?utf-8?B?Qlh2TUhsOWl4YmJRNlpvcVpWWEQ5MnN4YytaNEwrSHRycGJIVkZGa0QvVXdF?=
 =?utf-8?B?ZGoybE9KZjNic2RScnpvUlh1SlhrelkzZlF2Vm5OU0RERWlleUVTMmtHdlpT?=
 =?utf-8?B?cURsMnZFWkRXcXQydStUcWdQa3ZxcXRWYk5JbUxGTGhjMG1DN0llMnIwSHRL?=
 =?utf-8?B?U1NvR3d6L3YzV28zejZhU1BENXRkUHd1M29FRXMvdzdqMFRlWlpRVHlDZUd2?=
 =?utf-8?B?L3lEREZiMWFDQTZkaHVNTnlEenBiQWtyblZzMkk2Ry9xU3FxTGhCNVlxSjVo?=
 =?utf-8?B?SXFpSlY4a1ZOakhhTUFzS3hWZ0N6Z2FPdng0S0tWaDc4TFYzejNTelViaGhD?=
 =?utf-8?B?MHJUQkt4Z0dNYzdnUlZLaEpZYzZURUxLZFdORGdVQlByMTZmUm1wcDYxYXYz?=
 =?utf-8?B?OUxNcHpxOUQ2OGdEMC9lVytTNGpaNGRMWDh0WDRVUnJIWGRGOVJOQlpQTmhI?=
 =?utf-8?Q?gW6cSYg4HFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjRCbTVTQlpMNTFVcmwvZ1k4NGFqZWNrNW5SSFp5YTY5c2srZEp0K0ZYYVU4?=
 =?utf-8?B?QjlYRzY5TnZVOGh4SUJIRGZZL0tWbHI0a29DcUplWWdlZXQ3NkVCNStwSFFa?=
 =?utf-8?B?OUtiUS9UV0tXZmp4aUhjOUMwekN1dWE2cXI3aU9iUzhYN24yTjBhMWlKWlcy?=
 =?utf-8?B?WVRyNkF3MDlLQUtVbmp2RlV2S21BelhzbDErWHNjTnp4OFQ5dmJKdjZPS1Bx?=
 =?utf-8?B?NTB2dktSNTNiVXBIWDg4ZVlhNXJ4MlJHT0JmV2MvZEMyV2Q5ZTlmdDRtbjVR?=
 =?utf-8?B?Qlp2YWRVY0NjdFZTdDZmVFFpVk4yRHhPSkxKWm1uL3ZwV05kLzdKV0NyUWNX?=
 =?utf-8?B?eFd0ckFNc00rZExQYTJOR0NDK280clVaWE9SYmZ4SzJoekQ5dUVXZTBQZ3lY?=
 =?utf-8?B?UXBPNmRqUTBHN014Y1M0Ri8vWFVoNWp0S3FPOWtkMGJkdzNZa2c2Y3Z4Zno0?=
 =?utf-8?B?T3JuKzQ4a0xFZDdWOUJ1N2IvSkdJVjVPV3dscnN3THlIYU1kRGVZN2drVkVW?=
 =?utf-8?B?dUNlRFlTYlZPcFRMRlZuajd3Q2hiMGp6c3N2cGkxbVFkWEMvY2xEUmxXNUxv?=
 =?utf-8?B?KzV0VjdGY1BGZHE3R2ZFMFdaNVZCL0FxWjRJZy9TMExJcmwzVTlNeTBzemtx?=
 =?utf-8?B?cWYxaE5LRFhrRzF0ZXFaMlNjRytMbnZBL24rQTcwUnJheVNmR1dJRjNERksw?=
 =?utf-8?B?YUtlZ3UvaEFZaFVxVlZPVnc0U1k1WE5LTkZnLzFQMmN5Wk9pcGtGTEVFYURJ?=
 =?utf-8?B?cXdlZmF2MWV2Z3EvbW1tRlJkS2duTUFJb2I4b3BVODJMOEY0RVJpbTMzK0Qy?=
 =?utf-8?B?OUI5MW5CUTNEYmJvVkNFNE54WksySWhQaXI0MjVBVkl2cExGT1NhZXFMWDAv?=
 =?utf-8?B?eUJLUXpCeUphTXAzM0tHV3BsdC9sRTl1R2IrTGh1V0xiTDlMRlMxMnNmY2Nx?=
 =?utf-8?B?NzJ5eHM0UnQrSXJYV2VBSmo1MUM2OWpLMld5RmtOeFUyV2lDVkpITTFITjNK?=
 =?utf-8?B?a2NRellMcVlUYklXV1R1QzJxYlByMTlXckJJSExWSDV3TDJHMXlodytkaGkx?=
 =?utf-8?B?R2NBUjQ1STdoTEs0cEM1YnI1OURMM3RQa3BlNTZrcGVUR1dDYm1iNjFsWDNh?=
 =?utf-8?B?RlRJeGR2WU5qZXFHeU8yMFdCenVNdUZJMzNyd2tISFN6cjRPMXJEZ0Z6azRH?=
 =?utf-8?B?OWIrK3hhRWJQL0kzMmhPdFU5cjI1WUJyS2ZYUDBoSGZDSE9OT2E5OXlRd3ov?=
 =?utf-8?B?a3FlaWxlQURDdksrbk9UQi95MkRZbTVmR1ZUcktlallsZ3h2bWNpZVVGRGNr?=
 =?utf-8?B?bVgyUzZYL0ZzZ2N4Rngxa2QwSkp1UnVLUG9Dam5kdzlUNk9VYjBBRnhaU0ZV?=
 =?utf-8?B?WEF3b3ZkM0t0S0JTOGdXUG1MUkhzb0RyaTBSVHJGRUt3M1crc0xUcm9Fd0Zy?=
 =?utf-8?B?b1FxNzFCam9tcnRpdWc0ajRKZW40cTM1VjNQVytaeGlaQTlQL2RjNWFseWlE?=
 =?utf-8?B?RHdOanp5dUVLQWYydGNjQkhaYkFJV1BpZzRIODFWVEYrRHMvL05sRHRxNkhv?=
 =?utf-8?B?Qk5jMDloaTFJZHg3c1dMWGZDL0RxZUo5djFBdGhRN1FBNHd4eEcwZmZBYlFB?=
 =?utf-8?B?U2hVSnQrZGg0Z2Q0SFFFbFp0RkNsT2RGWHI0Y2hQeGxrN3dFV0VrWHBxRGlV?=
 =?utf-8?B?YnV4aTFlWG5IVkZSaGkvdG5kOWtSN1BSaHlZcStYRC9LMHZzVDZ5UUFhUExh?=
 =?utf-8?B?SDlyZ0JNYkNzM05FemhBRVVCY0xkbmEwOUFTdFVxcGNodW53eWFZcjVUWlBT?=
 =?utf-8?B?dHpqSTFnZDJiRVR5U1AxTWVySUY5R29RMFNTb1R6em1FUGZDUlFMSjdUYysx?=
 =?utf-8?B?elcrVDlpOXZmRG9IZVpPTWpJTktZNlRNakRCTTF4aVg3aWxUVFZ4S0o3S1V5?=
 =?utf-8?B?dEx5dldMS1J1bmx5bHMzTHNNNk5RemwxTEIzYzYybit0a3BkVHAycHhzbUFZ?=
 =?utf-8?B?bU5QV0FtOTVDQWROb0NLV0ZVQi9NKzYvQmVVeDMydkQ0MEQzMWFnQ1EwM1dE?=
 =?utf-8?B?bWlNT3N4MkNIQkpqcGJXYWlIbWlpaExBSDNpQ2VsdzRaeVhCcVVpM2R3YWxv?=
 =?utf-8?B?T0dsM2dvYXFGNDF3cWtDa29QZnh3UXdiTjNLYis0OW53NzFtZm1XZXlKTnhN?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0a2f65-cc80-4c7c-51d5-08ddb3f9a706
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:04:58.8966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ObmRzRFoXExFcc+LEmCWcm9KFB44s+dXHi+svuJ5ZsHDjFJhN6I2vy8TJSqgz/ZCnNbp3b8/N6NR5rjTWdgntDMR56uONh4WFhb8y1Sv3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7610
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-cze-24 22:09:19 +0200]:
> There is no need to keep PF and VF data fields fully separate
> since we can be only in one mode at the time. Move them into
> a anonymous union to save few bytes.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6aca4b1a2824..962acd451734 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -406,10 +406,12 @@ struct xe_device {
>  		/** @sriov.__mode: SR-IOV mode (Don't access directly!) */
>  		enum xe_sriov_mode __mode;
>  
> -		/** @sriov.pf: PF specific data */
> -		struct xe_device_pf pf;
> -		/** @sriov.vf: VF specific data */
> -		struct xe_device_vf vf;
> +		union {
> +			/** @sriov.pf: PF specific data */
> +			struct xe_device_pf pf;
> +			/** @sriov.vf: VF specific data */
> +			struct xe_device_vf vf;
> +		};
>  

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  		/** @sriov.wq: workqueue used by the virtualization workers */
>  		struct workqueue_struct *wq;
> -- 
> 2.47.1
> 

-- 
