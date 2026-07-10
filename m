Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BDFC43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 06:53:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC9810E153;
	Fri, 10 Jul 2026 06:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d62EF9Z0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D32C10E153
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 06:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783666419; x=1815202419;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kB6VVheIIfJ2b4QatISJOXXjyUTynj2xJSth6dkhgOw=;
 b=d62EF9Z0UF5M1glWuzfy9e0L+ISg0FrsNUayX6LkiJEcNKlmoY4L9LoR
 lBvj7s1c4EuHR68YlLm2ybvkJvPtUbIOXNvObfQOaCtiqMkl2k6GOk5Vm
 NMbyWTuHCT+W/mr35+kgF2Ug4bQVOGUwXukrdmUJxszrv+JFmle2c0vmY
 IoDoeQnq8uqJWbU0Pxy9ueeejdbBtZA37DttldPFS2VRqIZybdHx7X3CA
 bvj/oqXG6FP5dIyJNJ2R/Y7z/wY/+4v+qFaa5jRr2aHWfNGdwaqz/RS+q
 XNwBAjluUyqLpuCZ3pvQw9e8eSYvdaoGUVt1Y5RFKX0vGtaeuujRhQ3qG A==;
X-CSE-ConnectionGUID: XGU0+L5XTbmlEjfOo3GvfQ==
X-CSE-MsgGUID: fCNL1dq9RpeQrvMs8MDJbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109907576"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="109907576"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 23:53:38 -0700
X-CSE-ConnectionGUID: patOwDx/QEOLXWjc+7CBgQ==
X-CSE-MsgGUID: diO1wyedTA+epXb5s1tgfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="255461517"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 23:53:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 23:53:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 23:53:38 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 23:53:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIObcCexFn9Vz4EFyBLjUowg8mQg5XLufvWnGOLmlkcCYGU5v7cS/49aBh7ScHPL9rItRDwUkREzI68Sg278rlj0TzB+tKdQWqTt3Km0rjw7A4fp4SwkWAcucfnn1HhAjC50azBxDmCsQPYwKLZxnkMl3QF1iDIloX37+8HO1ZdwItOnZlgC+mCnVsnKotfb9awP1jv4M8QJgzGYyOhRWM6r6UdT7LApLKA1TFmmwB/UmpX8OCb0MBbY3aaR9Nehv4lJSw3FkBlctja6B3LyjssFWSrnZQ42+NOUqd5lw8HAs7XxRNw9BJqMRU/Muyldy74flHJre+BxJKoPH9uJJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYacTMeYAmgXKsTRXo8cq5PuUmA17gHB/1D4T5KxgLc=;
 b=J018GoLa3pUAdTIY90l54MseRy6uUc5vNdFt9wmaQCcyLp6qRGIMVNhiiUMwubSMAk+XXiI8D0VaSwei3SI3pkjLsxuL6dErzQI0NYhR4z/maXRU4Bhg5CR3KXx391gN8DVIk6FjUJxPO4lR6fFs0f2qBgJg2DWA0ZPdP55ty/NRKZcWHsGO0p5pwiSOcD7DDS7SZ8Gkrm9QiZ93jZiiMX0RE3DktyWnz93SIFr/cOshDKt8e2kBEvwi6h0zvGj0vybZLl8IIi0O3ZpblyOSndPQkSbJHZUX/3dEDGZKU+oqJ93tXlZMTUq6P2LaOy7F6iN/51U8dBvcIsFZBFS8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 06:53:34 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.21.0181.008; Fri, 10 Jul 2026
 06:53:34 +0000
Date: Fri, 10 Jul 2026 12:23:26 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/eustall: Add WA 14027054324 support for
 graphics IP 35.11
