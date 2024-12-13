Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A579AE7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 14:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FA210F036;
	Fri, 13 Dec 2024 14:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nw6bK0w7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891BE10F036
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734099493; x=1765635493;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yxH9fwx8e+rTk7z8ek/fCDaL08CwYxW7zpcTBuaPh2w=;
 b=Nw6bK0w7jUmz5SQk0PEB25sYlwyNtQtBcySKBEnDJCxWOWUu5KdA3tb4
 PLIMyf5TuOzI1L3XnAVWpc+B/vE4V5gqih6r33ccZyHy7VDnmM/c8sVCl
 xh9wG/jTjRSDygpovAOfJ8OLrUbwh2/5I/xLy4/NQ90KoQEHpTXHD65Lu
 RABcTOH3eL0+cNpZu0aHnqK53Wjo8e8nS/3FibGjsKYTOoYEL/w3o8ZVb
 TF4qSpc0Xk0r+N9JRQfGN09hHtXDCaF+7PylBtWT57DrCkvSqgfTX8noI
 b/ZtQo4Up6SKLnQVaBwWW+2Zzi/2gdazN5dF7ZfGoIi6BQ9+NDMVOJQ/1 g==;
X-CSE-ConnectionGUID: t+t1unQyRuGTT7Yk8NBdKQ==
X-CSE-MsgGUID: DyaZucExTJ6xl2Gb+uhKkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="33879127"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="33879127"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 06:18:12 -0800
X-CSE-ConnectionGUID: nEJRpLELT86SYcGDs9eqBg==
X-CSE-MsgGUID: dKcG8owiSPWmMe+A3XEUnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96435865"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 06:18:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 06:18:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 06:18:11 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 06:18:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yctSOM7YBNo61xIqOA84lfWGVEXMi4M9roNvCxcPFhohbzg4vNz3MsPM1vX3V3ZQpCnTeg0MEVWY0DWR9PU17KLg500GLuXorEYAiN9VErhmXLm8jATdcOOblSsjuC47l5V7haLOCdtg4K5LGyyCWEEXycBDevMIzPlL+1JpkEmoGoQMzj0XS8FqHnijxCkL4wnQoZMJ3/HEymJRcL6ewz87pyC1GfWTqvxX/xzk3/YGVwvEeuMhkb5cG6JmuhVJqDlLNN/FW0ZZ/aclOd/a19bsQEm0Rtyui5QV3k0r951C5f+4x96EvpS6CBOkuOlskiqGXiWwCm6mOx5IurAI/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onGn0yQocaQfIk+sQCgLevyexYwFEQN9Thr5ga6qvYg=;
 b=x6aNAFGZtLZp3SZZsqLA2wxmN+1hbPlXFp5go4aOAkaQbDAIY6/H2ZfphIUavpMUP8OoSZk4tBWeJyWFlVwgysfe44jYogwVWw4uve09m7+IgqVEwwIilMyaBz3Bv6ltipa+jM7Zw0cmSgO+ArqjugJ8suPMALAArrofBZztk3+5UbvR8Ke4GqKRUWuX1ztO7qGnHW8g6UQa0t9f9DQvIudVXXcP7fUa2ooFwW9WDzgANbTk7UhI7+7FZA23F4+pHkSy5fHxTzm+Yzp6BN57klM02nvmbanlExXrhQcTTEKadJBGhoQXDBtQL0bSJtiRbi8VteJc9gWMl7FImkOlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA3PR11MB7653.namprd11.prod.outlook.com (2603:10b6:806:306::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 14:18:08 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 14:18:08 +0000
Date: Fri, 13 Dec 2024 09:18:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@lists.freedesktop.org>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
Message-ID: <Z1xCHJHd4JI3UNVk@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
 <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
 <208f50d9-58e8-413e-915f-95ca077e0fa0@intel.com>
 <dahmzb4tveblm74nwhq5mabz672xivpfeuvkpzb6hnjfs4qrwt@rl6c56v6mfyy>
 <db943f8a-0d92-49bc-827e-46284739e8be@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <db943f8a-0d92-49bc-827e-46284739e8be@intel.com>
X-ClientProxiedBy: MW4PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:303:b6::33) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA3PR11MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: b5439080-ccbf-419e-3fd1-08dd1b80f7a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?0IrOO5SKpcTWidEzBBEQWz8nhJl0DoA0IIDodMXWfJEChH9hIicj2hWntT?=
 =?iso-8859-1?Q?zMFt512sVpcCHktobOg0ruKEZ7wDxo53M+iVyI35MDUi1g4KEi/m0T8O0o?=
 =?iso-8859-1?Q?t2XByTZ9m4e9Gxn3Vby6GbY/Lv1KA+VDJcTZ0xdza8SMs7QPJLHg2CcU2G?=
 =?iso-8859-1?Q?HBYfFiNRp6de5xXy2INJaz3I0zF8xoidkKvpJyxsvRSBZfP28faRc7eLcO?=
 =?iso-8859-1?Q?E8im80vPLMEeJ4EZQefC5Xxsm2wtAb16dJxZ+DV/rrPCo3bq+S+UQ56vx8?=
 =?iso-8859-1?Q?dFJiSRLfPulkL2nF03dMG4J4wjkWDHbEF+qwONf7dJbh7cjHBgNCh4GwRm?=
 =?iso-8859-1?Q?TYheixHJKpXER+6cuBQLG6Ouj2fcc+k720M4zHLNmUPtM0la6e0AGXvO8W?=
 =?iso-8859-1?Q?kjnG9GGZT+A6VzC/Jb7yDhvL/n/7BB3yXfCj/nD6lPq3aEh6rli+MsIv38?=
 =?iso-8859-1?Q?6WnX3TY10mvv9j15cinRK4GIBWqisT6aI1bkoE5EeBtrTRVVT4cIMTuH/2?=
 =?iso-8859-1?Q?tkMPPSQ5NV6Emo50tKiYGTrsxGESKp0wXQTM03VzuA5JrommS5YJdr0Wnk?=
 =?iso-8859-1?Q?K4789oUWwVxkqEAVC8+zojI0PuEtZyh2uLCaApwsfIZP9Iz24pYIL2/TlE?=
 =?iso-8859-1?Q?EU3hQj4qvIKgklru4peO4b2oEbZQgs+y8T3yJSI/Kkwq8r/eAPlqA4e8La?=
 =?iso-8859-1?Q?fuGFm5g3GxSoWeTxRf1g1aehuv8IuWMXnwRsP3Ej3O2ZJ0YsYv97ROTQg3?=
 =?iso-8859-1?Q?ldP2n8IdXo1jeG/uo3DXFYaIGBSe/RW//1avKHvu4AId3D/FeV1N6wBSFZ?=
 =?iso-8859-1?Q?HNkrkiUgMdmKXYP7oDic97RMKPhFtEaXpBgIgUqqfylSScgTdn+d8Glrku?=
 =?iso-8859-1?Q?rDLNA82e6CFj/PuDfHCIFtAcFe5NE+IP4yh3MQgk0H3s4N79v8/2zjHIYh?=
 =?iso-8859-1?Q?6Ks7t3nX+6l3TRP00qZs96GSdwxmR+7Q5zWJi3XDVlHz0GSrLZhMt+mI78?=
 =?iso-8859-1?Q?udXhfosMkOIDBP/1tcFZPmmnPmxTlyl0+b/YFWIN0N4SdgaitMoEN/Gcmk?=
 =?iso-8859-1?Q?T7QFx11JGGyDKQSUGBUn0iGkwdjgJEB3USC7itP3uSdo6WGqe6Q7A2Du+I?=
 =?iso-8859-1?Q?TYlHKIE+szGMhHKMahHV9yLYRISh0AzVx/QfkpCVxNsg+4WLAtw82NR4dK?=
 =?iso-8859-1?Q?J8x+nzrdnoAydFUnXgrOSKIMiyhc+qPoeLRVBWFIAaY0mqRfPIPk/8Qqj+?=
 =?iso-8859-1?Q?OhziyCtbHz3bdQrTXBZL/b6dY2KavUKT3MSP0Ee071POsNQuIfDhMHGN7+?=
 =?iso-8859-1?Q?aAsVBSKyUrIiGfRaf+hSFJ0EjkTOZWu/ntXmGWRivZh0MqJ1/1NnPw+egv?=
 =?iso-8859-1?Q?1MH2wN+21Pq5Eb1hVdfP3tERrrKBh7T3tdVhhchpTrtSKebUN2qqo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RiWb0G981zdIemHwOZmlUJGgjlvGpfUKVuEdOFItE05suISFkcoOMOaUeA?=
 =?iso-8859-1?Q?nI+VkE3RqXZUN4SWfS4OQfoSMhynhHKmGz8ob7Y4cnyYxJpuuzjJMJcuIB?=
 =?iso-8859-1?Q?rSo8XyZCa32GP8RemAMIRbAtrq9+/hsnragDUfngy9HMK1YiEG7l6kVCcT?=
 =?iso-8859-1?Q?yMznbIGwxF7WpDh3EhYSx6MY+EQORugkK7uS/zIe1d9b/r50ZgSjDRU949?=
 =?iso-8859-1?Q?W4gNjwFRZJT0M4SK1lg3hBaZYS16yS3DtKnS8vFB7NbULVG+gzS9TWAu9/?=
 =?iso-8859-1?Q?7DF+PzjV0XqoRpx2A1Q47GU7YgKc0oC9attCzL9zLy1+sy0WqxduLFKs2G?=
 =?iso-8859-1?Q?cLLGKs8mIp+hHeeKYPj1r4q+NK04Hp3Hz2cYMhw8p1KK+vcJZjKViJOLem?=
 =?iso-8859-1?Q?H8N/zZl+4uyGdBnLPGxFGDSSBhv5GMfMJ19TSwLbyZ7Er7pTDNc/5XonD4?=
 =?iso-8859-1?Q?REbjDLAWBQYSxvQkKu9pYrtgtWKKnTL0b0gkNMyF4PxhMWmcAZYkbmIXx0?=
 =?iso-8859-1?Q?+cOtewdTcqEU05nmnaGGWAANPE8S7Ob2cEFtn5oSIc10g3wn4jQMIoeoTd?=
 =?iso-8859-1?Q?wCOf5TBK5SL6UlZmDFhCA4hXve6ja3Eo8mY8V6QXTqw3mWjRwAswzd6Tu7?=
 =?iso-8859-1?Q?iOLKHrNnwDv8Tbwg4ncseXWoLHvz2gLLVOLqKDtQDmWewq8ZFWecJsMLmH?=
 =?iso-8859-1?Q?y0rmfem6uur3+0jouTeDsiUvkh+N1bvsI0G4Yt1A9I+9gdgP418SaCpysM?=
 =?iso-8859-1?Q?ZDnvE7Bvp7pqpMbVVQj19f3qqxiFmanIsG6aNW46CPSHHXSpPs0ApzkZNe?=
 =?iso-8859-1?Q?gVnOgw4YEfd4FG+tLlDZOn4fmnVAFv4IPX6mSsH+MK7L4SGITtPdR/570w?=
 =?iso-8859-1?Q?oJnTcuAuSNNP+55haLp3menIkQG9wYdCgFW76GR0fur9A30yW5vzjZsr7W?=
 =?iso-8859-1?Q?6O7mFBfSV9+mb1Wjhbr0G9gBnSB40hF+UxM7eCBa/sQ96lNVBPiCKYtNTS?=
 =?iso-8859-1?Q?IVNhsKqgklxJTO3U/0Pam67VHrHHZcjJzIGa34jJmIkvBvx5cB1WOpxeQd?=
 =?iso-8859-1?Q?0spM50AcIIglQ9xX7X4ihhPdRI8jci8eKUht18NbxqyaQOliMYS721+1ij?=
 =?iso-8859-1?Q?N5cGGfnHFc5v+WSxdsitgRA4+4MNkx0EfiOAb5IxYbcO2cHvESHWgwaHj2?=
 =?iso-8859-1?Q?RdjundVwhcd1D9bGZT84peiC0rMlmcXpBFZeAqMIb3+ZqXcSR76KbvHhNr?=
 =?iso-8859-1?Q?ZUbMNEjiAASBpP5RMyHB/DfYQ1mOETXSrKGHlzeFOSGl6Jkkt2Oqetwh9l?=
 =?iso-8859-1?Q?DOabkrdLTLTKorXPzoMhuhmytEyGdIJkq798eL/ku35HiuYpoaMFsDzsHs?=
 =?iso-8859-1?Q?aUh/PAzVDvk35u88oMjSeUpd/TbzK17jDpk6iroBhABaiMHAC813NDHMK4?=
 =?iso-8859-1?Q?0/r58j+AuQhsIctcPjq0cjKfkaaFCcdWzMzCciSFsAWHvVHTi4GOSS5EUI?=
 =?iso-8859-1?Q?aQ+sV70CjT4W6KqeCQUqKmuQplnesHmkcM3DmwqIfj2QoCtZzT7cmBuKKY?=
 =?iso-8859-1?Q?of/9XuOGXgLwge2sT5jvwLK3oTJ9tguijtXkjNrVe1Tx6y/Jznwi96LHdY?=
 =?iso-8859-1?Q?dY0UE5Q608OHo4+mvE45g7dT1SHRRO7ADNMBqc+3erI8Zrfipn8tgkKA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5439080-ccbf-419e-3fd1-08dd1b80f7a6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 14:18:08.3528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Va+5rKvur564iuA8H/ugnpacdEvYfZ83O/AW5RtbHSsbp6PsR/fRXH2SJOOlM5VPUGSVAQpViOT3tzHA5CnHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7653
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

