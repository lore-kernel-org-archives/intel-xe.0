Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B11CC6B1C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E9D10F978;
	Tue, 13 Oct 2026 18:32:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E9510E21B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791916303; x=1823452303;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PTGkSF8SzdhOEN8sNBC7dQVMSQZ1p/WHiS1hfBXXnS0=;
 b=CLsDV6Dmt9VoXEyPIJMY7MvDJF05ZnWmusd6urA2xQMiBmc/l/GIGMrn
 SO/Nt82Gcj6hVrvHpsXP4GQkzWMQMEHf6wREEK8hBXTbiepDXUM8v4q36
 F57FynyghCKTjibHp6x3xMECI1rIJhkdO/SaCV8EQJHnR9CAc+kbD7mpP
 RREDaIL5cyrWTDh40NqKttPtgX+dzPyLLlgEr/O5mdEsWgosJkLLJaC4x
 Ebvs6cxAEluLnBy/kWMV0CpkyB6sRUECESG2FtEIr1ELGg4w3EDrW188I
 REAWg9h9EMVKjGjTKhS0vlhCIglk+lMDIw88Xd+ACsC2dIWCUNT+vhkwr w==;
X-CSE-ConnectionGUID: JNX3avG7SnqIOeij2Ux/Vg==
X-CSE-MsgGUID: nju8czwARHWB8KFBmBORSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="543139"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="543139"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:31:42 -0700
X-CSE-ConnectionGUID: ydd1KNvZRGCMg0FueENukQ==
X-CSE-MsgGUID: iQ/0c0BjReqJQiqpPqH0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1591060"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:31:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:31:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:31:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk2OWFDHvLjO3pVAcYW7UaSymj/l86S9EEcOSvLpKbczJ7P3jjr9BEb/nJ+9fqsQO8hdNLFWnv2s2XDbxKX4EPjilTwKRjP6ArdANxElZo5+be/iDNjmAoP7lk/lTYG0CiDgHvpXEsPvu/yJbAm0snxzJyeTRjWaW045AbKAsosRd8yMw8ClskPX8UdxIx4+m1dttXvgBxwODtFluvnSbV2K9nMVowv3bXppEErTgF+GH1K5mKWZYHTwXvS9HPfnYOvcH/FfItXyCopzOP7jz0/Db2LBeN4oJNZh911DSUHWUjnkdGhIZn3LjBUwxaaZhSWDzRF9hM/qGrzjfFSXoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=505RDfj6Kzm+TchEOewfVMngSu7DEysO6qFX7Xr6nEI=;
 b=QgAtW+N4mvtr0rAZZxXjpHeJXAZlBCOG+x1rO1ePzk0mWlDpZyrjgxFjJktp/epj5kJPKLE7kNgYmMlFr0zTMC7kpb323Yx3i1AlXn5Y/xZmt4BrUsqqoJfX5X7z8zucDGfg20/dTZ5TCI6LnydYFMF/rP0xBe9ngG+xVQ30jNZMqdhGtG/DVoT2HVYpeT3rNZCMcbmzJHn6Q5Cb2ZciwgrFwbf0KqOcMCDzTqDiNKq9CyuA1dveXrB+wlx/1t7p5QmLn1gbivqTRAOJ8SzPKu8hj18HrcT6GS3NvXLvJ2+zlyFNwg4qjjnwUsqGa2Iu6m/cYLMP/tIJg22Z5UeKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:31:38 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 18:31:38 +0000
Date: Tue, 13 Oct 2026 11:31:36 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <x.wang@intnel.com>,
 <jia.yao@intel.com>, <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 3/3] drm/xe: Synchronously wait for queue kill on FD close