Message-ID: <alCW5r7B2_brEZVf@bvivekan-mob1>
References: <feaf428427dbb94c0c7079a86778fd2925861bc0.1783554762.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <feaf428427dbb94c0c7079a86778fd2925861bc0.1783554762.git.harish.chegondi@intel.com>
X-ClientProxiedBy: MA5P287CA0199.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::12) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 180f6b0e-b462-4c05-e1a3-08dede4ff58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: spp+PDQtSRi5r2FS5bDH237My8gdqJbahpYqkDncowCWqriXVRK50M4GuDG705pL+5CSKO2UgI2B44ZMf44KJL3ER6CM0+hOZF6ahhSSoK/rgIDz1DH3iWu1AbyEhJkQAlAg1oYZVwlRhOr2ZIECuh53CPDjsT1nzk5IKhkcifxFoABniW5JaaZvcUhZdR+Rg4j6la6Yu2ZcB+3ZviIA9xX4b3PgACD61z08lFGD1xUnFsjSF7WjuaAs2YpU6BcFbdL3Gjwggy8syZCnZOw0IExC3d71om/tEQsvBFv2saSr1orZ6HuUrphdJ87ICl22OGZoUvxnRqFWAAd3Ilyzsmeik9x0qWlM0SytJoooZhURYApPj+RcP3hteyRdyhrmpH1Jrhx5xx47TmP5oJ0BWK+tERVa9ebKpT6FiChtvhMX6sWMcQJcKjLsYhPAkFp75P7hB0PI6IQr0vzRZ+k4wf0G+sHOhUZwutTAlSEx1CblFUTFdTXF8f5oUSNGinrO356MvKDsLwbOTZktDIlfdwV9eTRDQ14jSKbFKTDFwKcLZ9t9xythN7HUEHSSamq3REKBuUjSUyAxaIdIF6E0XGLcWVLEB3Brft8xYsd25785cgRBdnSRLtLfh9YfBMtrxs9X793oOxEYvZgqKONlDLJ5ZNO7CDVD8LkL3DdDju0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3JUSVJwU2ZITlpXZWRQS2hKVVQ3UW1rZGdZdmxLcFdqczk5WExRUm5XcEdY?=
 =?utf-8?B?ZU1nMlZHVk9MUWpSN09ZRVlqZkFKZFoySXpybHpocU04a202a0JwaGpQcWVp?=
 =?utf-8?B?alNXdjhaZHJXbkZnU1VhYVhaeEhWT2hVVEEzZFlWUEVoempOeXdNVmlIa0dD?=
 =?utf-8?B?WURpSzhnQXVGc1MrWUVFczNXdU1JSkFtMkZHQnN2QnJrUnI2NW82VVhrU0E1?=
 =?utf-8?B?NUQ3elFJZEwzRCtHVVE3dC9uN2pTNnBkYXBHZnZkdW55c1I1RHpWbGV5cW1X?=
 =?utf-8?B?bFpuV0lUbnAvQTd4N1I1Q1BIazhVcTFHWHg1UGZXQTYvcFJLTXRhR2dTSUtK?=
 =?utf-8?B?RlMyTU1EZUE3d0xUWjFKTjc3c0QwN3RRUmlGWmlBUVREUjlsRlp1aFh3bUZw?=
 =?utf-8?B?VTFJZE1LaHhOSVlxQWJqVEp3c1BtV1ZnREM2N2tNdnRZeUlTeFlETmJuRCtY?=
 =?utf-8?B?MWhZbkx1djJ6Vmk3blkwRVM4YVBxZ0duU0ZrOEhjdUZwNDlOR3pWQU5EaWIr?=
 =?utf-8?B?TzVpLzUwSHhDblI2aUdqYktBcG1GOGRGSk9JMHJqOWZHbjUrQ1NVUzF1M21y?=
 =?utf-8?B?cmt4Ujh0VyttcnllVzZQNUZKSlFnSVpaenA3MHlIeDdDcE9UVkFTYVIzbEx0?=
 =?utf-8?B?UTQ2bXc5NWhOajFkZ0FCU1RST2U1czRYOUJoVXFyQ2h2dWZwZi80dVFaYU1Y?=
 =?utf-8?B?ZmZ3S1kxY282UGtUWU40YXBGTnVRekFYTEJjQ2FDZkhudVRQVmpYd3liM29V?=
 =?utf-8?B?Q2owT1dRekdvQVVmSDNpQUhzd0ZCMVlndTdUdDBINmhWTHFvR1U5RkxXNXhC?=
 =?utf-8?B?MjhqRTM0S0c3dnJScTVwazlwamV4QmNzcHExL0FYMmZzS1BLRU1PeXc2VWQz?=
 =?utf-8?B?THVrb0RzOVBTQ1lCOHI2KzdVZnhJOWJHaUcrUFBYcDNzMDd5Tzd5ajh3QkJw?=
 =?utf-8?B?aUdQNnBzYmJZUkowMWNEZ1FQZ3ZrVThBVWZsR3gxUU5sREhkVS9XVEVCaWh3?=
 =?utf-8?B?WEJjVktJV3U1Y21hWE9aaEVLNUJFbGxKV2ZLYlk4Y0tpVUhJRzJDbnk2QnZP?=
 =?utf-8?B?RFJ5VTVjd3JBVUNDQWo1VG90ZjBJa2kwc3g0UUV4NDhrU2lubUZ3dnFPT0U0?=
 =?utf-8?B?KzNGNTA1ZEdQbmtLbFR6RTkvTFEzamxJV0EvVWFSNHJNd2N3M25TeXl6WlVy?=
 =?utf-8?B?d1RTNjJCSTRzRnZ4MGVLS1daZUZHdmIwVDVvb3dRVXNWT3pRUGRUODVWaFV0?=
 =?utf-8?B?aEY5akR5YkdQbUhPQlpla1U5Ui8zeG0xc20rYjRmbzRleDJWM00yNW9WNXc1?=
 =?utf-8?B?ZUV1UUhJUEI1L1lCOXRPeVZ1QWZNbUlxNXRmY25xT2pEREVDVkwzMXVaY1dH?=
 =?utf-8?B?K09ETThZZU5rd1o5YW1vRGR3bUYxUEZmdjR1RUthNG1PeE9HZzcxT2doZFAv?=
 =?utf-8?B?bDZJV0EvWVFISWY4dmtIRkI2R0YyMU00ZlBPRS9CR0dCQTVWTHBTbmNmMFFK?=
 =?utf-8?B?ZUd2d29nREk0a2NORUVTbmdFQ3BuL05MTW92TEdvWFN2aUJrWWlHOHFlNk84?=
 =?utf-8?B?ZTBtVWl5QU9tWnlZVTlsZlJkMTg3dTM4QmxoSis2OEhmekxqejJtL0N0SmRR?=
 =?utf-8?B?ZGVRdll1SGF4RkpTTjVkYkVzM0tzQXUwK0Z1bTFOUnNjY2RXTzVkYXFHRGVW?=
 =?utf-8?B?UytwYy9nWUxlS3lXYjJLdkpPYXdOWll6MDhhRTM1VXBxUFMzRU5wSkJmZ2xB?=
 =?utf-8?B?dit3YXVTbTRmT0h4Ym9iSjdpVy8zbzFUNHZjWllRSGQ4bkVOYWs0S1BpQ2tV?=
 =?utf-8?B?Wmd2L2VwbnZwM0xCN2tVdmRuWlZXeER6U2V4dlFpaVMzZm4vdERUTlJEdE1J?=
 =?utf-8?B?dDZON0RSbmJOSk9jb2VPWmlBcVRQejhVNk1qc1hxYkUxYWMyRU9HS2pGTUho?=
 =?utf-8?B?M0lZQS9vTHh4Z2xHamRXcUtYRHBFUWNQODFMaktEeFR2U0JLb3VoVWtDS3RL?=
 =?utf-8?B?UVN1K08wN2EwT0xMTXQzMXVBUFBMZE53YXhkL0paZTBPQjNoWEpnZG9qa0ly?=
 =?utf-8?B?VDlCdDZja3l6b08yQ3M2VG15R29na2pFMUZwT3hFTW92bENzVlJmeGFiM0Ux?=
 =?utf-8?B?K1RqT3hMNEt2Tk5YU2srK0t4RXppSWxaT1JrcVVBMmI0ZHFMVDJYUnVFL0F6?=
 =?utf-8?B?VEtQRHQydTlsSTBFQTNob3FweXVWMDh2NzJlaEZRc3U5d3l0Z1gvQ0hIdFRm?=
 =?utf-8?B?MGRaNDZGek5XRmExTEJTay80VWJ2VFJVWFRNTVBMWjVuaXUraWMwMkxLREcy?=
 =?utf-8?B?dGRRZ2tLOVh4bWNnRWFnL3NRREJJeXJqTGRXVVArVzVibEtXU2hsRURETkgy?=
 =?utf-8?Q?QEcKlFCFehnWDEyuucCtdJE/4MfhBkIiZFPyM?=