On Thu, Dec 12, 2024 at 01:04:23PM -0800, John Harrison wrote:
> On 12/12/2024 12:52, Lucas De Marchi wrote:
> > On Thu, Dec 12, 2024 at 11:14:23AM -0800, John Harrison wrote:
> > > On 12/12/2024 10:45, Lucas De Marchi wrote:
> > > > On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
> > > > > On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
> > > > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > > > 
> > > > > > There is a need to include the GuC log and other large binary objects
> > > > > > in core dumps and via dmesg. So add a helper for dumping to a printer
> > > > > > function via conversion to ASCII85 encoding.
> > > > > > 
> > > > > > Another issue with dumping such a large buffer is that
> > > > > > it can be slow,
> > > > > > especially if dumping to dmesg over a serial port. So add a yield to
> > > > > > prevent the 'task has been stuck for 120s' kernel hang check feature
> > > > > > from firing.
> > > > > > 
> > > > > > v2: Add a prefix to the output string. Fix memory allocation bug.
> > > > > > v3: Correct a string size calculation and clean up a define (review
> > > > > > feedback from Julia F).
> > > > > > 
> > > > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > > > Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_devcoredump.c | 87
> > > > > > +++++++++++++++++++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
> > > > > >  2 files changed, 93 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > index 2690f1d1cde4..0884c49942fe 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > @@ -6,6 +6,7 @@
> > > > > >  #include "xe_devcoredump.h"
> > > > > >  #include "xe_devcoredump_types.h"
> > > > > > 
> > > > > > +#include <linux/ascii85.h>
> > > > > >  #include <linux/devcoredump.h>
> > > > > >  #include <generated/utsrelease.h>
> > > > > > 
> > > > > > @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device *xe)
> > > > > >  }
> > > > > > 
> > > > > >  #endif
> > > > > > +
> > > > > > +/**
> > > > > > + * xe_print_blob_ascii85 - print a BLOB to some useful
> > > > > > location in ASCII85
> > > > > > + *
> > > > > > + * The output is split to multiple lines because some
> > > > > > print targets, e.g. dmesg
> > > > > > + * cannot handle arbitrarily long lines. Note also that
> > > > > > printing to dmesg in
> > > > > > + * piece-meal fashion is not possible, each separate
> > > > > > call to drm_puts() has a
> > > > > > + * line-feed automatically added! Therefore, the entire
> > > > > > output line must be
> > > > > > + * constructed in a local buffer first, then printed in
> > > > > > one atomic output call.
> > > > > > + *
> > > > > > + * There is also a scheduler yield call to prevent the
> > > > > > 'task has been stuck for
> > > > > > + * 120s' kernel hang check feature from firing when
> > > > > > printing to a slow target
> > > > > > + * such as dmesg over a serial port.
> > > > > > + *
> > > > > > + * TODO: Add compression prior to the ASCII85 encoding
> > > > > > to shrink huge buffers down.
> > > > > > + *
> > > > > > + * @p: the printer object to output to
> > > > > > + * @prefix: optional prefix to add to output string
> > > > > > + * @blob: the Binary Large OBject to dump out
> > > > > > + * @offset: offset in bytes to skip from the front of
> > > > > > the BLOB, must be a multiple of sizeof(u32)
> > > > > > + * @size: the size in bytes of the BLOB, must be a
> > > > > > multiple of sizeof(u32)
> > > > > > + */
> > > > > > +void xe_print_blob_ascii85(struct drm_printer *p, const
> > > > > > char *prefix,
> > > > > > +               const void *blob, size_t offset, size_t size)
> > > > > > +{
> > > > > > +    const u32 *blob32 = (const u32 *)blob;
> > > > > > +    char buff[ASCII85_BUFSZ], *line_buff;
> > > > > > +    size_t line_pos = 0;
> > > > > > +
> > > > > > +#define DMESG_MAX_LINE_LEN    800
> > > > > > +#define MIN_SPACE        (ASCII85_BUFSZ + 2)        /*
> > > > > > 85 + "\n\0" */
> > > > > > +
> > > > > > +    if (size & 3)
> > > > > > +        drm_printf(p, "Size not word aligned: %zu", size);
> > > > > > +    if (offset & 3)
> > > > > > +        drm_printf(p, "Offset not word aligned: %zu", size);
> > > > > > +
> > > > > > +    line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
> > > > > > +    if (IS_ERR_OR_NULL(line_buff)) {
> > > > > > +        drm_printf(p, "Failed to allocate line buffer:
> > > > > > %pe", line_buff);
> > > > > > +        return;
> > > > > > +    }
> > > > > > +
> > > > > > +    blob32 += offset / sizeof(*blob32);
> > > > > > +    size /= sizeof(*blob32);
> > > > > > +
> > > > > > +    if (prefix) {
> > > > > > +        strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN -
> > > > > > MIN_SPACE - 2);
> > > > > > +        line_pos = strlen(line_buff);
> > > > > > +
> > > > > > +        line_buff[line_pos++] = ':';
> > > > > > +        line_buff[line_pos++] = ' ';
> > > > > > +    }
> > > > > > +
> > > > > > +    while (size--) {
> > > > > > +        u32 val = *(blob32++);
> > > > > > +
> > > > > > +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
> > > > > > +            DMESG_MAX_LINE_LEN - line_pos);
> > > > > > +        line_pos += strlen(line_buff + line_pos);
> > > > > > +
> > > > > > +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
> > > > > > +            line_buff[line_pos++] = '\n';
> > > > > > +            line_buff[line_pos++] = 0;
> > > > > 
> > > > > This breaks ascii85 parser that we had up to now.
> > > It should not break the decoding of existing sections. This helper
> > > is only being used for the new GuC objects at present. As per the
> > > TODO, the intent is to use it for all blobs in the future. But that
> > > was deliberately left to a future update (which hasn't been posted
> > > yet) to avoid breaking the mesa tool.
> > 
> > it broke nonetheless because then it fails to decode this line the way
> > it was doing:  each line starts a new key.
> It barfs on any line it doesn't understand? Seems like it could be made to
> be more robust in general.

We do not break userspace.
When we do we do not blame userspace.

I had warned it and was ignored:

"We shouldn't be breaking the current userspace tools. Any change like this would
need to be synchronized between all the current decode tools."

[1] https://lore.kernel.org/intel-xe/ZuLzSMH_hBl9RWdv@intel.com/ and ignored 

Next time, please respect the only Linux rule: No regression.

Revert sent and applying it soon...

> 
> > 
> > > 
> > > 
> > > > > And I think there is not safe way to parse it now, how would
> > > > > the parser know that the blob reach to end?
> > > The GuC decoder tool simply ignores leading/trailing whitespace and
> > > keeps decoding until it finds a line with a new field - i.e.
> > > anything with a non-ASCII85 character such as ':' or '*'. It is
> > > totally
> > 
> > character set for ascii85 is [33, 117] and 122, which includes both ':'
> > and '*'. Hopefully it's hard to hit a collision, but we shouldn't design
> > it in a way that is possible.
> Sorry, getting myself confused - it was a while ago when I was writing this.
> Yes, punctuation marks are part of the ASCII85 character set.
> 
> The GuC decoder looks for white space - a blank line or a line with a space
> in it. Any new field is guaranteed to be "name: data" so will have a space.
> And sections are delimited with blank lines, plus section headers are "****
> name ****" so also guaranteed to have a space.
> 
> John.
> 
> 
> > 
> > 
> > > reliable for me.
> > > 
> > > > 
> > > > Just looked at this code to check if we also had a "Size" as I remember
> > > > seeing it in previous related patches, but we don't. If
> > > > we did then you could use that to calculate how much you still had to
> > > > read, ignoring the \n. With the current scheme I think one
> > > > way would be to continue the previous key when the line doesn't start
> > > > with a new key. Awful, yes, and not future proof.
> > > Any new field is guaranteed to have a colon in it and any new
> > > section header is guaranteed to have a star in it. Sounds pretty
> > > reliable to me.
> > 
> > that's what I said by "continue the previous key when the line doesn't
> > start with a new one".
> > 
> > 
> > > 
> > > The other option would be to have an explicit prefix at the start of
> > > each continuation line. E.g. "A85:".
> > 
> > let's not make it worse than it already is. And not future proof by
> > given the encoding algorithm the meaning of "continuation line".
> > 
> > Lucas De Marchi
> > 
> > > 
> > > The problem with a size field is that ASCII85 encoding is data
> > > dependent - it has extremely basic run length encoding of strings of
> > > zeros. So you only know the size after the encoding is complete.
> > > Which means either the size field is in the dump after the encoded
> > > data (which is therefore useless) or you can't stream the encode and
> > > must encode to an in-memory buffer first, then print the size, then
> > > print your pre-encoded data.
> > > 
> > > 
> > > > 
> > > > John, I explicitly said *we can't break the existent users*,
> > > > pointed to the one in the mesa repo and confirmed with José it would be
> > > > indeed a breakage. Please check again the past email thread at
> > > > https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/
> > > > 
> > > > 
> > > That discussion was a question for Jose not a statement. As there
> > > was no response for several weeks, I assumed that it wasn't a
> > > problem after all.
> > > 
> > > > 
> > > > Did you at least prepare the mesa parser for that additional \n?
> > > > 
> > > > We shouldn't have merged the kernel patch as is with the excuse
> > > > it reads
> > > > better in dmesg, when we also said we should not print that garbage to
> > > > dmesg :(
> > > Not following. Should not print what garbage in dmesg? As I keep
> > > saying, none of this goes to dmesg by default except in the case of
> > > catastrophic CT failure. And in that case, it is extremely useful
> > > and the only way to debug issues.
> > > 
> > > John.
> > > 
> > > > 
> > > > Lucas De Marchi
> > > 
> 
