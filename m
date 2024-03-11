Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AF1C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 16:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA55B10E1F5;
	Mon, 11 Mar 2024 16:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5dca29n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEF810E1F5
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710175440; x=1741711440;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6/LBF9SqcX/UV0wvhfeXnNDEUA435hp6YtE8fOxl8KE=;
 b=O5dca29nesj9ty3T/cmhLgyD72OEqBvHISlrgf66cvxqObMLZ5MJH3WI
 2uOK4cWKOL7omJTTaZVaydU1trycNNFQbYf4p8nqVQN/4lI/Sn4/tPGFp
 f0cz95ddZJTv6guvTcz5FiEHaZXF8TKQahA8HHVPsFCFwr4voHQeoWTT/
 +HRXiGVi7/b4E2ny/DPPaW9N+6CB8R7/KiRJ9yLA1YTML545iyMwiusr2
 mMlweA6qcYaFbbr2jUxOjxjwW27Xcn2peP6PIXCdSg0EDYc9riiLuLR9j
 5jJ13Gd2kwpZByRKnpcoUPf6BhkcY47tviOBy4kKF7lrLAam4gMEZPik1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27320687"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="27320687"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 09:44:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="42200592"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 09:44:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 09:43:59 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 09:43:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 09:43:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnzoDb/EW931FaJQ/KQqr5aYNpev3Seuq7k/87VhnXenTDTLVJYx0cgOFGahktZwHburYwxGyGfvdj7BjGmIs10KJNQXUrMhCh+8sg61DIZKPn0XNVTStpuow+EttxDmbtYDSP6r5HEEfR8iNArY56Jo/ycx1XiX4aAlET3H8FvYytlol79Oh2Cx6ce7UVj3X74npIA39iVn97MwhyuB2UDfEst9WE3T5sdxK6qel53pie86c6sqRmItK6aJnW0OfwOWByOvhMwZ5KCWVcas+ZAvi8a2kUPi4G5IAx+IBn2ubXjLbKTbwrq9gnj4OICy78C6pPMc0UjViBFCjsDmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyAkfwi9yxlnafA0HLRkFmCrvytZhjHLQO/uletm2oQ=;
 b=D/ZMzVP4aN6KJYyIjM9hTMPcpzbybtVkEHfplgmKrIZOLpjZep3AjaULWF1J3DAtpqEx6nFMe5iYeToKlRQ1CerCYXyEKhMYVP4Bw/+fBnvGX1unbgGNwtTGQio7+Eu6bbhaZt5DpCcYjee6faj2WNNBSy2Enoy9sVrsLS8B25CrRbEgldpl8aP0xkrryvPhcjInfPdN6RTzHdzAhPx/Xu2jNonJxM4DjNKefacI7q0GGiXYOs0pCzpNs88y47rhDZ2DWdgEQgGnVgsswchgbcpzQ1afX7VK+4fEzcE8RuWUdE922Xyom39KIUUvBUjYUKec96nVu+rkwNaF/9pkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.21; Mon, 11 Mar
 2024 16:43:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 16:43:56 +0000
Date: Mon, 11 Mar 2024 11:43:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Remove unused xe_bo->props struct
Message-ID: <5h56xqyuxiyspqklvqt4zzo23hgaqbevi6wt2bqimw7hnlfdlu@yyi7wlzmctxo>
References: <20240311151159.10036-1-nirmoy.das@intel.com>
 <Ze8yWTmHYScFSpax@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ze8yWTmHYScFSpax@intel.com>