X-Exchange-RoutingPolicyChecked: J6dy9H20/iRF9X9ue+rxXkE+8SvAWQVrHm0CaODErn1Ue7CdEb+7MwOgHG3nuYfAQFKr+JkazITgvnaEs4UVJnyXSTXPoAWkOHhHdpBNmD8xvFsawQa4E7eAyb1F6SWDPRTfXAEwie1Xc4QQfEAnbRy67rNyw00baEAnVG7/jnvPeAsoWgKGxSIM8mA89/ZyNablCKgP4FQLt/SRjuFdyuNNro+yV068FOw6c4cr+KfX7FHOtGF6ICM5AlR37/ib8WRffmC1HX8m8qxzA0h7/TDSl2WEJoTXi1SeBZmAv4JUAq2+ra3UzJH/67ks7kvjA+nbqqbajUZ86G+pNfBzsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f6b0e-b462-4c05-e1a3-08dede4ff58f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 06:53:34.0903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gN2LWjrIMjPr0AfwTYSoggdNVEgVMTvFDOb17hiqcg82bUvFG11Tir9tFwNEEoxahsxeWg81fFjfalYkgyC6vvoMA9lA4EXEyN9Zf0CkrkhCAph/nK2Rv7XzZAw+uS/B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
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

On 08.07.2026 17:06, Harish Chegondi wrote:
> WA 14027054324 is implemented in the firmware and is applied before
> EU stall sampling and reverted after EU stall sampling. The driver
> needs to notify the firmware whenever EU stall sampling is being
> enabled/disabled so that the firmware takes the necessary action.
> The driver uses a scratch pad register to communicate with the firmware.
> 
> Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
> register to request the firmware to apply the workaround. The firmware
> applies the workaround and sets the scratch pad register to 0x60
> as an ACK.
> 
> Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
> register to request the firmware to revert the workaround. The firmware
> reverts the workaround and sets the scratch pad register to 0 as an ACK.
> 
> The firmware is expected to take about 1 ms to apply/revert the
> workaround. 10 ms timeout is used in the driver while waiting for an
> ack from the firmware to have adequate grace period.
> 
> Bspec update for the SWF scratch pad register is still pending, but has
> been confirmed offline with the firmware team.
> 
> Bspec: 53188
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
> v3: 1. Make SWF_SCRATCHPAD an indexed register and move it to xe_regs.h
>     2. Use write instead of rmw to write to SWF_SCRATCHPAD register
>     3. Reduce the firmware ACK timeout to 10ms
> 
>  drivers/gpu/drm/xe/regs/xe_regs.h  |  3 +++
>  drivers/gpu/drm/xe/xe_eu_stall.c   | 38 +++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
>  3 files changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
> index ad93c57edd17..6ca8b1f2440c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
> @@ -7,6 +7,9 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define SWF_SCRATCHPAD(_idx)			XE_REG(0x4f000 + (_idx) * 4)
> +#define   SWF_EUSTALL_MASK			REG_GENMASK(6, 5)
> +
>  #define SOC_BASE				0x280000
>  
>  #define GU_CNTL_PROTECTED			XE_REG(0x10100C)
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index d37770c58c5d..311b0ffa1ab2 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -7,6 +7,7 @@
>  #include <linux/fs.h>
>  #include <linux/poll.h>
>  #include <linux/types.h>
> +#include <linux/iopoll.h>
>  
>  #include <drm/drm_drv.h>
>  #include <generated/xe_wa_oob.h>
> @@ -20,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_topology.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
>  #include "xe_observation.h"
>  #include "xe_pm.h"
>  #include "xe_trace.h"
> @@ -27,9 +29,15 @@
>  
>  #include "regs/xe_eu_stall_regs.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_regs.h"
>  
>  #define POLL_PERIOD_MS	5
>  
> +#define REQ_EUSTALL_ENABLE	0x20
> +#define ACK_EUSTALL_ENABLE	0x60
> +#define REQ_EUSTALL_DISABLE	0x40
> +#define ACK_EUSTALL_DISABLE	0
> +
>  static size_t per_xecore_buf_size = SZ_512K;
>  
>  struct per_xecore_buf {
> @@ -682,7 +690,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	struct per_xecore_buf *xecore_buf;
>  	struct xe_gt *gt = stream->gt;
>  	u16 group, instance;
> -	int xecore;
> +	int xecore, ret = 0;
>  
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -693,6 +701,19 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  		return -ETIMEDOUT;
>  	}
>  
> +	if (XE_GT_WA(gt, 14027054324)) {
> +		/* Request the firmware to apply the workaround and wait for an ACK */
> +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_ENABLE);
> +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> +					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_ENABLE,
> +					1000, 10000, true, &gt->mmio, SWF_SCRATCHPAD(0));