Message-ID: <as55CBK7s3t0eMGK@gsse-cloud1.jf.intel.com>
References: <20261013023442.206915-1-daniel.charles@intel.com>
 <20261013023442.206915-4-daniel.charles@intel.com>
 <as2i2xPkEvDgAKFo@gsse-cloud1.jf.intel.com>
 <c52f2c3a-eb26-4978-b479-a2934d0555cf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c52f2c3a-eb26-4978-b479-a2934d0555cf@intel.com>
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|IA1PR11MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f112d96-be6e-4be5-ea70-08df29583826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|56012099006|11063799006|261009223027099003|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: pFK8f8eC3uaQj58Ww8twaCLomqHsRm23HiaYj2W5Qe94BXM4vzpAFFKSIsDL86GDb8I0OVtWpAWadi315XeP492TigLU2sGLMzlMUOGoApFAu4fl1VYfqUmRl8IoWw/0JQj/VWS35BvMawQwCNDbixlS/AcED/Xf+ySkUlB0nhMAXcPfW276hTALwqGvf+1ET2YTbnyIm1cgdIIoqOXBxTVEIZX+IqEtycCJxDzEx9lqsOVlVIVEW/+HLafdPHBkS2Teyh9wotcN955+55qS9n3wRx28Vf8QZ/41LCHa6NqcmuKGjM5o9MYH4GUjn4FQ0akteR8SLVl8IldtJuWQKdgtRlN7SKbDnCspRoR5+FsuCAcCPvXu3WzU8GjG3nlCOrIc//pR8C2W5q19aPNDCrwc9AB9/3gWuJFoI5X00WcC4u9v++J9XdeIiUf0BnUG0ECITwVTexWS2izLWhvLK6mX69QscoS290S6Rg30T1HYAyAm3kggZO9Cp2ZawjB/Can/MNrD1tqjmEwPCkxB18hXrlT/YkPYfTq1Bb1DMpSlXtg4l5sPoPSuGvKgXmJ2MZZGnujqT8l5zMy3LGHJDfRY9TD1unXUdnlGGBRPj4vN2oS1SjOY0W8llgVKuku0MKXJdpL+owNWaLM2cnoTJFF7GDUfv3SZj2zpOCAmWN8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(11063799006)(261009223027099003)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?empLZmFIQjJyN3N6Y1hSZkpUYUdwaklrTnVkZkRzbCt0eDFrQUdBbkhLMnk5?=
 =?utf-8?B?T0V0R1UxUGFSeTBNTWI4ZS90TDA0NU1mbmIvdzM0WXIvYXk0QmhwSHQvZWVT?=
 =?utf-8?B?NGpjWXZrejFTWmRLc21rREhMLzdwbDVleXZ6UzRwZ3IvNEg2N0tJWVVLQ2x0?=
 =?utf-8?B?dTJGd1hvTFJzVzhnS25aVVZ4S01qT2NKVmNYSnpLUitWRzJnV2grNjZhUWZC?=
 =?utf-8?B?Mnl6ZkdKYmZwUThJdHRNWUQ5SmZ6aWkyOEtoUGU0c2U4V3djS1cyMnhKWUR5?=
 =?utf-8?B?LzBJTUo2bnpXcmNiZTZPZmdsYWR6L0JLTTZyOHJ1REVWbWxkMXpOWjVGZW1X?=
 =?utf-8?B?UGZseWI4M0xUcmVwcXJDRGtqNmxvNk1vekN0RGgwODJqdVZVNWpsRC9RbkhM?=
 =?utf-8?B?RzMvQ2xITEJ0VndtenF5YVoxby9TcUNCZlZiSDZiRExsNTJjbVV0dG5HSXhF?=
 =?utf-8?B?SWJmNFIzTjdwMEJaYjd3Sy9zN2VvcE1QNGwyak5KZXpkWCtUalQxVmJFTXM5?=
 =?utf-8?B?YUdCSDJPY3dxWHRYd0VZV29QU0x6TmpaOGNWTFgycHp6NmNtSTIvQW5VRjdG?=
 =?utf-8?B?U2lucTQxQWNrM2NXT3R5NkRXdFdKRUNRekpUYkJZMTNVd1kvRzJGQ2QvckIw?=
 =?utf-8?B?Mm8vQXhiUE1XYVpITUdrSGowZ2VMM0QvYXJ3cHZpVlRaMFd5ZDF1d09HVlRy?=
 =?utf-8?B?N2UxbHFndFk2akVNVVNySEphYkJmb3hWMVJkU1l2V01TeVVYQWhCenNPQzBB?=
 =?utf-8?B?WEFlTWFUTExydkV5alpONjZTeU4vTGd0SU1RaXovaFhxUUxybmJWL3NGVi9O?=
 =?utf-8?B?bEZBYWJSRHN4TUEvWGp0Y0ZjRDhoMWpSSHpGNXQ4TXZscFNhalRQalNkaEYy?=
 =?utf-8?B?eG40WE13T2VuY3p5VTJtZjc4SWxaS1FseUhvMTRnMG1Qb3RVdTAwejF0d1dJ?=
 =?utf-8?B?MW9oSmF1QVFzeHU1MTJNelNxRDFOQ1phN0ZGT20rRG5Ydnh2bVU2QXZSV1dC?=
 =?utf-8?B?ZW5IaGxvV1daVHF4eVVrOFhjSWNBTHJZMzJycmJXc3NVNzljK2hGZ3dYVXVC?=
 =?utf-8?B?N0gyLy9hNGxuZkdGeVdiQjJBMFpkOEJDMGZqS3VOcnBGT2htWDlBZkp2c1lG?=
 =?utf-8?B?RXBITUxBWGtKN1MwY2N3ZjlmaWZaZkl5cmx3aW56NDVIdlJ5aEsxUlYvdlFR?=
 =?utf-8?B?TWxBMkJkZkxUbXVSZG4vTjk4aDZpcXFsSlE0SzFqYnIzTjVvVzEzM0w0NW05?=
 =?utf-8?B?MVFFWitjTlN0TGtmVEY2YzRzc3ZYdjFrU0s2UWlqZUpyZXlWTW1hbU9yQnRw?=
 =?utf-8?B?WUk3cG5RRTZKVjRkUGF0cGFoNG94M3B2YTB0RHlnaG04OXFObVZlSDQvOHZ4?=
 =?utf-8?B?d2wyb2JtUXpkVjBQZWNzdmp5MVpJTTUxRVozdmNJV293clY2ZXIyM2JaNnI1?=
 =?utf-8?B?VXRzLzFnTlR6UnkzbysyRVh6ckdsTE9BTy9GTEx5NWF0cVB5N2J3UWF3bFB5?=
 =?utf-8?B?OFNwWHd3dTVoYjVseEZYMVdZTTlmSVBaVDZBYS85dTdsRGMvdXlDRklaNEgx?=
 =?utf-8?B?SVJ2dXArNzdhVXN5OHpFQkZpZy9QZXNPeDJhcng3U1owcEMwRmZHSTlzWHlQ?=
 =?utf-8?B?SXFxZGhUdW1EcnJzQXdTVnhSczZYTWxZR3FUcnNXNk4xQWszb1M3d2Y4VUU4?=
 =?utf-8?B?dHlJSXFIN2pJc0czR0dMTkVFbmo2UmFCOGFocFJnMWhhV1Z3WmFjRS9LbmFF?=
 =?utf-8?B?bVFMb2R3djk1KzZQS0lDYjdGZTllQUxXVHZxczc4YzhHZHpHSGFZUldTZWUv?=
 =?utf-8?B?ZXBqV2p6WFhJK2lLWGdnS1lmakNWeUxpbE9KcGN3WnppOXJUN2RSaWxhQ3Vv?=
 =?utf-8?B?dHRzNmIzallBVDFXSWFwaXdLb2JRbGQ0bDhaNC9sbXFac1RJWUxuSE41OCs3?=
 =?utf-8?B?bitaZS9FVGFWWi9Mb0VsMzlyckU3aHFWRzdmcDNEcGN0dXgxRnovTTJ2UXpJ?=
 =?utf-8?B?NnVHZlM1QlZmWHhvUi9JaFZJU3JwTkpRWHUzcitTdjNQQ1FJWlAvcmVick5W?=
 =?utf-8?B?UjZJZk80TmMzeXRRa2FPcnpjemo2Qmdnb1kxaHd5YnYwQi9nSEZQbnBRSVlI?=
 =?utf-8?B?Tks3bGdEbEQxRDZZUjF3KzFqNVgzcnBtajZpc1NRRUhYL2lnZ0JScldNcGVR?=
 =?utf-8?B?MXUyOTFIblpzYUF6eXVOcUoxL1lsWCtRem01bVFHa3llb1FvM2FlcVMxQmVl?=
 =?utf-8?B?bDZPTDdoVzhNYUF3TGtUa3gwcUQ1N1N0akNZa3Myb3ZrVmo5V3g3T3FyTk9t?=
 =?utf-8?B?dnA5ZXNVTnAyMnZSNVZXakxDZmNST3JFZDlGQ0REUDFMMUlLMC9mS0M1d3NY?=
 =?utf-8?Q?rEeqLa0Ouqdy9JS0=3D?=
