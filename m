Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB3FCAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 12:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A990F10E0D7;
	Fri,  3 Oct 2025 12:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnEO9cYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D0D10E0D7
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759495963; x=1791031963;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=3iarYm/QoanLCCMEyGzporCTC5uv+SiWC2geUNO03sM=;
 b=RnEO9cYmTCxR81EDeGFbbou/2W8Vy4tdDvq9dHgMp79XBd742qV1Z2Mz
 17ZfZVJWZmc06pJ+nNF4byveLNyfwv8//AubSS0RMDgujSp/dS4sseDBT
 o/5SqXxsFMjIs20szDnoHSj2ApOs7BFywszRRiuMvZdd5zdrIl/VFytwr
 9M89N7XE+slc6qucExvUrYF49naHHJUylpP+qpqeJ1hV6c7ViUnSMoraD
 eth7ayXkMz7va+2QgZMoQ6iZfk2K5x8AIUMqp75t7mXsVuPWMdhdO60OY
 FBE0O1tAto3gPKbJ/9tPqR09hXC7PWLbEKFwBJ7mBdff43UrAXEjyuQWs w==;
X-CSE-ConnectionGUID: +OaWDOmjRCiO8hBa+5exlQ==
X-CSE-MsgGUID: OQpzCt/ETDyLFQT3m9MiYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72454056"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="72454056"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:52:42 -0700
X-CSE-ConnectionGUID: DEr8TUpDSVeTPFBW/x60Dw==
X-CSE-MsgGUID: AeNEexkaSVKXAD6nxyh6nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183687755"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:52:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 05:52:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 05:52:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 05:52:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXppyfudnlZ1kyJLI9uO9rX8JueYpjyXWBCmaD3bOFKqPybcGiF0cvT/IgvT0SuojXlVzVWOEjYlFV1eE8oKV9Ys00fS1r8nr7lUqBLkxMhtJQLx2rdbUKVedP9voa2Nz6lWm+5b+SJcnP1LgmeZy7s6f7oJtN2NMgEZrVQS82RA/q2EITmY9ves13XBxz+TpOqlroaW5P5k2FN3tD6M79rGfZyBia4u9QQzq1bgNv2FiBf/NX7w9iSQgSPeYaUSDqLDXdu48HKvtjGVsmUQefY28jHbMSY4bC7a+GQ3LMJmy4uhvAVUnfPBxXduJ1JszotH7wDTmANZnP4d1Q+nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FHbMZEksnvCx7/qS5dpHjxilV5DWXQoK+iFELQwvrA=;
 b=XAmXmMSeJSQSt4TJXfQgI2WeAisf1ZDiD/smvROt8syGEsToqWER/fMTtuDb7Ih+XbTarGVo7+295m+6O3NvHfW88oX/6av1JWdBdNJk3v3jX6bWy526Jk/CUDxvAPOErtMhAzRaqSG0i9ZJy5PU1wTbJ0VfsqRiYmqxCw+aw/7YO7B4awEUuRB+o8iF/bcBrGW+eji5lFjMXKS2ddcKTUbRfnoRdZztOjqCXUUHjXAnFwIEnSwaUpztQ/FBC/jLHJu7XITPDlY+avUwVYdQXx/VZgdQkThhvBbWIZxnqF8QllRm3NU/wrXXfFcbX1glU35mh/9C4M2J3/51Bo0pEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA3PR11MB9328.namprd11.prod.outlook.com (2603:10b6:208:579::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 3 Oct
 2025 12:52:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 12:52:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-43-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-43-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 18/23] drm/xe: Correct lineage for Wa_22014953428 and
 only check with valid GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Oct 2025 09:52:29 -0300