X-ClientProxiedBy: SJ0PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 104506ff-b7aa-418b-144f-08dc41ea718a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvV5hGE+Y8ubCJiEN8Vi76PYpluPAPYrCb8dvoVpOPlccDkPfNXSTrBJGVRe5Y/LKmpVvO6Kxd2pimHaFCLUm7+4Y6a1MEY/71EujL8RUkEzAtyqyBQDo6265wZDjXpRiOWko84OSwv0Zskt0Dsbe6xPYmGgossr2GSf/hW59mLfAo4et65zTL9348ne3pk6X/UfwbwEE6ZhcGjzlbjc6/CSML7j/JjWzc9uj/8SMeP90tE0w3qErHj/di9gon0hO3Klug7pCiJT5F1yG8mW9dD5JkiUrBq0k+K1OOciLPVrcR/BUatSO1ZWEQscEpDfVJF0pTZcbQElcn912Eq47CcfEC/5bosi0OtqXRXBT3W/3ypOJw/T02Dbg2oOIDFp57h758q05Dby1kxQqp1N08uYgqeYtUI7zRc0vQ7Q9KbH7xoojFouqNJSf0PmxP2izN7Ypox69aevbNVZKeJrtnGOIQgQEu0t1v/ucWhakdNGrnWKN1yUObfLuorZJEXK+UwI/lQpbOl0uar3Ydwf72b/H3Xe2ZTTXCyJ1NB/KS8pYYJf05eXdY9L/QUOOOiKt5UhJS4wiRWDkF3TGEqoWJJL/SAOl69nCfbB9DMT2rMzwAgM098oL/CPwAaebjS8O8Kj+L9Z/LR1ol+XBfH3bE92kjPVWTLgL8Ox8Hy0mBQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?z1VundnFk8Tj5N3O2tnIeaMrGGhMZx+B2j27cYoRAWVfFMKsGQSQY3AB6C?=
 =?iso-8859-1?Q?Vgrtbwic/LAfHqSLv+i1T3LAqlUS9xhZTiHz6B/JINliDtxH2mXudsiydd?=
 =?iso-8859-1?Q?Wbs6OKHLDgtceO9PQVaDYbAxbcgb2NZlZ3NF/dvYq0Bw4fxw4QLOIeTQpr?=
 =?iso-8859-1?Q?uOw4k/ubsDpeP5q8Lsp/PyOgQcfJ6VYp9ePPYc4UKqqym8BBvn/2w2xb9a?=
 =?iso-8859-1?Q?zC1qy4lLAp9fWaZoxKU0A5KYN7XZY/lZoEXVoNusSSmIHaiWCOZKBxrlm+?=
 =?iso-8859-1?Q?g0Kzv8ujG9XSohDp8gNhJagaLNW+hla/0QYWd52Bd9Dpt+fseSJMcZipUd?=
 =?iso-8859-1?Q?mWQB1Soae7Z5jFItpCaV7fVWf1l7j6sAd5/iouryFgoImqsRTTLTqT3XLu?=
 =?iso-8859-1?Q?jk5eZl9glQYeRFw9fsVQQBxqiVpWoGSBEKs6q3xIqbVzFgjAKX6/MqXf/J?=
 =?iso-8859-1?Q?p90qMK6FAvlO4+SuSgv5RFOWidx/eKNCNYm+xi9YFNGo/ni0Hw3idgPWoI?=
 =?iso-8859-1?Q?oreosvJ0bt+RCsXjIDIZJIS97PrzXsfe53UCkB9ibDY6TiiJbnUGcJ4dOI?=
 =?iso-8859-1?Q?ao9Zj/Mq/cNH9Ol3mlRBrh39/UBhKu87jq4yX2ZG0Z1Vt6mE2u+QeuB280?=
 =?iso-8859-1?Q?J5JzTkvifb0rqejopL8N9m2xBQuGQ1dy6NrCIATipGuFEV+ukZ6WettQn+?=
 =?iso-8859-1?Q?lAZuywGgrLCXEFPNJTQ4FIYK6VRAlhHbQNtcPDgQJ+UbR64cO6n+T6ayXY?=
 =?iso-8859-1?Q?GvvzdJP3J88RTQOvTTa/o9OH0zKmeMNG7p74ypLUX4gmOXIurEsR0Mw0Ri?=
 =?iso-8859-1?Q?t4hu5crxP3l8ZDS+AkC6NAiwWLmxKGEPcJ1EFWe0EKK4dKhIuwEhIbfQWq?=
 =?iso-8859-1?Q?1QwDhR5C4JMHSMXjVnqiCjxeVLyzeYWar00CN4PfWNnkyv/S35M/hn6MG6?=
 =?iso-8859-1?Q?/EVd8CMfz9YnaEUg1GNNodIsrnP7b4VAsP3ciUb0GR57ol+ku16fS/EdtU?=
 =?iso-8859-1?Q?i6jrf/WOtiEGvkuN4zfyepp7sVKcz0w71de5bipYbv4Svi91ND5b8cDZSs?=
 =?iso-8859-1?Q?dm5bubEoOsf/IGs082euNdC7IGjd1AVX7rkkOOpYcDJ19zCO05ANXauOV9?=
 =?iso-8859-1?Q?5T8BNM3o4BROrP1CQpYHZhAKAV000movfPULHIQkz3wN0nxHKPSCx22QCQ?=
 =?iso-8859-1?Q?7FFzqjr7UA8Hj4rTG4jU2mjn58iJ2ZjleMFwyuCkbSKyhXcb1GSix2SauF?=
 =?iso-8859-1?Q?kTvrQh2GRdZv69fR2RK3OA1i3NsYK2y7p44CqCmVa6tNi9FV/f48IqYmas?=
 =?iso-8859-1?Q?sEEyX7gvJ7lrXrW03FGq/vg3oyRx3graC+LSpMenqKutysoskP849etSLQ?=
 =?iso-8859-1?Q?ja1XGDOAy1l2Eb8v+nYEI7J+Wf+FDJeXCAp2sa3A8J9mu/McTlIV+YQuxb?=
 =?iso-8859-1?Q?fdR05glFBMDlTyiCh34NmhQVpdzjzegK/RZ6ZR7GQLG6o5FD2x9g7HF8yO?=
 =?iso-8859-1?Q?zmsn1dbjRRWUpACTfjrGZIJGy51vCRC/DXRORKP9zl0CRa0Zv3wM7p5GiI?=
 =?iso-8859-1?Q?YkKd9Mf0xBVgW906gHzis2Ox/5kBNmpx2EyeH3VFZUVUN6/pIonpgBhZxj?=
 =?iso-8859-1?Q?i4lBqubRIVcs/Nut3RFJOhe/jjWCrndaBVR2pI7IXTaEUEjud5yE+LfQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 104506ff-b7aa-418b-144f-08dc41ea718a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 16:43:56.4392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsMXM8BiEtfctgVM2iUOyp+/Va0x/3zMAVN52HKYO4TnYOjRY549z9VxVEL02Bqdc2gM+NCsRucoB6bZaHS9ccU6vFz55M8gFIcn7v+aZZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7446
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

On Mon, Mar 11, 2024 at 12:33:29PM -0400, Rodrigo Vivi wrote:
>On Mon, Mar 11, 2024 at 04:11:59PM +0100, Nirmoy Das wrote:
>> Property struct is not being used so remove it and related dead code.
>>
>> Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

afaics this is only removing dead code since it was not possible to set
those props. I'm wondering if we should really keep the Fixes since
technically we don't need this in 6.8 or 6.9. Thoughts?

Lucas De Marchi