X-Exchange-RoutingPolicyChecked: vsY3HK52ggrffA7DDTdTIw4WkXB9HaNBJEp9hcg4AcZHIrF/+SGXqaQQZIeqssmwJF2UqGob36ju586o89u3Zv6t2xeDTVnmnN9naA815RRLCKpyd+jBcbFTjxYIEPGdoIeCj9X5CiFDep2l0gv7aw4C2KRQOd7PJ1cm14bQfICfyCEltg/slGcHdVi2bgsIO32XRagUe3iSxYpn9luiOK9Prz52Nktd7W8iUM9FhF5X2i83pO9IOws2TVuY7ei3AlbQmz1JbfgtAeXbGYnKBXlXsOQpAKnoTqpgBdIG7DxFofTrE1iCprKBY7WR7XFriLqvxLv7/ONha0tYOvT/ew==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f112d96-be6e-4be5-ea70-08df29583826
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:31:38.7136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJrLM6bT47UhJJaRyc6VimFCXmeqAJvxm2jgUVB7Ii5qqcAl2ozslaeXoP2w0W9Y05bgqiVOtziGjZS8uyz4sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
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

On Tue, Oct 13, 2026 at 11:11:48AM -0700, Daniel Charles wrote:
> 
> On 10/12/2026 8:17 PM, Matthew Brost wrote:
> > On Mon, Oct 12, 2026 at 07:34:42PM -0700, Daniel Charles wrote:
> > 
> > Thanks for taking a look here.
> > 
> > > The early KILL message disables GuC scheduling outside the serialized
> > > TDR path, but xe_file_close() does not wait for it to complete before
> > > dropping queue references. GuC may still schedule contexts whose page
> > > tables are being torn down, producing CAT errors and engine resets.
> > > 
> > > Split FD close teardown into two passes: first kill every queue so all
> > > KILL messages are queued in parallel, then call the new
> > > xe_exec_queue_kill_sync() for every queue before dropping references.
> > > 
> > > The GuC backend implementation flushes the message worker while the
> > > static KILL message is pending, then waits for scheduling to be
> > > disabled with no pending enable/disable. The wait also completes when
> > > GuC submission is stopped, VF recovery is in progress, or the queue is
> > > wedged.
> > > 
> > > Wake ct.wq waiters when a scheduling-disable SCHED_DONE is processed so
> > > the waiter is woken as soon as scheduling is disabled.
> > > 
> > > Assisted-by: LLM
> > > Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.c           |  8 +++++-
> > >   drivers/gpu/drm/xe/xe_exec_queue.c       | 13 ++++++++++
> > >   drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
> > >   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> > >   drivers/gpu/drm/xe/xe_guc_submit.c       | 32 ++++++++++++++++++++++++
> > >   5 files changed, 55 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 8392c9fad3c48..ffee8951a7b4e 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -190,8 +190,14 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
> > >   		if (q->vm && q->hwe->hw_engine_group)
> > >   			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > >   		xe_exec_queue_kill(q);
> > > -		xe_exec_queue_put(q);
> > >   	}
> > > +
> > > +	xa_for_each(&xef->exec_queue.xa, idx, q)
> > > +		xe_exec_queue_kill_sync(q);
> > > +
> > > +	xa_for_each(&xef->exec_queue.xa, idx, q)
> > > +		xe_exec_queue_put(q);
> > You can do the put in the same loop as xe_exec_queue_kill_sync.
> Yes, I'll fix this in the next version.
> > 
> > > +
> > >   	xa_for_each(&xef->vm.xa, idx, vm)
> > >   		xe_vm_close_and_put(vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 9a8efa2bf2bfb..8ba2cf45694dd 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -1622,6 +1622,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
> > >   	xe_vm_remove_compute_exec_queue(q->vm, q);
> > >   }
> > > +/**
> > > + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> > > + * @q: The exec queue
> > > + *
> > > + * This function waits for the backend to finish stopping the queue after
> > > + * xe_exec_queue_kill(). It is safe to call multiple times.
> > > + */
> > > +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> > > +{
> > > +	if (q->ops->kill_sync)
> > > +		q->ops->kill_sync(q);
> > > +}
> > > +
> > >   /**
> > >    * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
> > >    * @dev: DRM device
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > index e8963f85cabd9..4be023b9a4c6c 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > > @@ -119,6 +119,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
> > >   bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
> > >   void xe_exec_queue_kill(struct xe_exec_queue *q);
> > > +void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
> > >   int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > >   			       struct drm_file *file);
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > index 48c05398b0168..4882eeccb9bd5 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > @@ -294,6 +294,8 @@ struct xe_exec_queue_ops {
> > >   	int (*init)(struct xe_exec_queue *q);
> > >   	/** @kill: Kill inflight submissions for backend */
> > >   	void (*kill)(struct xe_exec_queue *q);
> > > +	/** @kill_sync: Wait for the backend to stop queue scheduling */
> > > +	void (*kill_sync)(struct xe_exec_queue *q);
> > >   	/** @fini: Undoes the init() for submission backend */
> > >   	void (*fini)(struct xe_exec_queue *q);
> > >   	/**
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 609af66b343d5..36c8c3766f5fa 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -2267,6 +2267,34 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
> > >   	xe_guc_exec_queue_trigger_cleanup(q);
> > >   }
> > > +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> > > +{
> > > +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> > > +	struct xe_guc *guc = exec_queue_to_guc(primary);
> > > +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > > +	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_KILL;
> > > +	bool pending;
> > > +
> > > +	if (!exec_queue_killed(q))
> > xe_assert(xe, exec_queue_killed(q))
> > 
> > ^^^ This is a caller invarient.
> To be fixed in next version.
> > 
> > > +		return;
> > > +
> > > +	do {
> > > +		flush_work(&sched->work_process_msg);
> > > +
> > > +		xe_sched_msg_lock(sched);
> > > +		pending = !list_empty(&msg->link);
> > > +		xe_sched_msg_unlock(sched);
> > > +	} while (pending && !drm_sched_is_stopped(&sched->base));
> > I'm honestly not quite following the logic above, and I don't think this
> > is necessary. At this point, we've already queued a kill message. It will
> > eventually run, or the TDR will fire, or a GT reset will occur. Any of
> > these paths should eventually clear the flags below.
> > 
> > I can see that this was LLM-assisted, and it may well be smarter than me
> > here, but I don't understand why this change is needed.
> 
> The loop was intended to ensure all queued KILL messages had been
> processed before tear down continued. As you point out, those
> messages should be handled through normal processing, TDR, or GT reset.
> I’ll remove the flush_work()/pending-message loop and bound the
> scheduling-state wait with wait_event_timeout().
> 
> > 
> > > +
> > > +	wait_event(guc->ct.wq,
> > wait_event_timeout
> > 
> > A GT reset saves on the GuC taking a nap but that is unbounded,
> > wait_event_timeout gives us a bound.
> What is the best action when this wait times out? We have no confirmation
> that GuC has stopped scheduling, yet xe_file_close() will continue
> tearing down the VM. Is it acceptable to continue teardown, or should
> timeout
> trigger GT reset recovery? If so, should we queue it with
> xe_gt_reset_async()
> or wait for it to complete with xe_gt_reset() before proceeding?
> 

I'd just queue a xe_gt_reset_async, no need to wait as things have gone
badly at this point.

Matt

> -- 
> Daniel.
> > 
> > Matt
> > 
> > > +		   (!exec_queue_enabled(primary) &&
> > > +		    !exec_queue_pending_disable(primary) &&
> > > +		    !exec_queue_pending_enable(primary)) ||
> > > +		   xe_guc_read_stopped(guc) ||
> > > +		   vf_recovery(guc) ||
> > > +		   exec_queue_wedged(primary));
> > > +}
> > > +
> > >   static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
> > >   				   u32 opcode)
> > >   {
> > > @@ -2744,6 +2772,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > >   static const struct xe_exec_queue_ops guc_exec_queue_ops = {
> > >   	.init = guc_exec_queue_init,
> > >   	.kill = guc_exec_queue_kill,
> > > +	.kill_sync = guc_exec_queue_kill_sync,
> > >   	.fini = guc_exec_queue_fini,
> > >   	.destroy = guc_exec_queue_destroy,
> > >   	.set_priority = guc_exec_queue_set_priority,
> > > @@ -3423,6 +3452,9 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
> > >   				clear_exec_queue_pending_disable(q);
> > >   			}
> > >   		}
> > > +		/* Publish the disabled state before waking kill_sync waiters. */
> > > +		smp_wmb();
> > > +		wake_up_all(&guc->ct.wq);
> > >   	}
> > >   }
> > > -- 
> > > 2.43.0
> > > 
