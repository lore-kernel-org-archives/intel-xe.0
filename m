Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D0BC531C9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 15:21:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85A110F40D;
	Fri, 24 Jul 2026 15:21:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FK24qsuN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A9F10F40D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784906489; x=1816442489;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=K+tZKmt3Z/AZkokr1dPakICUe7jW2YkS7IOpOBVVHpE=;
 b=FK24qsuNpXl74ALwqn+gHz2yLSxZLJZSqNpzBViPQzZpKQZqMd6So8bl
 E5mp9MButid31UtNxO++vMvHvzNd19+mGM00xPdb639Q7/LBUbYp8sG2b
 SS5SvJK1LjCFxBsaSJwzPaSphBR0dzxXBQKy9ytAuYI8yursgIIV+L85G
 iHCHy5ylhxMakZqpDGFjvD27VIIFQi+2ExU8P/Vl54BcbUWBScqjxksHH
 G7d53vyE3WAMIgcIzw1Rrk0+64zzJ28JlObGm8cRnFudTaISSHRjzE7XA
 739vdmIf/c2EIBC9OFHT6e8qZNnUMFRrubf5thFClMLiBkjxnT2BVpcBX A==;
X-CSE-ConnectionGUID: gFuqoULBTc6DXpxp98j7cw==
X-CSE-MsgGUID: r3q1KU8+QAGHhpO9HKEp4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96947234"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="96947234"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 08:21:19 -0700
X-CSE-ConnectionGUID: DO8qbD4ETCOeFQFUCF13fQ==
X-CSE-MsgGUID: U/C1MrgaR0q/gOPs2WowWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="288708683"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 08:21:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 08:21:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 08:21:18 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 08:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOXoNhG91+8E2kYdIqsAM+0NC6twsjBHVVpEnaT7b3AYWPIEU3RLVhCLM4M2Ds+KUCJeN8UUa6mKGRIl3FZ0LziNyBcbpKEwEQ7z8788K8BtMLW7gGxsQgxz7OfUx4GA7NlunBZmDKPeAFZ59vayK5DpmDaadXFYJ9hYc+dj/ivqJab2NXLEtQkyWrEDCD/DFD528EECsOXBFFr2MopNyXQFqDwabxczZqfo+oXadSz4Y0e1pyJuN9S5/XaZT6Q0LjNawmqL4nGSxQGcf6T0FRiRZEcittHV5695wpISE4s+KqY9VeYgQJzb+53NfueMwgfeA7TMEKpUgMUYG1gwog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9wJYlh72nBWPShDGAVD1OHVPFMXkM6BBMsni3KGYP0=;
 b=mJ6LD2Mk2vgseCZ3ODPlISqL3k5J8T62uN17XJ/j/XM5mauD3Qy/HB7CiGZ7aN7PoPxDPeCz6JHTt4Lk15+XWP6jKik4Qv3YLBDEO9f1vDOcmXn7QuWMb785KgUSqwkn1sCa2I7f8/j1ZT2KWo1rFtsMPT50bl8HoEIdrowQ9/AZL3i6GzPXArE8GVRgEEeU9NrFB4bn4PXkfQo02uqi26AKcP6pKsBtx1XeHjhNibxNgoKpJF4UlWw7V+9rsySmEQomO+0ou602lFvVYF9pY7+2Lgz/3dZ9ni9ibkiXrWRfZMOzu556jxHz/FAysIngWFxt/291Tlvc0iD1Bgj55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 15:21:16 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0245.012; Fri, 24 Jul 2026
 15:21:15 +0000
Message-ID: <3181ed06-f4de-409a-9030-221c7c83cea8@intel.com>
Date: Fri, 24 Jul 2026 17:21:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/pf: Allow valid doorbell configuration
 during VF provision
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260724114939.1560743-6-satyanarayana.k.v.p@intel.com>
 <20260724114939.1560743-9-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260724114939.1560743-9-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4914:EE_