Message-ID: <175949594936.1952.10414687489120587748@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA3PR11MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: b8edb253-cce1-455a-25e2-08de027bb922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHZlOXVPZFd5VzZVYzVPYjR3Zmk4NnRzNUlYZkhCYXppNVNqZEJXUlJYYjY2?=
 =?utf-8?B?azU1bTlhUzlwWTVVWWlIa3VXZXdRRlMwUVdXano3OXV6QUY5dEVCQnJwOGVW?=
 =?utf-8?B?c0g4UjNod2tybW9yNWxUQVI3MmNDbFBZK1R5aWxNMElPak4vNWN2NUlsYWI2?=
 =?utf-8?B?V0JSRHBLeVY4WkVvdzByVDk3VUhkRHhxWit4aFNta0d0WFJ6aGxraDNCOFAz?=
 =?utf-8?B?QW1Xek1YamwwQjZUV21rc3o2UkFzRUpwOUswN0RTUWxuR1RZQjdwWnQwaW83?=
 =?utf-8?B?UmgrUThFYStaakJCUUdjKzJFMVJLdmFZaWVqTTJFME5vcGY4aDArSXFXb2JR?=
 =?utf-8?B?WERXUEFDOG5UaG9uOUtFWTgxY1VoNkg5ZXJiZFYzcjVad3dGVG5PZ3o4TUow?=
 =?utf-8?B?YzBzZTNaV0dRTlhLcXJkY3NYK1cvVGNZV3NqUE1pU0p0YThTTU8vdVpFbnlI?=
 =?utf-8?B?YU1CcjlQWkVTdjBLM1NTVy9DZzhOS2RYS1NzZklBc1h4L2IrczkrM0s0NDk4?=
 =?utf-8?B?UzRPOXVDSDFON0RLK0IvdW8wRzZOdjJaZ01kQXkvSlBMSHRpUk1heTlhTFVa?=
 =?utf-8?B?TkFiZDM3Z2I4UThaTFJsUDlPaVAzWW0zYmZacGQxYjFTYjdoOEZtNXluRmVP?=
 =?utf-8?B?L2VuMS96cjNoWktIdHcyQ0RSYkdDeE9IanhLNmxLaXZ4T1BvendsVmNMV0NV?=
 =?utf-8?B?VTFyNU1qcjlBSVhOem9LdldnUVVNcTBvZ05FMWJJVWJEMEdkMDlWTFdqd3Ux?=
 =?utf-8?B?NHNsajErYTF2Q2RpdytuQ0VYUHJUMUl5RmJncnJOWEwxWksrbjUxc2NDTy9x?=
 =?utf-8?B?bS84TG54dm94WUxocE9XT2hzbGRQZ3ZDNmI3OHh2MWN4dG1COUkwNkpXM3B5?=
 =?utf-8?B?NUMxZTV2WVR2WHlwREdRY2YwMyszVUJVUE1hWU9mSUdVeUpuK3cxK1kxS1Bx?=
 =?utf-8?B?UE4vVjROdWZMU2g3MGpSbDd1cXVYbGQ2dHlwdUlHb0l0NWRtdFJsS1pWTTlO?=
 =?utf-8?B?dG51UGhuRzhmSzRVNjdTdTFpR2tYNnU1N2RrRFlLc1pXRVozV0VBRjBCVGZ6?=
 =?utf-8?B?YVlXcXZKbWVxZjVyVjZleGs2eXpjUi9vUXZHUHNORDNsTEZvR25vREkwbTZW?=
 =?utf-8?B?QVNwVlZlYkZMMVhadzUzQzFxU3VHRXVWL00rTlMzOFBBb2dvdDg1NVVzZ1Vz?=
 =?utf-8?B?bVhJZlRnclhVZUtPeElORDVsSWZxdlJRWGFGQUw3eXpGSkJWTEhhOEZjaDc2?=
 =?utf-8?B?Yk5Cb0FkNDdIbG92OEtXYitwZjBaQWRZNXBpMk1FVUdXTlppOXc0YnZMTzcz?=
 =?utf-8?B?UndES2VqOXBRNlBoUDZ2YmNjbDJsdWwvbHFjcExDK3RzOUhtc0gyMU1jazBr?=
 =?utf-8?B?VXZVend6YkxNRXhmUkJPNnRwOUtINmlRWmFKYVhCejYwWEY2REFrQ24ydGhk?=
 =?utf-8?B?RG94MjVOY2tURVhrZVdvL1pxWmcvaVNZT1ppVmwvT1g4MldvRVdQV0piSHZD?=
 =?utf-8?B?ZVlCK29YTUFhMlJhY2JtdE5Td21FL1pLeGpqcmhNTXRLU3JqUzd2K3RVVEVu?=
 =?utf-8?B?cCt4anA0OFBvNWxqR1Z0SkNUcVMrTS9NVGIvVmEydGZKeExWVFl4a0phZzhm?=
 =?utf-8?B?dWVlQ2gvSERtanA0dzIrU2VUdmY3eFpSMFNJRWkxeC9CREt6K0pqOFpRMG5q?=
 =?utf-8?B?L09RRk56dWNobUx1VnNqQjc4NzlKT1lJN0o4aWdReVVMbHhDT0R1cHJHMUh3?=
 =?utf-8?B?K3JHZFdRZ1NzNUl2RnVrRXlyTWZYY0lIMnd3TGcvR0FKNnIwQ3ZURk5HbXVm?=
 =?utf-8?B?U2gwNjhyci9MK0pMSWdnU25lL3FhV2M2SlRpVFloK2lrR2VhaUl3OUc5bFBn?=
 =?utf-8?B?aUpYcW9OV1d4dCtVVDl5SW1lMEc3eWZOekIwb1BQTzNtcWJEQ0kzRlEzclgr?=
 =?utf-8?Q?+3y+tS7Ers+VEmeQx1GRTR4F07UEQF1t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TStoU2NUUXUvOXJjaXJub2dTdTVYN0VFYmxqTGpLc2RiQUExeUNZQ2JEeG02?=
 =?utf-8?B?T0JCMFk0VE9rNmFQUGd0Rmh1cVN2UU5peWczVXNlbExla09CQm9zYXdXUElE?=
 =?utf-8?B?b094Sllxd3J6QVU1SHZ0SnJXMVBVdUVWNVB6dGFmRTdUYnJhRm1lNTlNWGpC?=
 =?utf-8?B?RnRyVmpJOTFhNXNNcXRQMy9tSXJJbVpBZks3dUxWV2pZaGFTdTVQM2lvRHJl?=
 =?utf-8?B?ZG1COWpHN3VkWG1UdG9Nemd6OTR1cUhLYWNTZ05uYkdCeFl6cGxDVS9xZ2Yy?=
 =?utf-8?B?Ym9CbkpaNTZiQWRFeVJFdEprVHF2a084d3gwS2hvU1FRenp6aFo3em9Sb2VB?=
 =?utf-8?B?Z2RSaWhNN25nUEhZT2MvTERqM0ptc2JEWmNvUmhrVHBzejYvN1ZiSW9HNUkw?=
 =?utf-8?B?TnNGeS82SWkwczc4aXJTMUo2YllsSVhETnZ5cEJUNW1renlFNUlIVVRJczV0?=
 =?utf-8?B?c0Z6NXR1RGtrbkczSkFqWExrODJvVitaSWlLZ2N2SXlxTjdnekUweG9WQ1dv?=
 =?utf-8?B?REtiUUdPUU5RWW1GYWUrTnpmRERrRThPeitKSDUvTlhQQ2F5bkFicXBManor?=
 =?utf-8?B?Tzd1L2ZHOWtvenBKZ29sV3ZRTldWdVphditxOW9NU2hPa2wzMjNHN0Rqdml4?=
 =?utf-8?B?dmYyK0hGSHo3QU5LUENCdTRkeUJ4T0hkTXdIOU1qYkYrUGR5d3lCVE56cVhv?=
 =?utf-8?B?aExkR2xDUm9kRjJMeTdtSml1eGtyMzRucEFjallVaHB3OEYyRlIxcXlPemxT?=
 =?utf-8?B?OVJoNWNJYU9vc0hxMVZETURxeU5WRGx2eTJETGxVcDhldEE5UzdXckd2VW9Z?=
 =?utf-8?B?MHlGclpjQnFXUVVxUmVsL21MbW1TMnBpS1FkZGFzNXJhOGJuWWdjVU1OYU1E?=
 =?utf-8?B?OTdFanRoWVVLbWFySFdaZzErUUhhOVdzNFZicmZpVTBqekw2K1NSS3RCMzNx?=
 =?utf-8?B?eG5RR3gzVTdEYWhxM0djcFVkN2UvY01tUTkramMzNjNwRjVMWEFEVGtGZFhS?=
 =?utf-8?B?ZHZnQjY3YzBMRTZFMjJNZUEwUm5TUTN1Y3FaKzAzazV0a1h6YUsxdW9Na0tP?=
 =?utf-8?B?QUhkM1BIcWhFcVRqajlReER4WUw3bm1oa2pUYnBVbG5qZUNLRHNDZEhmL1k2?=
 =?utf-8?B?cFF3Mjh2bWxHaEJPR3d1TDZyd3Q5dVdGV0JwcTlXbTcvWENORldDQzRubC9J?=
 =?utf-8?B?aXV3K1lSNndnUXd5MVBqU2ZqenU0WTZWWWlGcFdXNzgxTXlSY1poU09IditI?=
 =?utf-8?B?WUNzNGpZbTY0bmhnaVJXTzA4UTRBdUpTUXUzb2E1NHNDNU5WK2pYcEVZbnJL?=
 =?utf-8?B?a3JSSXpsRVhJT2g1OUtUbkZVNnhVZ1ZrUk13anJRVE56djc5ZmE4d0hsWmlv?=
 =?utf-8?B?b1VES2ZwRkZ2YWY4bjBaNVpUN0c0VFRiU1drblhLQk5DS09CR2pyMEpFMU1J?=
 =?utf-8?B?Sko3Vld1MG03cWNUelZMcEkwbTJRa0pBSTllU3dOUjR6RDhlWnFuUUh5cGxh?=
 =?utf-8?B?azJTaWR0KzRid21XTlUrUzZFT09nazlhQW1iUk1iWGk4azF3QlZSTTYyaDdn?=
 =?utf-8?B?SlI5MGRyV0wxa2Z0a0FHUWpoWlVHNHl0Qy9SdElsNzh6ang4RkFhSWdMZ0pw?=
 =?utf-8?B?WFUyRnVkakltR2JXRTlVQTVvRXJONVJQWHZ4a252VzhpNEl5UE84dTg2YlJI?=
 =?utf-8?B?YTEzdlNkWXE2a2dHeVA1RFpPVEFBc3Q1WDg3Z0QyMDNHOTA1T3c1Vm93V2lk?=
 =?utf-8?B?SU9pKzdta1hsRXNxM0VXWVNVMWpHUDh0OHBlWE5UanpSWUFnQnpGdHhZQWpL?=
 =?utf-8?B?cXg4eEZFUzRKU3dqY1F4VjVHdS9IajdBWkx4TDU5QW9RSk5jd2hRMHFrcStt?=
 =?utf-8?B?OVdlckU0M1JrWHd5OGZicnFheXFsYkQrNndHYkt1WVZFY2pZRG1sajlNYkEy?=
 =?utf-8?B?a2FmcUpNWkRtbGxrZ0VyVURpRWRZSUlrMkJ0MVpYdFh2bktEaGd0VGw1RXg2?=
 =?utf-8?B?ZmNXaTZrOVJRZkZpWHppUHh4OUFkckJkWU9GZjgxbE1iWnRsRUt2ZzZPZmc0?=
 =?utf-8?B?cTRrQlBUVVRFc2ZXc29nNVZSYnVXdStubFI3Y0phYi9teXFJeldTLzZBOE80?=
 =?utf-8?B?VHBuT210eFBzZEJhNU95YVcreFJKbmxKSll4VWVTSjMvN3FOanVXcEVsc0FO?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8edb253-cce1-455a-25e2-08de027bb922
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 12:52:34.4776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnPQVjNHXJyQtvvj//71Zmg9yUjd2q4cnQOhK9KFYcXw/nLNMmBAQOGI0H5pegfNvEQGEDJw59vmBDIOowHztg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9328
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