for polling can you use the function xe_mmio_wait32, which is more
appropriate.

> +		if (ret) {
> +			xe_gt_err(gt, "Timeout polling for EU stall enable ACK from firmware\n");
> +			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> +			xe_pm_runtime_put(gt_to_xe(gt));
> +			return ret;
> +		}
> +	}
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
> @@ -730,7 +751,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
>  	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> @@ -840,6 +861,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
>  static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  {
>  	struct xe_gt *gt = stream->gt;
> +	u32 reg_value;
> +	int ret = 0;
>  
>  	if (!stream->enabled)
>  		return 0;
> @@ -853,11 +876,20 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
> +	if (XE_GT_WA(gt, 14027054324)) {
> +		/* Request the firmware to revert the workaround and wait for an ACK */
> +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD(0), REQ_EUSTALL_DISABLE);
> +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> +					(reg_value & SWF_EUSTALL_MASK) == ACK_EUSTALL_DISABLE,
> +					1000, 10000, true, &gt->mmio, SWF_SCRATCHPAD(0));

same here.

Regards,
Bala

> +		if (ret)
> +			xe_gt_err(gt, "Timeout polling for EU stall disable ACK from firmware\n");
> +	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 9027365f0043..41734b9672c5 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -66,3 +66,4 @@
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
>  16029380221	MEDIA_VERSION(3500)
> +14027054324	GRAPHICS_VERSION(3511)
> -- 
> 2.43.0
> 