X-MS-Office365-Filtering-Correlation-Id: d9bac956-6b33-4249-d93f-08dee9973432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|10067099003|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DGkvFLMQJjWPyB5a2SHGdxBupRyTmDkuVfqxZFBQNRpVpEmZMqxvpjmDHpuao8o1T0yAorkjkKD5eM+iSBWu17EFoqg1WIgBOQuOMs8mRPjr2+PQlRv0uVr0slkpuhFQixxjNFvF7lIBhzvz/OVuzV0Y949Y6hkpq/ST6yyx+p+yHCJYj5yxgyNNE3wedW5PIvxHnY8dPTITAeYKbY78dIxOkjtnLvSIgkBFscZTKQIHN8Av06pn41Cm2+DzSIVUlQ64L8fl91YVb/8beifJKUe43nd7mFGDPbXb7cohZaOVfR81cEJKuRLXBPObhvC0v/1ZhdbivMZafOK8US7RR6JfHIXQoYZLQYDxU3I5oshrUT4AV/TuplclWK8B0wI8IJxsK58Thxwmk3nbp9H51DXRlyYtQy+FimUkx/mnvO/cuIHYcmkkclqIrcoS8PIeDAFO7nC2v5PJBvLSgndTxgx3DW6hkxS7iqPjAJP2VSMetyZaxB6CdZut/wI6rMzbkDw7Kg/JbsKn5TjZpV/Rd2ke89EwTqhF5X/wM/B7dzvWJMOFIvzIN2IZG5DKoT0AHf+qF9PVk2Jy5/7LUCxo9/bJ6/vZ4vgu91Fa3x0V+N9Eq6cYH3Z7Zb7NkARCkGHFZ+uZt9biOu2cO7k4guQmeYG4NVI/C5CvayyfcmyxaFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEZZREZxeVBvcUF5SkEwTzVJelF6MkZkRWVZdyszR1k3QUwyYW1qdzlORFdY?=
 =?utf-8?B?enoyK1p6RjY0bG1MblJWOUJxVGk1U29BUnVDLzFUTkF3UnFLL09UT2VNRGpJ?=
 =?utf-8?B?Unk0REhNbm9oRUVISHlaeXlrWHZwUFYzRlg1SjVTS2MxT0NaWlNLNkpJWlJy?=
 =?utf-8?B?amZBYmM2S0ljZUMxNG4xMW8yeWlWdGJoN3drNTlCZE9Wb2s5Ulp1UlN5RlJF?=
 =?utf-8?B?MklDSllKUkROYlV1RWhQTDM3TzdROWptUnRsajQvV2t5MEpab0pOamIwbjZn?=
 =?utf-8?B?eGVTUmV5Q1I2cTdkWXN0ai9pN0trelRyUVZYSUNLUmhEdVFNT1F0US9IaHZV?=
 =?utf-8?B?RkpVSllRSDJwejU2emMrSHVuNkQrMk5rWUV6R1o5RG1iZ1FUVXdQdEZtS1J0?=
 =?utf-8?B?Q3Z1QUlBeVVtbXpyTHphWHMwTnY4U1VmUnI5QWN0bS9jMWM3dEZFRU5tN3h5?=
 =?utf-8?B?aVQ1RnZVYjRKa2h4VmZlemZLMytHQ2dTdUdZRjQ5cEdEU0gxeVhHcGJkdlpq?=
 =?utf-8?B?MjBZdEd4UDNId0JTTHhrS3hwaVR2NXNpbGFsOXppbWR4UHBOYTdIc1VRTkJM?=
 =?utf-8?B?a3VXdTJCN0tqVXQwVjNSYTNQSWc4cUdFa1JHZ1ZMdlM5Mzc5eERtR0tYZ2tw?=
 =?utf-8?B?Z2wwNUszYXlveVUyeE9oU1VWUjlMc1pSbUh2R01DQStFdnY1emdBYldMTmJ3?=
 =?utf-8?B?TUFXQXJOaFlZY3lacE1rSjBnbWFBS1RmQU5EcTZOL1V2MWhTQ2JLVlBWeWN2?=
 =?utf-8?B?TVlhWDFYZmNqVVFYUUlUZzZLOWZLOW9TWjluNXpCayt2ZEFPY0NmbFZIQ0pq?=
 =?utf-8?B?TEZaV1FYeGh5L0crbk9CV0dqOGhwMEo4OVRDdVRZRlRBcHVZVnRLTnlLMnBv?=
 =?utf-8?B?NUdQc0liblkzUzJhZXo5SC9Za2t1QjVhYW9hemFRdnQvbGJodk5YSzZ3Q1JK?=
 =?utf-8?B?d1BGRzc1Si9yVThhVjJoVWprelVFSXg3K1UyM3hoZkJDK1I1OXBBTHJPa0hB?=
 =?utf-8?B?blZIUmtzNEwxWUdoT0VUMmlSb25xakNmSjI3WVQwZnAzM1BsQXVqNHRxZFo2?=
 =?utf-8?B?eWJxdGFFaTZFREIxOWl4YnJGNkU0MVFGSlArUWtUUHhoaU9rT0RpblI3MjF4?=
 =?utf-8?B?ckw0bkRKbWw2QjJYdm5FWm9FSmhMa2dRTUpUY0duNUZZRklKZGhFQ08rOW5H?=
 =?utf-8?B?b2lkS3ozc2ovaHA1UzRLNmVuTWlZNFU0ajlhbXY2NVdjVVVVTXZ1d3hHZ2xB?=
 =?utf-8?B?RkgrMk9lUi91TW1FNEJJV29maVhTOE9qSDJ1VDZWN2lpNzEyazNJdGZFL1hx?=
 =?utf-8?B?Q2NiOGkxS0lOOVlsUEs3K0lPZ0ZvaUlXcmc4QzRmaUZOdExncEJnMGpMRFRX?=
 =?utf-8?B?VmRpM0xDRHhiV052SzJ4T1pSVWs0cU9sQ01VZzlHWWkvNWwvcHJKNjIvMXR2?=
 =?utf-8?B?dzY4S1VWUURIWXpOZTVPbFdLczZaQS9aZ3ZMSnJnR2NLZEx0MDdkRWVyWGRW?=
 =?utf-8?B?bjJ5YkMzeDlQeHArS1ZsQmljZDZIVUJ5V1k1MVJ5MDBwZjNWeHRYQW9zb3lr?=
 =?utf-8?B?Q1JoUnBzQmVUYnhOL0VoNTc4YzdyNzRXeVBiTlNzemR1Y1V6Y3JCT2JqNHUx?=
 =?utf-8?B?NEJXS1VScGFWMDI1TzZYWFVzMTAzUTNUdmdmcTJyZCtrejlqVHFaRlp6dk9T?=
 =?utf-8?B?MEhsK3R5Snc2QXpYRFVKWDRqV3NxMG5ET3VqempzNjFvYllid2wxUjVhMWVp?=
 =?utf-8?B?TW5jZFNzN3ZNVkkrQjlKYzR1OEZjbks0R0lMSHArTGpTcnQzUkw3T0F1c0pn?=
 =?utf-8?B?Z1MxcGF6QWF3Q0Q4OTE2SXdDQTJ0a2FRZE1qNFF4Rm5BOTQ2N3NPNzNWMVZz?=
 =?utf-8?B?Si9VWmxpRE14L0F0dVB3Vjg0VWdQQ2FOMnd4VHh0ME9WZjZwTGxJdENSOG9R?=
 =?utf-8?B?VTVYSGxIeUJ0S25kU1pyaXlVbWY2UUx5WmdnYnVyQXFBTDVtSnJjU3BrNjFx?=
 =?utf-8?B?YStWcFJxaFVRWlBKTms3NXlhSzdLZ3NoY2RkM3oxRk5OVkxnWDhGN25PbFZM?=
 =?utf-8?B?bDhsbEttWE5RSnliTnpUQW1URzg0Ty9pV2syY2I5VnRrVktGOElpd1B5U0Jw?=
 =?utf-8?B?d0grWmsydklTcGRLNnZ3bjlDTnRNc1hFbTF0Skd6ZkRQVDFDRytETml6Uk9N?=
 =?utf-8?B?dHBQUXNPMnp1L2tid29ubzhMWll6WmIrc3JXMnd1N2l1eGJhUDhrVXhqK0tG?=
 =?utf-8?B?b0VDZ21TbjJUd3BFOHFDUkFoMGZna05NeWtUZUMvT3dNRFRYR21UM3U5eERr?=
 =?utf-8?B?bVJIK25nVHhVbi9UWVRZZDh5aDJxeWdNWVU0WCtoQkUyVkNVNlNHV2JTbVJy?=
 =?utf-8?Q?VqvvvM/mdF14FOgg=3D?=