Quoting Matt Roper (2025-09-30 19:56:35-03:00)
>Wa_22014953428 was incorrectly labelled with a release-specific ID
>number rather than the cross-platform lineage number; fix that.
>Also check that the GT is not NULL before trying to lookup the
>workaround in it.  Since this workaround only applies to DG2 discrete
>GPUs (where the primary GT cannot be disabled), no coverage is lost.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_vm.c         | 3 ++-
> drivers/gpu/drm/xe/xe_wa_oob.rules | 2 +-
> 2 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index 80b7f13ecd80..1677ae729e85 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1886,6 +1886,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void =
*data,
>         struct xe_device *xe =3D to_xe_device(dev);
>         struct xe_file *xef =3D to_xe_file(file);
>         struct drm_xe_vm_create *args =3D data;
>+        struct xe_gt *wa_gt =3D xe_root_mmio_gt(xe);
>         struct xe_vm *vm;
>         u32 id;
>         int err;
>@@ -1894,7 +1895,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void =
*data,
>         if (XE_IOCTL_DBG(xe, args->extensions))
>                 return -EINVAL;
>=20
>-        if (XE_GT_WA(xe_root_mmio_gt(xe), 14016763929))
>+        if (wa_gt && XE_GT_WA(wa_gt, 22014953428))
>                 args->flags |=3D DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
>=20
>         if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MO=
DE &&
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index 113a62f1b541..4bb94e5799ed 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -11,7 +11,7 @@
> 18020744125        PLATFORM(PVC)
> 1509372804        PLATFORM(PVC), GRAPHICS_STEP(A0, C0)
> 1409600907        GRAPHICS_VERSION_RANGE(1200, 1250)
>-14016763929        SUBPLATFORM(DG2, G10)
>+22014953428        SUBPLATFORM(DG2, G10)
>                 SUBPLATFORM(DG2, G12)
> 16017236439        PLATFORM(PVC)
> 14019821291        MEDIA_VERSION_RANGE(1300, 2000)
>--=20
>2.51.0
>