X-Exchange-RoutingPolicyChecked: UrND1oQNIaI3QbWgFDO4ctanUCp8T/SfuTy2E/3+j7pw6yGdyZnQwlxVkSZ6564p3d9U8CDUVpRc+a7iuQFW2cOqYEaCtpmOuG8Qt0Pk8q7OEftfNgXIh73IDvaPMYrnlth2m/1uL7RfREOwf57Oe0jBmnpOFV+7B1j4l3tKY3z8Gf+mhu+ay1/4G0mrqmqvb5oHJDHoTs0VIwsop5h3RGw1DzyDwddQLP/XwCQHVj1VvNczXZO9cWFEkdxY4ptSdioxnYgmZXtdjeb6KM5HhavHnFJaE+A+KFty/qL6/gV2THBeCwJvBDhNgSEsH1g2suesFlFZTiwd1Ne3GvxumQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bac956-6b33-4249-d93f-08dee9973432
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:21:15.9336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vTchVNAS/FCrF6PH5fgCcFcsV3g1Yqqua7odL09R8gN9RuObRd1GltdATiVJ8na+jDoQLlXGiNfQ2ZOmiqk1bflgkurSG1VwGtfA/MUu8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4914
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



On 7/24/2026 1:49 PM, Satyanarayana K V P wrote:
> VF doorbell provisioning must stay within the valid range accepted by the
> VF configuration query path.
> 
> Fixes: ac6598aed1b3 ("drm/xe/pf: Add support to configure SR-IOV VFs")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> V2 -> V3:
> - New commit.
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 2c9b85b84b1b..be67731c66e0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1263,7 +1263,7 @@ static int pf_provision_vf_dbs(struct xe_gt *gt, unsigned int vfid, u32 num_dbs)
>  
>  	xe_gt_assert(gt, vfid);
>  
> -	if (num_dbs > GUC_NUM_DOORBELLS)
> +	if (num_dbs >= GUC_NUM_DOORBELLS)
>  		return -EINVAL;

hmm, in general it should be OK to assign all 256 doorbells to a single VF

maybe it didn't work for you because on CONFIG_DRM_XE_DEBUG_SRIOV we reserve 1 doorbell to PF, thus only 255 remains available?

but then we likely report either -EDQUOT or -ENOSPC

>  
>  	if (config->num_dbs) {

